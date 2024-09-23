@implementation VUIStoreFPSKeyLoader

+ (void)_loadFPSURLsFromStoreBagWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v3 = a3;
  v4 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "Retrieving certificate URL and key server URL from store bag", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("fps-cert"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB1840], "app");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringForKey:", CFSTR("fps-request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke;
  block[3] = &unk_1E9F99778;
  v15 = v9;
  v16 = v10;
  v17 = v3;
  v11 = v3;
  v12 = v10;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

+ (void)preFetchFPSCertificate
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Prefetching store FPS certificate", v3, 2u);
  }
  +[VUIStoreFPSKeyLoader _loadFPSURLsFromStoreBagWithCompletion:](VUIStoreFPSKeyLoader, "_loadFPSURLsFromStoreBagWithCompletion:", &__block_literal_global_6);
}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_5);
}

uint64_t __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (a1[4] && a1[5])
  {
    v2 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Finished retrieving certificate URL and key server URL from store bag", v4, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
  {
    __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __63__VUIStoreFPSKeyLoader__loadFPSURLsFromStoreBagWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Error retrieving URLs from bag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

uint64_t __46__VUIStoreFPSKeyLoader_preFetchFPSCertificate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:completion:](VUIStoreFPSKeyLoader, "_loadAndCacheCertificateDataForValidURL:completion:", a2, 0);
  return result;
}

void __34__VUIStoreFPSKeyLoader_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_0;
  sLogObject_0 = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v3 = (void *)sOperationQueue;
  sOperationQueue = (uint64_t)v2;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)sCachedCertData;
  sCachedCertData = (uint64_t)v4;

}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = sLogObject_0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Updating cached cert data for URL %@", buf, 0xCu);
    }
    objc_msgSend((id)sCachedCertData, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2_cold_1(a1, v3, v6, v7, v8, v9, v10, v11);
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0DB1FB0], -345001, v13);

  }
  v15 = *(_QWORD *)(a1 + 56);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, *(_QWORD *)(a1 + 32), v5);

}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2;
  v10[3] = &unk_1E9F997A0;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v13 = v7;
  v14 = *(id *)(a1 + 40);
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

+ (void)_loadAndCacheCertificateDataForValidURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v5);
  objc_msgSend(v7, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v7, "setTimeoutInterval:", 30.0);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke;
  v15 = &unk_1E9F997C8;
  v16 = v5;
  v17 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "dataTaskWithURL:completionHandler:", v10, &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resume", v12, v13, v14, v15);
}

+ (unint64_t)maximumRequestBatchSize
{
  return 20;
}

- (VUIStoreFPSKeyLoader)initWithCertificateURL:(id)a3 keyServerURL:(id)a4
{
  id v6;
  id v7;
  VUIStoreFPSKeyLoader *v8;
  uint64_t v9;
  NSURL *certificateURL;
  uint64_t v11;
  NSURL *keyServerURL;
  NSMutableArray *v13;
  NSMutableArray *requestsAwaitingCertFetch;
  NSMutableDictionary *v15;
  NSMutableDictionary *keyIdentifierPenaltyBox;
  void *v17;
  double v18;
  void *v19;
  double v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)VUIStoreFPSKeyLoader;
  v8 = -[VUIStoreFPSKeyLoader init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    certificateURL = v8->_certificateURL;
    v8->_certificateURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    keyServerURL = v8->_keyServerURL;
    v8->_keyServerURL = (NSURL *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestsAwaitingCertFetch = v8->_requestsAwaitingCertFetch;
    v8->_requestsAwaitingCertFetch = v13;

    v8->_usesKeyIdentifierPenaltyBox = 1;
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyIdentifierPenaltyBox = v8->_keyIdentifierPenaltyBox;
    v8->_keyIdentifierPenaltyBox = v15;

    v8->_state = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleForKey:", *MEMORY[0x1E0DC6B00]);
    v8->_downloadExpirationPeriodOverrideInSeconds = v18;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleForKey:", *MEMORY[0x1E0DC6AF0]);
    v8->_availabilityPeriodOverrideInSeconds = v20;

  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIStoreFPSKeyLoader deallocated", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)VUIStoreFPSKeyLoader;
  -[VUIStoreFPSKeyLoader dealloc](&v4, sel_dealloc);
}

- (void)loadFairPlayStreamingKeyRequests:(id)a3 completion:(id)a4
{
  __CFString *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t k;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void (**v49)(void);
  id v50;
  id v51;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  void (**v59)(void);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[16];
  id buf[2];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v49 = (void (**)(void))a4;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v68;
    v4 = CFSTR("%@%@");
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v68 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *MEMORY[0x1E0DB1E98];
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "eventReportingID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addStartEventWithName:identifier:", v12, v15);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setRequestStartDate:", v16);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v7);
  }
  if (-[VUIStoreFPSKeyLoader state](self, "state"))
  {
    v17 = -[VUIStoreFPSKeyLoader state](self, "state");
    v18 = sLogObject_0;
    v19 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Certificate data loading in progress.  Waiting for certificate data before continuing requests", (uint8_t *)buf, 2u);
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v50 = v6;
      v20 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v55;
        v22 = (uint64_t *)MEMORY[0x1E0DB1E90];
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v55 != v21)
              objc_enumerationMutation(v50);
            v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            -[VUIStoreFPSKeyLoader requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v24);

            -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *v22;
            v28 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v24, "eventReportingID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@"), v27, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addStartEventWithName:identifier:", v27, v30);

          }
          v20 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
        }
        while (v20);
      }

    }
    else
    {
      if (v19)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "Certificate data already loaded.  Loading key requests immediately", (uint8_t *)buf, 2u);
      }
      -[VUIStoreFPSKeyLoader _initiateKeyRequests:completion:](self, "_initiateKeyRequests:completion:", v6, v49);
    }
    goto LABEL_48;
  }
  -[VUIStoreFPSKeyLoader certificateURL](self, "certificateURL");
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    -[VUIStoreFPSKeyLoader keyServerURL](self, "keyServerURL");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_34;
  }
  -[VUIStoreFPSKeyLoader certificateURL](self, "certificateURL");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[VUIStoreFPSKeyLoader keyServerURL](self, "keyServerURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    else

    if (v33)
    {
LABEL_34:
      -[VUIStoreFPSKeyLoader setState:](self, "setState:", 1);
      -[VUIStoreFPSKeyLoader requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v6);

      objc_initWeak(buf, self);
      v36 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "Starting certificate data loading.  Waiting for certificate data before continuing requests", v65, 2u);
      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v51 = v6;
      v37 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v62;
        v39 = (uint64_t *)MEMORY[0x1E0DB1E90];
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v62 != v38)
              objc_enumerationMutation(v51);
            v41 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
            -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = *v39;
            v44 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v41, "eventReportingID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@%@"), v43, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addStartEventWithName:identifier:", v43, v46);

          }
          v37 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
        }
        while (v37);
      }

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __68__VUIStoreFPSKeyLoader_loadFairPlayStreamingKeyRequests_completion___block_invoke;
      v58[3] = &unk_1E9F996D8;
      objc_copyWeak(&v60, buf);
      v59 = v49;
      -[VUIStoreFPSKeyLoader _loadCertificateDataWithCompletion:](self, "_loadCertificateDataWithCompletion:", v58);

      objc_destroyWeak(&v60);
      objc_destroyWeak(buf);
      goto LABEL_48;
    }
  }
  else
  {

    if (v31)
      v34 = v31;
    else
      v34 = v4;

  }
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
    -[VUIStoreFPSKeyLoader loadFairPlayStreamingKeyRequests:completion:].cold.1();
  v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v48 = (void *)objc_msgSend(v47, "initWithDomain:code:userInfo:", *MEMORY[0x1E0DB1FB0], -345002, 0);
  -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v6, v48);

  if (v49)
    v49[2]();
LABEL_48:

}

void __68__VUIStoreFPSKeyLoader_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v24 = a1;
  v25 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requestsAwaitingCertFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(WeakRetained, "requestsAwaitingCertFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "eventCollection");
        v15 = WeakRetained;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x1E0DB1E90];
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "eventReportingID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@"), v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addEndEventWithName:identifier:", v17, v20);

        WeakRetained = v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v26, "length"))
  {
    v21 = sLogObject_0;
    v22 = v25;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_DEFAULT, "Certificate data has valid length.  Continuing key request loading for pending requests", buf, 2u);
    }
    objc_msgSend(WeakRetained, "setState:", 2);
    objc_msgSend(WeakRetained, "setCertificateData:", v26);
    objc_msgSend(WeakRetained, "_initiateKeyRequests:completion:", v9, *(_QWORD *)(v24 + 32));
  }
  else
  {
    objc_msgSend(WeakRetained, "setState:", 0);
    v22 = v25;
    objc_msgSend(WeakRetained, "_failKeyRequests:withError:", v9, v25);
    v23 = *(_QWORD *)(v24 + 32);
    if (v23)
      (*(void (**)(void))(v23 + 16))();
  }

}

- (void)invalidateKeysWithRequests:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject **v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject **v26;
  VUIStoreFPSKeyLoader *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void (**v33)(_QWORD);
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[VUIStoreFPSKeyLoader secureInvalidationNonceURL](self, "secureInvalidationNonceURL");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[VUIStoreFPSKeyLoader keyServerURL](self, "keyServerURL");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[VUIStoreFPSKeyLoader secureInvalidationDSID](self, "secureInvalidationDSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v33 = v7;
        v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v34 = v6;
        v13 = v6;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        v15 = (NSObject **)&unk_1EDACA000;
        if (!v14)
          goto LABEL_21;
        v16 = v14;
        v17 = *(_QWORD *)v39;
        v18 = 0x1E0C99000;
        while (1)
        {
          v19 = 0;
          v36 = v16;
          do
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v13);
            v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v19);
            objc_msgSend(v20, "offlineKeyData", v33);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v21, "length"))
              goto LABEL_15;
            objc_msgSend(v20, "keyIdentifier");
            v22 = objc_claimAutoreleasedReturnValue();
            if (!v22)
              goto LABEL_15;
            v23 = (void *)v22;
            objc_msgSend(v20, "additionalRequestParams");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v24, "count"))
            {

              v18 = 0x1E0C99000uLL;
LABEL_15:

              goto LABEL_16;
            }
            objc_msgSend(v20, "contentID");
            v25 = v17;
            v26 = v15;
            v27 = self;
            v28 = v13;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v29, "length");

            v13 = v28;
            self = v27;
            v15 = v26;
            v17 = v25;
            v16 = v36;

            v18 = 0x1E0C99000;
            if (v37)
            {
              objc_msgSend(v35, "addObject:", v20);
              goto LABEL_19;
            }
LABEL_16:
            v30 = v15[90];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v20;
              _os_log_error_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_ERROR, "Param error invalidating key request: %@", buf, 0xCu);
            }
            v42 = v20;
            objc_msgSend(*(id *)(v18 + 3360), "arrayWithObjects:count:", &v42, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v31, 0);

LABEL_19:
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          if (!v16)
          {
LABEL_21:

            if (objc_msgSend(v35, "count"))
            {
              v7 = v33;
              -[VUIStoreFPSKeyLoader _invalidateValidKeyRequestsInBatches:completion:](self, "_invalidateValidKeyRequestsInBatches:completion:", v35, v33);
              v6 = v34;
            }
            else
            {
              v32 = v15[90];
              v7 = v33;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "No key requests to invalidate.", buf, 2u);
              }
              v6 = v34;
              if (v33)
                v33[2](v33);
            }

            goto LABEL_33;
          }
        }
      }
    }
    else
    {

    }
  }
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
    -[VUIStoreFPSKeyLoader invalidateKeysWithRequests:completion:].cold.1();
  -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v6, 0);
  if (v7)
    v7[2](v7);
LABEL_33:

}

- (void)sendStreamingStopRequestIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[VUIStoreFPSKeyLoader savedStreamingKeyRequestToUseForStopping](self, "savedStreamingKeyRequestToUseForStopping");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _sendKeyRequestsToServer:isStopRequest:isSecureInvalidationRequest:completion:](self, "_sendKeyRequestsToServer:isStopRequest:isSecureInvalidationRequest:completion:", v5, 1, 0, 0);

    -[VUIStoreFPSKeyLoader setSavedStreamingKeyRequestToUseForStopping:](self, "setSavedStreamingKeyRequestToUseForStopping:", 0);
  }

}

- (void)removeAllEntriesFromKeyIdentifierPenaltyBox
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "Removing all entries from key identifier penalty box", v5, 2u);
  }
  -[VUIStoreFPSKeyLoader keyIdentifierPenaltyBox](self, "keyIdentifierPenaltyBox");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)_loadCertificateDataWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(void *, void *);
  id v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E9F99728;
  objc_copyWeak(&v17, &location);
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[VUIStoreFPSKeyLoader certificateURL](self, "certificateURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VUIStoreFPSKeyLoader certificateURL](self, "certificateURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addStartEventWithName:", *MEMORY[0x1E0DB1EB8]);

    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_2;
    v11[3] = &unk_1E9F99750;
    objc_copyWeak(&v14, &location);
    v12 = v7;
    v13 = v6;
    +[VUIStoreFPSKeyLoader _loadFPSURLsFromStoreBagWithCompletion:](VUIStoreFPSKeyLoader, "_loadFPSURLsFromStoreBagWithCompletion:", v11);

    objc_destroyWeak(&v14);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend((id)sCachedCertData, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = sLogObject_0;
  v8 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Using cached cert data for %@.  Refreshing cert data, but not waiting for response", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "eventCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EC0], MEMORY[0x1E0C9AAB0]);

    +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:completion:](VUIStoreFPSKeyLoader, "_loadAndCacheCertificateDataForValidURL:completion:", v3, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v3;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "No cached cert data available for %@.  Fetching cert data and waiting for response", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "eventCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1EC0], MEMORY[0x1E0C9AAA0]);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_17;
    v11[3] = &unk_1E9F99700;
    v12 = *(id *)(a1 + 32);
    +[VUIStoreFPSKeyLoader _loadAndCacheCertificateDataForValidURL:completion:](VUIStoreFPSKeyLoader, "_loadAndCacheCertificateDataForValidURL:completion:", v3, v11);

  }
}

uint64_t __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__VUIStoreFPSKeyLoader__loadCertificateDataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCertificateURL:", v7);
  objc_msgSend(WeakRetained, "setKeyServerURL:", v9);

  objc_msgSend(WeakRetained, "eventCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEndEventWithName:", *MEMORY[0x1E0DB1EB8]);

  if (v7 && v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0DB1FB0], -345002, v12);
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v15);

  }
}

- (void)_invalidateValidKeyRequestsInBatches:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  id location;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v8 = objc_msgSend(v6, "count");
    if (v8 >= 0x14)
      v9 = 20;
    else
      v9 = v8;
    objc_msgSend(v6, "subarrayWithRange:", 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", v9, objc_msgSend(v6, "count") - v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)sLogObject_0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134217984;
      v25 = v13;
      _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Starting batch of %lu invalidation requests", buf, 0xCu);
    }

    v14 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v14, OS_LOG_TYPE_DEFAULT, "Loading nonce data from server", buf, 2u);
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke;
    v18[3] = &unk_1E9F997F0;
    objc_copyWeak(&v22, &location);
    v15 = v10;
    v19 = v15;
    v16 = v11;
    v20 = v16;
    v21 = v7;
    -[VUIStoreFPSKeyLoader _loadNonceDataForRequests:completion:](self, "_loadNonceDataForRequests:completion:", v15, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Done with all invalidation key request batches", buf, 2u);
    }
    if (v7)
      v7[2](v7);
  }

}

void __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        objc_msgSend(v9, "secureInvalidationNonceData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          objc_msgSend(WeakRetained, "delegate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0
            && !objc_msgSend(v12, "storeFPSKeyLoader:shouldKeyRequestContinueInvalidationAfterLoadingNonce:", WeakRetained, v9))
          {
            v13 = sLogObject_0;
            if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v29 = (uint64_t)v9;
              _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Delegate disallowed invalidation after nonce retrieval for key request %@", buf, 0xCu);
            }
          }
          else
          {
            objc_msgSend(v3, "addObject:", v9);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      v6 = v14;
    }
    while (v14);
  }

  v15 = (void *)sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v17;
    _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "%lu request(s) have nonce data", buf, 0xCu);

  }
  if (objc_msgSend(v3, "count"))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_33;
    v19[3] = &unk_1E9F997A0;
    v20 = v3;
    v21 = WeakRetained;
    v22 = *(id *)(v18 + 40);
    v23 = *(id *)(v18 + 48);
    objc_msgSend(WeakRetained, "_generateSecureInvalidationDataForRequests:completion:", v20, v19);

  }
  else
  {
    objc_msgSend(WeakRetained, "_invalidateValidKeyRequestsInBatches:completion:", *(_QWORD *)(v18 + 40), *(_QWORD *)(v18 + 48));
  }

}

void __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_33(id *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "keyRequestData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");

        if (v10)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  v11 = objc_msgSend(v2, "count");
  v12 = a1[5];
  if (v11)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_2;
    v13[3] = &unk_1E9F99778;
    v13[4] = v12;
    v14 = a1[6];
    v15 = a1[7];
    objc_msgSend(v12, "_sendKeyRequestsToServer:isStopRequest:isSecureInvalidationRequest:completion:", v2, 1, 1, v13);

  }
  else
  {
    objc_msgSend(a1[5], "_invalidateValidKeyRequestsInBatches:completion:", a1[6], a1[7]);
  }

}

uint64_t __72__VUIStoreFPSKeyLoader__invalidateValidKeyRequestsInBatches_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateValidKeyRequestsInBatches:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_loadNonceDataForRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void (**v35)(void);
  VUIStoreFPSKeyLoader *val;
  void *v37;
  id obj;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  VUIStoreFPSKeyLoader *v44;
  void (**v45)(void);
  id v46;
  id location;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = (void (**)(void))a4;
  v7 = objc_alloc(MEMORY[0x1E0CB3998]);
  val = self;
  -[VUIStoreFPSKeyLoader secureInvalidationNonceURL](self, "secureInvalidationNonceURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithURL:resolvingAgainstBaseURL:", v8, 0);

  v37 = v9;
  objc_msgSend(v9, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "mutableCopy");

  v39 = (id)v11;
  if (!v11)
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v16 = objc_alloc(MEMORY[0x1E0CB39D8]);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "contentID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("contentId"), v19);

        if (v20)
          objc_msgSend(v39, "addObject:", v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v12);
  }

  objc_msgSend(v37, "setQueryItems:", v39);
  objc_msgSend(v37, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_initWeak(&location, val);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v21);
    objc_msgSend(v22, "setHTTPMethod:", CFSTR("GET"));
    -[VUIStoreFPSKeyLoader secureInvalidationDSID](val, "secureInvalidationDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setValue:forHTTPHeaderField:", v24, CFSTR("X-Secure-Invalidation-Dsid"));

    objc_msgSend(v22, "setTimeoutInterval:", 30.0);
    objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC80]), "initWithBag:", v25);
    objc_msgSend(v26, "setAnisetteType:", 2);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E0CFD7B0]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = obj;
      _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Waiting for account promise for nonce requests: %@", buf, 0xCu);
    }
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke;
    v40[3] = &unk_1E9F99890;
    v41 = obj;
    v30 = v26;
    v42 = v30;
    v31 = v22;
    v43 = v31;
    objc_copyWeak(&v46, &location);
    v44 = val;
    v45 = v35;
    objc_msgSend(v28, "addFinishBlock:", v40);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  else
  {
    v32 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "Unable to construct valid nonce URL", buf, 2u);
    }
    v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", *MEMORY[0x1E0DB1FB0], -345007, 0);
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](val, "_failKeyRequests:withError:", obj, v34);

    if (v35)
      v35[2]();
  }

}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Account promise completed for nonce requests.  Waiting for URL request promise for nonce requests: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "setAccount:", v5);
  objc_msgSend(*(id *)(a1 + 40), "requestByEncodingRequest:parameters:", *(_QWORD *)(a1 + 48), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_45;
  v11[3] = &unk_1E9F99868;
  v12 = *(id *)(a1 + 32);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  v10 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v10;
  objc_msgSend(v9, "addFinishBlock:", v11);

  objc_destroyWeak(&v15);
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_45(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int8x16_t v12;
  _QWORD block[4];
  int8x16_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    *(_DWORD *)buf = 138412802;
    v21 = v8;
    v22 = 2112;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "URL request promise completed for nonce requests: %@ with URL request %@ error %@", buf, 0x20u);
  }
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_2;
    block[3] = &unk_1E9F99840;
    v12 = *((int8x16_t *)a1 + 2);
    v11 = (id)v12.i64[0];
    v14 = vextq_s8(v12, v12, 8uLL);
    v15 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFDCA0], "defaultSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataTaskPromiseWithRequest:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47;
    v16[3] = &unk_1E9F99818;
    objc_copyWeak(&v19, a1 + 7);
    v17 = a1[4];
    v18 = a1[6];
    objc_msgSend(v10, "addFinishBlock:", v16);

    objc_destroyWeak(&v19);
  }

}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD block[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  void *v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "data");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 || !v8)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47_cold_2();
    objc_msgSend(WeakRetained, "_failKeyRequests:withError:", a1[4], v6);
  }
  else
  {
    v54 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v54);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v54;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = v10;
      v38 = WeakRetained;
      v35 = v5;
      objc_msgSend(v10, "vui_arrayForKey:", CFSTR("nonces"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = objc_msgSend(v41, "count");
        v14 = objc_msgSend(a1[4], "count");
        *(_DWORD *)buf = 134218240;
        v59 = v13;
        v60 = 2048;
        v61 = v14;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Received %lu nonce(s) for %lu request(s)s", buf, 0x16u);

      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v34 = a1;
      obj = a1[4];
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v42)
      {
        v40 = *(_QWORD *)v51;
        v37 = *MEMORY[0x1E0DB1FB0];
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v51 != v40)
              objc_enumerationMutation(obj);
            v43 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v43, "contentID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v17 = v41;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v47;
              while (2)
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v47 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v23 = v22;
                    objc_msgSend(v23, "vui_stringForKey:", CFSTR("content-id"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = v24;
                    if (v16 && v24 && (objc_msgSend(v24, "isEqualToString:", v16) & 1) != 0)
                    {
                      objc_msgSend(v23, "vui_stringForKey:", CFSTR("nonce"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v26, 0);
                      objc_msgSend(v43, "setSecureInvalidationNonceData:", v27);

                      goto LABEL_25;
                    }

                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
                if (v19)
                  continue;
                break;
              }
            }
LABEL_25:

            objc_msgSend(v43, "secureInvalidationNonceData");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "length");

            if (!v29)
            {
              v55 = v43;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v37, -345007, 0);
              objc_msgSend(v38, "_failKeyRequests:withError:", v30, v31);

            }
          }
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v42);
      }

      v6 = 0;
      v5 = v35;
      WeakRetained = v38;
      a1 = v34;
      v10 = v33;
      v32 = v36;
    }
    else
    {
      v32 = v36;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47_cold_1();
      objc_msgSend(WeakRetained, "_failKeyRequests:withError:", a1[4], v36);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_56;
  block[3] = &unk_1E9F98E68;
  v45 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_failKeyRequests:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_generateSecureInvalidationDataForFirstRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1920]), "initWithContentKeyLoader:avAsset:", 0, 0);
    -[VUIStoreFPSKeyLoader setContentKeySession:](self, "setContentKeySession:", v9);

    v10 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Generating secure invalidation data for %@", buf, 0xCu);
    }
    -[VUIStoreFPSKeyLoader contentKeySession](self, "contentKeySession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "offlineKeyData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureInvalidationNonceData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke;
    v16[3] = &unk_1E9F998B8;
    objc_copyWeak(&v20, &location);
    v14 = v8;
    v17 = v14;
    v18 = v6;
    v19 = v7;
    objc_msgSend(v11, "makeSecureInvalidationDataForOfflineKeyData:nonceData:completion:", v12, v13, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  else
  {
    v15 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Done generating secure invalidation data", buf, 2u);
    }
    if (v7)
      v7[2](v7);
  }

}

void __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setKeyRequestData:", v5);
    v8 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "Secure invalidation data successfully generated for %@", buf, 0xCu);
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_failKeyRequests:withError:", v10, v6);

    v11 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke_cold_1((_QWORD *)(a1 + 32), (uint64_t)v6, v11);
  }
  objc_msgSend(WeakRetained, "setContentKeySession:", 0);
  objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_generateSecureInvalidationDataForFirstRequest:completion:", v12, *(_QWORD *)(a1 + 48));

}

- (void)_initiateKeyRequests:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_62);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v9;
  }
  else
  {
    v10 = v11;
  }
  v12 = v10;
  -[VUIStoreFPSKeyLoader _startKeyRequestsInBatches:completion:](self, "_startKeyRequestsInBatches:completion:", v10, v6);

}

uint64_t __56__VUIStoreFPSKeyLoader__initiateKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    v7 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    if (v6)
      v8 = -1;
    else
      v8 = 0;
    if (v5)
      v7 = 1;
    else
      v7 = v8;
  }

  return v7;
}

- (void)_startKeyRequestsInBatches:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void (**v34)(_QWORD);
  void *v35;
  void *v36;
  id obj;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v36 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v34 = v6;
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v45 != v9)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "contentID");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
            v12 = (__CFString *)v11;
          else
            v12 = &stru_1E9FF3598;
          objc_msgSend(v7, "objectForKey:", v12, v34, v36);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v7)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") + 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = &unk_1EA0B8E78;
          }

          objc_msgSend(v7, "setObject:forKey:", v15, v12);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v8);
    }

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(obj, "count"))
    {
      v17 = 0;
      do
      {
        objc_msgSend(obj, "objectAtIndex:", v17, v34);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "contentID");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
          v20 = (__CFString *)v19;
        else
          v20 = &stru_1E9FF3598;
        objc_msgSend(v7, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        if (v22)
        {
          if ((unint64_t)(objc_msgSend(v16, "count") + v22) < 0x15)
          {
            objc_msgSend(obj, "subarrayWithRange:", v17, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObjectsFromArray:", v24);

            v17 += v22;
          }
          else
          {
            if (v17)
            {

              break;
            }
            objc_msgSend(obj, "subarrayWithRange:", 0, 20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObjectsFromArray:", v23);

            v17 = 20;
          }
        }
        else
        {
          ++v17;
        }

      }
      while (v17 < objc_msgSend(obj, "count"));
    }
    v26 = objc_msgSend(v16, "count", v34);
    if (!v26)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        -[VUIStoreFPSKeyLoader _startKeyRequestsInBatches:completion:].cold.1();
      v27 = objc_msgSend(obj, "count");
      if (v27 >= 0x14)
        v26 = 20;
      else
        v26 = v27;
      objc_msgSend(obj, "subarrayWithRange:", 0, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "mutableCopy");

      v16 = (id)v29;
    }
    objc_msgSend(obj, "subarrayWithRange:", v26, objc_msgSend(obj, "count") - v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v31 = (id)sLogObject_0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v32;
      _os_log_impl(&dword_1D96EE000, v31, OS_LOG_TYPE_DEFAULT, "Starting batch of %lu key requests", buf, 0xCu);
    }

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __62__VUIStoreFPSKeyLoader__startKeyRequestsInBatches_completion___block_invoke;
    v39[3] = &unk_1E9F99600;
    objc_copyWeak(&v42, &location);
    v33 = v30;
    v40 = v33;
    v41 = v35;
    -[VUIStoreFPSKeyLoader _startKeyRequests:completion:](self, "_startKeyRequests:completion:", v16, v39);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    v6 = (void (**)(_QWORD))v35;
  }
  else
  {
    v25 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "Done with all key request batches", buf, 2u);
    }
    if (v6)
      v6[2](v6);
  }

}

void __62__VUIStoreFPSKeyLoader__startKeyRequestsInBatches_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_startKeyRequestsInBatches:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_startKeyRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "keyIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreFPSKeyLoader keyIdentifierPenaltyBox](self, "keyIdentifierPenaltyBox");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (v16)
        {
          objc_msgSend(v7, "addObject:", v12);
        }
        else
        {
          v17 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v12;
            _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Automatically failing key request %@ since it is in the penalty box", buf, 0xCu);
          }
          v31 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v19, v15);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v9);
  }

  objc_initWeak((id *)buf, self);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__VUIStoreFPSKeyLoader__startKeyRequests_completion___block_invoke;
  v23[3] = &unk_1E9F99600;
  objc_copyWeak(&v26, (id *)buf);
  v20 = v7;
  v24 = v20;
  v21 = v22;
  v25 = v21;
  -[VUIStoreFPSKeyLoader _generateKeyRequestDataForKeyRequests:completion:](self, "_generateKeyRequestDataForKeyRequests:completion:", v20, v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

void __53__VUIStoreFPSKeyLoader__startKeyRequests_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    v18 = *MEMORY[0x1E0DB1FB0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isCancelled", v17) & 1) != 0)
        {
          v10 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v9;
            _os_log_impl(&dword_1D96EE000, v10, OS_LOG_TYPE_DEFAULT, "Stopping further key loading since request is cancelled or failed: %@", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v9, "keyRequestData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (v12)
          {
            objc_msgSend(v3, "addObject:", v9);
          }
          else
          {
            objc_msgSend(v9, "error");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v13)
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v18, -345007, 0);
            v25 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_failKeyRequests:withError:", v14, v13);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v6);
  }

  v15 = objc_msgSend(v3, "count");
  v16 = *(_QWORD *)(v17 + 40);
  if (v15)
  {
    objc_msgSend(WeakRetained, "_sendKeyRequestsToServer:isStopRequest:isSecureInvalidationRequest:completion:", v3, 0, 0, v16);
  }
  else if (v16)
  {
    (*(void (**)(_QWORD))(v16 + 16))(*(_QWORD *)(v17 + 40));
  }

}

- (void)_generateKeyRequestDataForKeyRequests:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id obj;
  NSObject *group;
  _QWORD block[4];
  id v28;
  _QWORD v29[5];
  NSObject *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  group = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "isCancelled");
        v12 = sLogObject_0;
        v13 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
        if ((v11 & 1) != 0)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            v37 = v10;
            _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Stopping further key loading since request is cancelled or failed: %@", buf, 0xCu);
          }
        }
        else
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            v37 = v10;
            _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Generating key request data for %@", buf, 0xCu);
          }
          -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *MEMORY[0x1E0DB1EA0];
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "eventReportingID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v15, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addStartEventWithName:identifier:", v15, v18);

          objc_msgSend(v10, "keyIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "absoluteString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dataUsingEncoding:", 4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, self);
          dispatch_group_enter(group);
          -[VUIStoreFPSKeyLoader certificateData](self, "certificateData");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke;
          v29[3] = &unk_1E9F99920;
          objc_copyWeak(&v31, (id *)buf);
          v29[4] = v10;
          v30 = group;
          objc_msgSend(v10, "makeKeyRequestDataForCertificateData:assetIDData:completion:", v22, v21, v29);

          objc_destroyWeak(&v31);
          objc_destroyWeak((id *)buf);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke_67;
  block[3] = &unk_1E9F98E68;
  v28 = v24;
  v23 = v24;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

}

void __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  v9 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v17 = v10;
    _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "Key request data generated for %@", buf, 0xCu);
  }
  objc_msgSend(WeakRetained, "eventCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0DB1EA0];
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "eventReportingID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEndEventWithName:identifier:", v12, v15);

  objc_msgSend(*(id *)(a1 + 32), "setKeyRequestData:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__VUIStoreFPSKeyLoader__generateKeyRequestDataForKeyRequests_completion___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_sendKeyRequestsToServer:(id)a3 isStopRequest:(BOOL)a4 isSecureInvalidationRequest:(BOOL)a5 completion:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  void *v31;
  id obj;
  _QWORD v34[4];
  id v35;
  uint8_t buf[8];
  _QWORD aBlock[4];
  id v38;
  VUIStoreFPSKeyLoader *v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  BOOL v44;
  id location;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v30 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if ((!objc_msgSend(v13, "type") || objc_msgSend(v13, "type") == 1) && !a4)
        {
          -[VUIStoreFPSKeyLoader savedStreamingKeyRequestToUseForStopping](self, "savedStreamingKeyRequestToUseForStopping");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
            -[VUIStoreFPSKeyLoader setSavedStreamingKeyRequestToUseForStopping:](self, "setSavedStreamingKeyRequestToUseForStopping:", v13);
        }
        -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *MEMORY[0x1E0DB1EC8];
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "eventReportingID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@%@"), v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addStartEventWithName:identifier:", v17, v20);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v10);
  }

  objc_initWeak(&location, self);
  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E9F999E8;
  v22 = obj;
  v38 = v22;
  v39 = self;
  v23 = v31;
  v40 = v23;
  v43 = a4;
  v44 = a5;
  objc_copyWeak(&v42, &location);
  v24 = v30;
  v41 = v24;
  v25 = _Block_copy(aBlock);
  v26 = -[VUIStoreFPSKeyLoader sendsLocationWhenOptedIn](self, "sendsLocationWhenOptedIn");
  v27 = sLogObject_0;
  v28 = os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "Fetching location authorization status", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v21;
    v34[1] = 3221225472;
    v34[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_79;
    v34[3] = &unk_1E9F99A38;
    v35 = v25;
    objc_msgSend(v29, "fetchAuthorizationStatus:", v34);

  }
  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v27, OS_LOG_TYPE_DEFAULT, "Skipping location authorization status fetch", buf, 2u);
    }
    (*((void (**)(void *, uint64_t))v25 + 2))(v25, -1);
  }

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const __CFString *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id obj;
  uint64_t v39;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  char v50;
  __int16 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const __CFString *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v2)
  {
    v39 = *(_QWORD *)v53;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v53 != v39)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v3);
        objc_msgSend(*(id *)(a1 + 40), "eventCollection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *MEMORY[0x1E0DB1EC8];
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "eventReportingID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addEndEventWithName:identifier:", v6, v9);

        objc_msgSend(v4, "setServerRequestStartDate:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 40), "eventCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0DB1EA8];
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "eventReportingID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@%@"), v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addStartEventWithName:identifier:", v11, v14);

        ++v3;
      }
      while (v2 != v3);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v2);
  }

  v15 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 72))
      v17 = CFSTR("stop ");
    else
      v17 = &stru_1E9FF3598;
    *(_DWORD *)buf = 138412546;
    v57 = v17;
    v58 = 2112;
    v59 = v16;
    _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Sending %@requests to server: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_bodyDictionaryForRequests:isStopRequest:locationAuthorizationStatus:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0CB37A8]);
  objc_msgSend(*(id *)(a1 + 40), "keyServerURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithURL:", v20);

  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v21, "setTimeoutInterval:", 30.0);
  if (*(_BYTE *)(a1 + 73))
  {
    objc_msgSend(*(id *)(a1 + 40), "secureInvalidationDSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "stringValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setValue:forHTTPHeaderField:", v24, CFSTR("X-Secure-Invalidation-Dsid"));

    }
  }
  objc_msgSend(MEMORY[0x1E0CFD9E8], "vui_defaultBag");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC80]), "initWithBag:", v25);
  v27 = objc_msgSend(*(id *)(a1 + 40), "sendsMescalHeader");
  objc_msgSend(v26, "setRequestEncoding:", 3);
  objc_msgSend(v26, "setMescalType:", 0);
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ams_activeiTunesAccountForMediaType:", *MEMORY[0x1E0CFD7B0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v31 = *(const __CFString **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v57 = v31;
    _os_log_impl(&dword_1D96EE000, v30, OS_LOG_TYPE_DEFAULT, "Waiting for account promise for key requests: %@", buf, 0xCu);
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_72;
  v41[3] = &unk_1E9F999C0;
  v42 = *(id *)(a1 + 32);
  v32 = v26;
  v43 = v32;
  v33 = v21;
  v44 = v33;
  v34 = v18;
  v45 = v34;
  v50 = v27;
  v35 = v25;
  v46 = v35;
  objc_copyWeak(&v49, (id *)(a1 + 64));
  v51 = *(_WORD *)(a1 + 72);
  v36 = *(id *)(a1 + 56);
  v47 = *(_QWORD *)(a1 + 40);
  v48 = v36;
  objc_msgSend(v29, "addFinishBlock:", v41);

  objc_destroyWeak(&v49);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;
  __int16 v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Account promise completed for key requests.  Waiting for URL request promise for key requests: %@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "setAccount:", v5);
  objc_msgSend(*(id *)(a1 + 40), "requestByEncodingRequest:parameters:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73;
  v11[3] = &unk_1E9F99998;
  v12 = *(id *)(a1 + 32);
  v17 = *(_BYTE *)(a1 + 96);
  v13 = *(id *)(a1 + 64);
  objc_copyWeak(&v16, (id *)(a1 + 88));
  v18 = *(_WORD *)(a1 + 97);
  v10 = *(id *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 72);
  v15 = v10;
  objc_msgSend(v9, "addFinishBlock:", v11);

  objc_destroyWeak(&v16);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int16 v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v29 = v8;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "URL request promise completed for key requests: %@ with URL request %@ error %@", buf, 0x20u);
  }
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_3;
    block[3] = &unk_1E9F997A0;
    block[4] = *(_QWORD *)(a1 + 48);
    v19 = *(id *)(a1 + 32);
    v20 = v6;
    v21 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v5, "HTTPBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = *(_QWORD *)(a1 + 40);
        v27 = 0;
        objc_msgSend(MEMORY[0x1E0CFDB58], "signatureFromData:type:bag:error:", v9, 1, v10, &v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v27;
        v13 = sLogObject_0;
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "Manually adding mescal signature header to request", buf, 2u);
          }
          objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setValue:forHTTPHeaderField:", v14, *MEMORY[0x1E0CFD848]);

        }
        else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        {
          __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73_cold_2();
        }

      }
      else if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      {
        __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73_cold_1();
      }

    }
    else
    {
      v15 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "Not sending mescal header", buf, 2u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CFDCA0], "defaultSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataTaskPromiseWithRequest:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_75;
    v22[3] = &unk_1E9F99970;
    objc_copyWeak(&v25, (id *)(a1 + 64));
    v23 = *(id *)(a1 + 32);
    v26 = *(_WORD *)(a1 + 73);
    v24 = *(id *)(a1 + 56);
    objc_msgSend(v17, "addFinishBlock:", v22);

    objc_destroyWeak(&v25);
  }

}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int16 v16;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2;
  v10[3] = &unk_1E9F99948;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  v16 = *(_WORD *)(a1 + 56);
  v11 = v7;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v15);
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = a1;
  obj = *(id *)(a1 + 32);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(WeakRetained, "eventCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *MEMORY[0x1E0DB1EA8];
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "eventReportingID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEndEventWithName:identifier:", v9, v12);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(v17 + 72) && !*(_BYTE *)(v17 + 73))
  {
    v16 = *(_QWORD *)(v17 + 56);
    if (v16)
      (*(void (**)(void))(v16 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(v17 + 40), "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v17 + 40), "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(v17 + 40), "response");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(WeakRetained, "_handleResponseForKeyRequests:responseData:URLResponse:error:completion:", *(_QWORD *)(v17 + 32), v13, v15, *(_QWORD *)(v17 + 48), *(_QWORD *)(v17 + 56));
  }

}

uint64_t __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_failKeyRequests:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_79(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  id v6;
  uint64_t v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v4 = __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2_80;
  v5 = &unk_1E9F99A10;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v3[0], 3221225472))
    v4((uint64_t)v3);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_2_80(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_handleResponseForKeyRequests:(id)a3 responseData:(id)a4 URLResponse:(id)a5 error:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  v17 = sLogObject_0;
  if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v12;
    _os_log_impl(&dword_1D96EE000, v17, OS_LOG_TYPE_DEFAULT, "Received response for requests: %@", buf, 0xCu);
  }
  objc_msgSend(v14, "allHeaderFields");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "tvp_appleTimingAppHeaderValue");

  if (v19 >= 1)
  {
    -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0DB1EB0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSingleShotEventWithName:value:", v21, v22);

  }
  if (v14)
    v23 = objc_msgSend(v14, "statusCode");
  else
    v23 = WLKHTTPStatusCodeForAMSError();
  v24 = v23;
  if (v23 != 200)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:].cold.3();
    if ((v24 & 0xFFFFFFFFFFFFFFFDLL) == 0x191)
      goto LABEL_20;
  }
  if (!v13)
  {
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v12, v15);
    goto LABEL_21;
  }
  if (!objc_msgSend(v13, "length"))
  {
LABEL_20:
    TVPSKDErrorWithCode();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v12, v30);

LABEL_21:
    v29 = 0;
    if (!v16)
      goto LABEL_33;
    goto LABEL_31;
  }
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v34;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "vui_dictionaryForKey:", CFSTR("fairplay-streaming-response"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "vui_numberForKey:", CFSTR("version"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "vui_arrayForKey:", CFSTR("streaming-keys"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26 && v32 && objc_msgSend(v27, "count"))
    {
      -[VUIStoreFPSKeyLoader _handleResponseDicts:forKeyRequests:completion:](self, "_handleResponseDicts:forKeyRequests:completion:", v28, v12, v16);
      v29 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:].cold.1();
      TVPSKDErrorWithCode();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v12, v31);

      v29 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      -[VUIStoreFPSKeyLoader _handleResponseForKeyRequests:responseData:URLResponse:error:completion:].cold.2();
    TVPSKDErrorWithCode();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v12, v26);
    v29 = 0;
  }

  if (v16)
  {
LABEL_31:
    if ((v29 & 1) == 0)
      v16[2](v16);
  }
LABEL_33:

}

- (void)_handleResponseDicts:(id)a3 forKeyRequests:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  id location;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke;
    v24[3] = &unk_1E9F99A60;
    v13 = v11;
    v25 = v13;
    v14 = objc_msgSend(v8, "indexOfObjectPassingTest:", v24);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
        -[VUIStoreFPSKeyLoader _handleResponseDicts:forKeyRequests:completion:].cold.1();
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      TVPSKDErrorWithCode();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v15, v16);

      objc_msgSend(v9, "subarrayWithRange:", 1, objc_msgSend(v9, "count") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIStoreFPSKeyLoader _handleResponseDicts:forKeyRequests:completion:](self, "_handleResponseDicts:forKeyRequests:completion:", v8, v17, v10);
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_90;
      v18[3] = &unk_1E9F997F0;
      objc_copyWeak(&v22, &location);
      v19 = v8;
      v20 = v9;
      v21 = v10;
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:](self, "_handleResponseDict:forKeyRequest:completion:", v17, v13, v18);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

uint64_t __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_2();
    goto LABEL_10;
  }
  objc_msgSend(v3, "vui_numberForKey:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_1();
    goto LABEL_9;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "requestID");
  if (v5 != objc_msgSend(v4, "unsignedIntegerValue"))
  {
LABEL_9:

LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }

  v6 = 1;
LABEL_11:

  return v6;
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_90(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleResponseDicts:forKeyRequests:completion:", v2, v3, *(_QWORD *)(a1 + 48));

}

- (void)_handleResponseDict:(id)a3 forKeyRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  NSObject *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  int v36;
  id v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  double v45;
  double v46;
  NSObject *v47;
  void *v48;
  int v49;
  int v50;
  void *v51;
  NSObject *v52;
  double v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  char v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[4];
  id v80;
  _QWORD aBlock[4];
  id v82;
  void (**v83)(_QWORD);
  id v84;
  id v85;
  id v86;
  id v87;
  uint8_t buf[4];
  double v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  objc_msgSend(v8, "vui_numberForKey:", CFSTR("status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:].cold.1();
    v85 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TVPSKDErrorWithCode();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v16, v78);
    goto LABEL_9;
  }
  v13 = objc_msgSend(v11, "integerValue");
  if (v13)
  {
    v14 = v13;
    v15 = sLogObject_0;
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:].cold.3((uint64_t)v9, v14, v15);
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("device-limit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _errorForStoreResponseStatus:deviceLimit:](self, "_errorForStoreResponseStatus:deviceLimit:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v78, v17);

LABEL_9:
    v18 = 0;
    goto LABEL_68;
  }
  objc_msgSend(v8, "vui_stringForKey:", CFSTR("ckc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length") || objc_msgSend(v9, "type") == 3)
  {
    if (objc_msgSend(v16, "length"))
      v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 1);
    else
      v78 = 0;
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("renew-after"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("expiration-time"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("availability-ending-time"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("playback-start-time"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_stringForKey:", CFSTR("content-id"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", CFSTR("is-low-value"), 0);
    objc_msgSend(v8, "vui_numberForKey:", CFSTR("playback-duration"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v8, "vui_BOOLForKey:defaultValue:", CFSTR("allow-manual-renewal"), 0);
    objc_msgSend(v8, "vui_dictionaryForKey:", CFSTR("extra-server-parameters"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vui_stringForKey:", CFSTR("offline-key-renewal-policy"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentID:", v70);
    objc_msgSend(v9, "setIsLowValueKey:", v19);
    objc_msgSend(v9, "setAllowManualRenewal:", v20);
    objc_msgSend(v9, "setAdditionalRequestParamsFromResponse:", v69);
    if (v76)
    {
      objc_msgSend(v9, "serverRequestStartDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = v23;

      objc_msgSend(v76, "doubleValue");
      objc_msgSend(v24, "dateByAddingTimeInterval:");
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v26 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v25;
        _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "Key renewal date: %@", buf, 0xCu);
      }
      objc_msgSend(v9, "setRenewalDate:", *(_QWORD *)&v25);
      objc_msgSend(v9, "setRenewalInterval:", v76);

    }
    if (v73)
    {
      v27 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v73, "doubleValue");
      v29 = COERCE_DOUBLE(objc_msgSend(v27, "initWithTimeIntervalSince1970:", v28 / 1000.0));
      if (v29 != 0.0)
      {
        -[VUIStoreFPSKeyLoader downloadExpirationPeriodOverrideInSeconds](self, "downloadExpirationPeriodOverrideInSeconds");
        v31 = v30;
        if (v30 > 0.0)
        {
          v32 = sLogObject_0;
          if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v89 = v31;
            _os_log_impl(&dword_1D96EE000, v32, OS_LOG_TYPE_DEFAULT, "Overriding key expiration to %.0f seconds from now", buf, 0xCu);
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v31);
          v33 = objc_claimAutoreleasedReturnValue();

          v29 = *(double *)&v33;
        }
      }
      v34 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v29;
        _os_log_impl(&dword_1D96EE000, v34, OS_LOG_TYPE_DEFAULT, "Key expiration date: %@", buf, 0xCu);
      }
      objc_msgSend(v9, "setExpirationDate:", *(_QWORD *)&v29);
      -[VUIStoreFPSKeyLoader keyExpirationDate](self, "keyExpirationDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(*(id *)&v29, "isEqualToDate:", v35);

      if ((v36 & 1) == 0)
        -[VUIStoreFPSKeyLoader setKeyExpirationDate:](self, "setKeyExpirationDate:", *(_QWORD *)&v29);

      v68 = v36 ^ 1;
    }
    else
    {
      v68 = 0;
    }
    if (v72)
    {
      v37 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v72, "doubleValue");
      v38 = COERCE_DOUBLE(objc_msgSend(v37, "initWithTimeIntervalSince1970:"));
      -[VUIStoreFPSKeyLoader availabilityPeriodOverrideInSeconds](self, "availabilityPeriodOverrideInSeconds");
      v40 = v39;
      if (v39 > 0.0)
      {
        v41 = sLogObject_0;
        if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v89 = v40;
          _os_log_impl(&dword_1D96EE000, v41, OS_LOG_TYPE_DEFAULT, "Overriding availability end to %.0f seconds from now", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v40);
        v42 = objc_claimAutoreleasedReturnValue();

        v38 = *(double *)&v42;
      }
      v43 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v38;
        _os_log_impl(&dword_1D96EE000, v43, OS_LOG_TYPE_DEFAULT, "Availability end date: %@", buf, 0xCu);
      }
      objc_msgSend(v9, "setAvailabilityEndDate:", *(_QWORD *)&v38);

    }
    if (v71)
    {
      v44 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v71, "doubleValue");
      v46 = COERCE_DOUBLE(objc_msgSend(v44, "initWithTimeIntervalSince1970:", v45 / 1000.0));
      v47 = sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v46;
        _os_log_impl(&dword_1D96EE000, v47, OS_LOG_TYPE_DEFAULT, "Rental playback start date: %@", buf, 0xCu);
      }
      -[VUIStoreFPSKeyLoader rentalPlaybackStartDate](self, "rentalPlaybackStartDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(*(id *)&v46, "isEqualToDate:", v48);

      if ((v49 & 1) == 0)
        -[VUIStoreFPSKeyLoader setRentalPlaybackStartDate:](self, "setRentalPlaybackStartDate:", *(_QWORD *)&v46);

      v50 = v49 ^ 1;
    }
    else
    {
      v50 = 0;
    }
    if (v75)
    {
      v51 = (void *)sLogObject_0;
      if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
      {
        v52 = v51;
        objc_msgSend(v75, "doubleValue");
        *(_DWORD *)buf = 134217984;
        v89 = v53;
        _os_log_impl(&dword_1D96EE000, v52, OS_LOG_TYPE_DEFAULT, "Playback duration: %f", buf, 0xCu);

      }
      objc_msgSend(v9, "setPlaybackDuration:", v75);
    }
    if ((objc_msgSend(v74, "isEqualToString:", CFSTR("auto")) & 1) != 0)
    {
      v54 = 1;
    }
    else if ((objc_msgSend(v74, "isEqualToString:", CFSTR("manual")) & 1) != 0)
    {
      v54 = 2;
    }
    else if (objc_msgSend(v74, "isEqualToString:", CFSTR("no-renew")))
    {
      v54 = 3;
    }
    else
    {
      v54 = 0;
    }
    objc_msgSend(v9, "setOfflineKeyRenewalPolicy:", v54);
    if ((v68 | v50) == 1)
    {
      -[VUIStoreFPSKeyLoader delegate](self, "delegate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[VUIStoreFPSKeyLoader keyExpirationDate](self, "keyExpirationDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIStoreFPSKeyLoader rentalPlaybackStartDate](self, "rentalPlaybackStartDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "storeFPSKeyLoader:didReceiveUpdatedRentalExpirationDate:playbackStartDate:", self, v56, v57);

      }
    }
    -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = *MEMORY[0x1E0DB1E98];
    v60 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "eventReportingID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("%@%@"), v59, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "addEndEventWithName:identifier:", v59, v62);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestEndDate:", v63);

    objc_initWeak((id *)buf, self);
    v64 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke;
    aBlock[3] = &unk_1E9F99A88;
    objc_copyWeak(&v84, (id *)buf);
    v65 = v9;
    v82 = v65;
    v83 = v10;
    v66 = _Block_copy(aBlock);
    if (objc_msgSend(v65, "type") == 2)
    {
      v79[0] = v64;
      v79[1] = 3221225472;
      v79[2] = __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_125;
      v79[3] = &unk_1E9F99700;
      v80 = v66;
      objc_msgSend(v65, "offlineKeyDataFromServerKeyData:completion:", v78, v79);

    }
    else
    {
      (*((void (**)(void *, void *, _QWORD))v66 + 2))(v66, v78, 0);
    }

    objc_destroyWeak(&v84);
    objc_destroyWeak((id *)buf);

    v18 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      -[VUIStoreFPSKeyLoader _handleResponseDict:forKeyRequest:completion:].cold.2();
    v87 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    TVPSKDErrorWithCode();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIStoreFPSKeyLoader _failKeyRequests:withError:](self, "_failKeyRequests:withError:", v78, v77);
    v18 = 0;

  }
LABEL_68:

  if (v10)
    v67 = v18;
  else
    v67 = 1;
  if ((v67 & 1) == 0)
    v10[2](v10);

}

void __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setKeyResponseData:", v5);
  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "storeFPSKeyLoader:didLoadOfflineKeyData:forKeyRequest:", WeakRetained, v5, *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(v5, "length") || objc_msgSend(*(id *)(a1 + 32), "type") == 3)
  {
    objc_msgSend(WeakRetained, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "storeFPSKeyLoader:willSucceedForKeyRequest:", WeakRetained, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_ERROR))
      __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_cold_1();
    v11[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_failKeyRequests:withError:", v9, v6);
  }

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

uint64_t __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_errorForStoreResponseStatus:(int64_t)a3 deviceLimit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case -1017:
    case -1016:
    case -1013:
    case -1009:
    case -1008:
    case -1002:
      goto LABEL_12;
    case -1015:
      if (v5)
      {
        v18 = *MEMORY[0x1E0DB1FA8];
        v19 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0DB1FB0];
      v16 = -345026;
      goto LABEL_19;
    case -1014:
      if (v5)
      {
        v20 = *MEMORY[0x1E0DB1FA8];
        v21 = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0DB1FB0];
      v16 = -345025;
      goto LABEL_19;
    case -1012:
    case -1011:
    case -1010:
    case -1007:
    case -1006:
    case -1005:
    case -1003:
      goto LABEL_5;
    case -1004:
      if (v5)
      {
        v22 = *MEMORY[0x1E0DB1FA8];
        v23[0] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v15 = *MEMORY[0x1E0DB1FB0];
      v16 = -345014;
LABEL_19:
      v13 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", v15, v16, v7);
      goto LABEL_20;
    default:
      if (a3 == -42606 || a3 == -42585)
      {
LABEL_12:
        TVPSKDErrorWithCode();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_5:
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.fpsRequest"), a3, 0);
        TVPSKDErrorWithCode();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");

        objc_msgSend(v10, "setObject:forKey:", v7, *MEMORY[0x1E0CB3388]);
        v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
        objc_msgSend(v8, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v8, "code"), v10);

LABEL_20:
      }

      return v13;
  }
}

- (void)_failKeyRequests:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (uint64_t *)MEMORY[0x1E0DB1FB0];
  if (!v7)
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", *MEMORY[0x1E0DB1FB0], -345007, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v30)
  {
    v28 = *v8;
    v29 = *(_QWORD *)v32;
    v9 = (uint64_t *)MEMORY[0x1E0DB1E98];
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v7, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v28))
        {
          v13 = objc_msgSend(v7, "code");

          if (v13 != -345015)
            goto LABEL_17;
          objc_msgSend(v11, "keyIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (-[VUIStoreFPSKeyLoader usesKeyIdentifierPenaltyBox](self, "usesKeyIdentifierPenaltyBox"))
            {
              -[VUIStoreFPSKeyLoader keyIdentifierPenaltyBox](self, "keyIdentifierPenaltyBox");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v15)
              {
                v16 = sLogObject_0;
                if (os_log_type_enabled((os_log_t)sLogObject_0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v36 = v12;
                  _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "Adding key identifier [%@] to penalty box since it is not owned or entitled", buf, 0xCu);
                }
                -[VUIStoreFPSKeyLoader keyIdentifierPenaltyBox](self, "keyIdentifierPenaltyBox");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setObject:forKey:", v7, v12);

              }
            }
          }
        }

LABEL_17:
        objc_msgSend(v11, "setError:", v7);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setRequestEndDate:", v18);

        -[VUIStoreFPSKeyLoader delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "storeFPSKeyLoader:willFailWithError:forKeyRequest:", self, v7, v11);
        -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *v9;
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "eventReportingID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@"), v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addEndEventWithName:identifier:", v21, v24);

        -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E80], v7);

        -[VUIStoreFPSKeyLoader eventCollection](self, "eventCollection");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E88], *v9);

        objc_msgSend(v11, "finish");
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v30);
  }

}

- (id)_bodyDictionaryForRequests:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[VUIStoreFPSKeyLoader _jsonDictionaryForRequest:isStopRequest:locationAuthorizationStatus:](self, "_jsonDictionaryForRequest:isStopRequest:locationAuthorizationStatus:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), v6, a5, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v16, "setObject:forKey:", &unk_1EA0B8E78, CFSTR("version"));
  objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("streaming-keys"));
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("fairplay-streaming-request"));

  return v17;
}

- (id)_jsonDictionaryForRequest:(id)a3 isStopRequest:(BOOL)a4 locationAuthorizationStatus:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "keyRequestData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("spc"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "requestID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("id"));

  objc_msgSend(v8, "keyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("uri"));
  -[VUIStoreFPSKeyLoader rentalID](self, "rentalID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v9, "setObject:forKey:", v15, CFSTR("rental-id"));
  if (a4)
  {
    v16 = CFSTR("stop");
  }
  else if (objc_msgSend(v8, "isRenewal"))
  {
    v16 = CFSTR("renew");
  }
  else
  {
    v16 = CFSTR("start");
  }
  objc_msgSend(v9, "setObject:forKey:", v16, CFSTR("lease-action"));
  if (-[VUIStoreFPSKeyLoader didSkipRentalCheckout](self, "didSkipRentalCheckout"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("skipped-rental-checkout"));
  if (objc_msgSend(v8, "type") == 2 || objc_msgSend(v8, "type") == 3)
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("offline"));
  if (a5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastKnownLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0DC8938]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0DC8940]);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 && v20)
    {
      objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("lat"));
      objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("long"));
    }

  }
  objc_msgSend(v8, "additionalRequestParams");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    objc_msgSend(v8, "additionalRequestParams");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v24);

  }
  objc_msgSend(v9, "objectForKey:", CFSTR("adamId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    goto LABEL_27;
  objc_msgSend(v8, "adamID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    objc_msgSend(v8, "adamID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v25, CFSTR("adamId"));
LABEL_27:

  }
  return v9;
}

- (NSURL)secureInvalidationNonceURL
{
  return self->_secureInvalidationNonceURL;
}

- (void)setSecureInvalidationNonceURL:(id)a3
{
  objc_storeStrong((id *)&self->_secureInvalidationNonceURL, a3);
}

- (NSNumber)secureInvalidationDSID
{
  return self->_secureInvalidationDSID;
}

- (void)setSecureInvalidationDSID:(id)a3
{
  objc_storeStrong((id *)&self->_secureInvalidationDSID, a3);
}

- (VUIStoreFPSKeyLoaderDelegate)delegate
{
  return (VUIStoreFPSKeyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (void)setEventCollection:(id)a3
{
  objc_storeStrong((id *)&self->_eventCollection, a3);
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
{
  objc_storeStrong((id *)&self->_rentalID, a3);
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  self->_didSkipRentalCheckout = a3;
}

- (BOOL)usesKeyIdentifierPenaltyBox
{
  return self->_usesKeyIdentifierPenaltyBox;
}

- (void)setUsesKeyIdentifierPenaltyBox:(BOOL)a3
{
  self->_usesKeyIdentifierPenaltyBox = a3;
}

- (BOOL)sendsLocationWhenOptedIn
{
  return self->_sendsLocationWhenOptedIn;
}

- (void)setSendsLocationWhenOptedIn:(BOOL)a3
{
  self->_sendsLocationWhenOptedIn = a3;
}

- (BOOL)sendsMescalHeader
{
  return self->_sendsMescalHeader;
}

- (void)setSendsMescalHeader:(BOOL)a3
{
  self->_sendsMescalHeader = a3;
}

- (NSURL)certificateURL
{
  return self->_certificateURL;
}

- (void)setCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_certificateData, a3);
}

- (NSMutableArray)requestsAwaitingCertFetch
{
  return self->_requestsAwaitingCertFetch;
}

- (void)setRequestsAwaitingCertFetch:(id)a3
{
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, a3);
}

- (TVPContentKeyRequest)savedStreamingKeyRequestToUseForStopping
{
  return self->_savedStreamingKeyRequestToUseForStopping;
}

- (void)setSavedStreamingKeyRequestToUseForStopping:(id)a3
{
  objc_storeStrong((id *)&self->_savedStreamingKeyRequestToUseForStopping, a3);
}

- (NSDate)keyExpirationDate
{
  return self->_keyExpirationDate;
}

- (void)setKeyExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_keyExpirationDate, a3);
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, a3);
}

- (TVPContentKeySession)contentKeySession
{
  return self->_contentKeySession;
}

- (void)setContentKeySession:(id)a3
{
  objc_storeStrong((id *)&self->_contentKeySession, a3);
}

- (NSMutableDictionary)keyIdentifierPenaltyBox
{
  return self->_keyIdentifierPenaltyBox;
}

- (void)setKeyIdentifierPenaltyBox:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifierPenaltyBox, a3);
}

- (double)downloadExpirationPeriodOverrideInSeconds
{
  return self->_downloadExpirationPeriodOverrideInSeconds;
}

- (void)setDownloadExpirationPeriodOverrideInSeconds:(double)a3
{
  self->_downloadExpirationPeriodOverrideInSeconds = a3;
}

- (double)availabilityPeriodOverrideInSeconds
{
  return self->_availabilityPeriodOverrideInSeconds;
}

- (void)setAvailabilityPeriodOverrideInSeconds:(double)a3
{
  self->_availabilityPeriodOverrideInSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifierPenaltyBox, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_keyExpirationDate, 0);
  objc_storeStrong((id *)&self->_savedStreamingKeyRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_certificateURL, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureInvalidationDSID, 0);
  objc_storeStrong((id *)&self->_secureInvalidationNonceURL, 0);
}

- (void)loadFairPlayStreamingKeyRequests:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Either certificate URL or key server URL was not provided", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)invalidateKeysWithRequests:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Param error invalidating key requests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __75__VUIStoreFPSKeyLoader__loadAndCacheCertificateDataForValidURL_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, a2, a3, "Error fetching certificate data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_9();
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Top-level json object is not of type dictionary.  Error is %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __61__VUIStoreFPSKeyLoader__loadNonceDataForRequests_completion___block_invoke_47_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Nonce response is not of type NSData, or error occurred: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __82__VUIStoreFPSKeyLoader__generateSecureInvalidationDataForFirstRequest_completion___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5_7(&dword_1D96EE000, a2, a3, "Error generating secure invalidation data for %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_4_9();
}

- (void)_startKeyRequestsInBatches:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Batch size is zero.  This should never happen.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Body data is nil; unable to sign using Mescal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __102__VUIStoreFPSKeyLoader__sendKeyRequestsToServer_isStopRequest_isSecureInvalidationRequest_completion___block_invoke_73_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Signature data is nil due to error %@; unable to sign using mescal",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Response is missing fairplay-streaming-response, version or streaming-keys", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Top-level json object is not of type dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_handleResponseForKeyRequests:responseData:URLResponse:error:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Received http %ld status code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

- (void)_handleResponseDicts:forKeyRequests:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_14();
  OUTLINED_FUNCTION_1_10(&dword_1D96EE000, v0, v1, "Response dict for key request could not be found: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_9();
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Key info dict is missing id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __71__VUIStoreFPSKeyLoader__handleResponseDicts_forKeyRequests_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Key info object is not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_handleResponseDict:forKeyRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Key info dict is missing status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_handleResponseDict:forKeyRequest:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Key info dict has a status of 0 but is missing ckc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

- (void)_handleResponseDict:(uint64_t)a1 forKeyRequest:(uint64_t)a2 completion:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_5_7(&dword_1D96EE000, a2, a3, "Received FPS response error status of %ld for %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_4_9();
}

void __69__VUIStoreFPSKeyLoader__handleResponseDict_forKeyRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Key response data has zero length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
