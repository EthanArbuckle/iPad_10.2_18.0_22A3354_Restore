@implementation TVPSecureKeyDeliveryCoordinator

+ (void)initialize
{
  if (initialize_onceToken_7 != -1)
    dispatch_once(&initialize_onceToken_7, &__block_literal_global_16);
}

void __45__TVPSecureKeyDeliveryCoordinator_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sDeliveryCoordinatorLogObject;
  sDeliveryCoordinatorLogObject = (uint64_t)v0;

}

+ (BOOL)isSecureKeyDeliveryRequest:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("skd"));
  return (char)v3;
}

- (TVPSecureKeyDeliveryCoordinator)initWithSecureKeyLoader:(id)a3
{
  id v5;
  void *v6;
  TVPSecureKeyDeliveryCoordinator *v7;
  NSMutableSet *v8;
  NSMutableSet *requestsAwaitingCertFetch;
  id v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Argument passed to -initWithSecureKeyLoader: must be non-nil."), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)TVPSecureKeyDeliveryCoordinator;
  v7 = -[TVPSecureKeyDeliveryCoordinator init](&v12, sel_init);
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    requestsAwaitingCertFetch = v7->_requestsAwaitingCertFetch;
    v7->_requestsAwaitingCertFetch = v8;

    objc_storeStrong((id *)&v7->_secureKeyLoader, a3);
    -[TVPSecureKeyLoader setDelegate:](v7->_secureKeyLoader, "setDelegate:", v7);
  }

  return v7;
}

- (void)loadSecureKeyRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEventCollection:", v4);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRequestStartDate:", v5);

  -[TVPSecureKeyDeliveryCoordinator _loadSecureKeyRequest:sendStartReportingEvent:](self, "_loadSecureKeyRequest:sendStartReportingEvent:", v6, 1);
}

- (void)sendStopRequest
{
  id v2;

  -[TVPSecureKeyDeliveryCoordinator secureKeyLoader](self, "secureKeyLoader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendStopRequest");

}

- (void)setEventCollection:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_eventCollection, a3);
  v5 = a3;
  -[TVPSecureKeyDeliveryCoordinator secureKeyLoader](self, "secureKeyLoader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEventCollection:", v5);

}

- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v8 = a4;
  v9 = a5;
  -[TVPSecureKeyDeliveryCoordinator setCertFetchInProgress:](self, "setCertFetchInProgress:", 0);
  v10 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 134218240;
    v39 = objc_msgSend(v9, "requestID");
    v40 = 2048;
    v41 = objc_msgSend(v8, "length");
    _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Cert fetch complete for request %lu.  Cert length is %lu", buf, 0x16u);

  }
  v30 = v9;
  if (objc_msgSend(v8, "length"))
    -[TVPSecureKeyDeliveryCoordinator setCertificateData:](self, "setCertificateData:", v8);
  -[TVPSecureKeyDeliveryCoordinator requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  -[TVPSecureKeyDeliveryCoordinator requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = TVPPlaybackReportingEventFPSCertFetch;
        v22 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v19, "reportingID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@"), v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addEndEventWithName:identifier:", v21, v24);

        v25 = (void *)sDeliveryCoordinatorLogObject;
        if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          v27 = objc_msgSend(v19, "requestID");
          *(_DWORD *)buf = 134217984;
          v39 = v27;
          _os_log_impl(&dword_228A4E000, v26, OS_LOG_TYPE_DEFAULT, "After cert fetch completion, continuing request %lu", buf, 0xCu);

        }
        if (!objc_msgSend(v8, "length"))
        {
          TVPSKDErrorWithCode(-345003);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:](self, "secureKeyLoader:didFailWithError:forRequest:", v31, v29, v19);

          goto LABEL_17;
        }
        objc_msgSend(v19, "setCertificateData:", v8);
        -[TVPSecureKeyDeliveryCoordinator secureKeyLoader](self, "secureKeyLoader");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "startLoadingContentIdentifierDataForRequest:", v19);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_17:

}

- (void)secureKeyLoader:(id)a3 didLoadContentIdentifierData:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v10, "setContentIdentifierData:", v9);
    objc_initWeak(&location, self);
    v11 = (id)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v10, "requestID");
      *(_DWORD *)buf = 134217984;
      v25 = v12;
      _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Loading key request data for id %lu", buf, 0xCu);
    }

    -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = TVPPlaybackReportingEventFPSRequestDataGeneration;
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "reportingID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("%@%@"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addStartEventWithName:identifier:", v14, v17);

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __91__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didLoadContentIdentifierData_forRequest___block_invoke;
    v19[3] = &unk_24F15D500;
    objc_copyWeak(&v22, &location);
    v20 = v10;
    v21 = v8;
    objc_msgSend(v20, "loadKeyRequestDataAsynchronouslyWithCompletion:", v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    TVPSKDErrorWithCode(-345006);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:](self, "secureKeyLoader:didFailWithError:forRequest:", v8, v18, v10);

  }
}

void __91__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didLoadContentIdentifierData_forRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "eventCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = TVPPlaybackReportingEventFPSRequestDataGeneration;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "reportingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEndEventWithName:identifier:", v6, v9);

  v10 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 32);
    v12 = v10;
    *(_DWORD *)buf = 134217984;
    v27 = objc_msgSend(v11, "requestID");
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Done loading key request data for id %lu", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "keyRequestData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v14, "eventCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = TVPPlaybackReportingEventFPSServerKeyFetch;
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "reportingID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@"), v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addStartEventWithName:identifier:", v16, v19);

    v20 = (void *)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 32);
      v22 = v20;
      v23 = objc_msgSend(v21, "requestID");
      *(_DWORD *)buf = 134217984;
      v27 = v23;
      _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Fetching FPS key for id %lu", buf, 0xCu);

    }
    v24 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v24, "secureKeyLoader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startLoadingKeyResponseDataForRequest:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (!v3)
      v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345007, 0);
    v24 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v24, "secureKeyLoader:didFailWithError:forRequest:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 32));
  }

}

- (void)secureKeyLoader:(id)a3 didLoadKeyResponseData:(id)a4 renewalDate:(id)a5 forRequest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    *(_DWORD *)buf = 134217984;
    v51 = objc_msgSend(v13, "requestID");
    _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "FPS key fetch complete for id %lu", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRequestEndDate:", v16);

  if (objc_msgSend(v11, "length"))
  {
    v48 = v12;
    -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = TVPPlaybackReportingEventFPSServerKeyFetch;
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "reportingID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%@"), v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestCompletionTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addEndEventWithName:identifier:timestamp:", v18, v21, v22);

    -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "secureKeyDeliveryCoordinatorWillSucceed:", self);

    -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "secureKeyDeliveryCoordinatorWillSucceed:forKeyRequest:", self, v13);

    }
    -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = TVPPlaybackReportingEventFPSOverallFetch;
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "reportingID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@%@"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestCompletionTime");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addEndEventWithName:identifier:timestamp:", v27, v30, v31);

    if (objc_msgSend(v13, "retrievesOfflineKeys"))
    {
      v32 = (void *)sDeliveryCoordinatorLogObject;
      if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = objc_msgSend(v13, "requestID");
        *(_DWORD *)buf = 134217984;
        v51 = v34;
        _os_log_impl(&dword_228A4E000, v33, OS_LOG_TYPE_DEFAULT, "Converting key response data to offline key data for id %lu", buf, 0xCu);

      }
      v49 = 0;
      objc_msgSend(v13, "offlineKeyDataForResponseData:error:", v11, &v49);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v49;

      if (objc_msgSend(v35, "length"))
      {
        -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_opt_respondsToSelector();

        if ((v38 & 1) != 0)
        {
          -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "secureKeyDeliveryCoordinator:didReceiveOfflineKeyData:forKeyRequest:", self, v35, v13);

        }
        v12 = v48;
        objc_msgSend(v13, "finishLoadingWithResponseData:renewalDate:keyType:", v35, v48, 2);
      }
      else
      {
        v41 = sDeliveryCoordinatorLogObject;
        if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR))
          -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didLoadKeyResponseData:renewalDate:forRequest:].cold.1((uint64_t)v36, v41, v42, v43, v44, v45, v46, v47);
        -[TVPSecureKeyDeliveryCoordinator _finishLoadingWithError:forRequest:](self, "_finishLoadingWithError:forRequest:", v36, v13);
        v12 = v48;
      }

    }
    else
    {
      v12 = v48;
      objc_msgSend(v13, "finishLoadingWithResponseData:renewalDate:keyType:", v11, v48, 1);
      v35 = v11;
    }
  }
  else
  {
    TVPSKDErrorWithCode(-345009);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:](self, "secureKeyLoader:didFailWithError:forRequest:", v10, v40, v13);

    v35 = v11;
  }

}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureKeyDeliveryCoordinator:didReceiveUpdatedRentalExpirationDate:", self, v5);

}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureKeyDeliveryCoordinator:didReceiveUpdatedRentalPlaybackStartDate:", self, v8);

  }
}

- (void)secureKeyLoader:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secureKeyDeliveryCoordinator:didReceiveUpdatedRentalExpirationDate:playbackStartDate:", self, v11, v7);

  }
}

- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  char IsFatalSKDError;
  NSObject *v37;
  dispatch_time_t v38;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sDeliveryCoordinatorLogObject;
  if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR))
    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:].cold.2((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequestEndDate:", v18);

  if (-[TVPSecureKeyDeliveryCoordinator certFetchInProgress](self, "certFetchInProgress"))
  {
    v39 = v10;
    v40 = v8;
    -[TVPSecureKeyDeliveryCoordinator requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    -[TVPSecureKeyDeliveryCoordinator setCertFetchInProgress:](self, "setCertFetchInProgress:", 0);
    -[TVPSecureKeyDeliveryCoordinator requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeAllObjects");

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v20;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v22)
    {
      v23 = v22;
      v43 = *(_QWORD *)v49;
      v42 = *MEMORY[0x24BDD1398];
      v44 = v9;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if (v9)
          {
            v54 = v42;
            v55 = v9;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345001, v26);
          -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = TVPPlaybackReportingEventFPSCertFetch;
          v30 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v25, "reportingID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("%@%@"), v29, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addEndEventWithName:identifier:", v29, v32);

          v33 = (void *)sDeliveryCoordinatorLogObject;
          if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
          {
            v34 = v33;
            v35 = objc_msgSend(v25, "requestID");
            *(_DWORD *)buf = 134217984;
            v53 = v35;
            _os_log_impl(&dword_228A4E000, v34, OS_LOG_TYPE_DEFAULT, "After cert fetch failure, failing request %lu", buf, 0xCu);

          }
          -[TVPSecureKeyDeliveryCoordinator _finishLoadingWithError:forRequest:](self, "_finishLoadingWithError:forRequest:", v27, v25);

          v9 = v44;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v23);
    }

    v10 = v39;
    v8 = v40;
  }
  else
  {
    IsFatalSKDError = TVPErrorIsFatalSKDError(v9);
    objc_msgSend(v10, "setRetryCount:", objc_msgSend(v10, "retryCount") + 1);
    if ((IsFatalSKDError & 1) != 0 || (unint64_t)objc_msgSend(v10, "retryCount") > 1)
    {
      -[TVPSecureKeyDeliveryCoordinator _finishLoadingWithError:forRequest:](self, "_finishLoadingWithError:forRequest:", v9, v10);
    }
    else
    {
      v37 = sDeliveryCoordinatorLogObject;
      if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_ERROR))
        -[TVPSecureKeyDeliveryCoordinator secureKeyLoader:didFailWithError:forRequest:].cold.1(v37);
      objc_initWeak((id *)buf, self);
      v38 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didFailWithError_forRequest___block_invoke;
      block[3] = &unk_24F15BA88;
      objc_copyWeak(&v47, (id *)buf);
      v46 = v10;
      dispatch_after(v38, MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v47);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __79__TVPSecureKeyDeliveryCoordinator_secureKeyLoader_didFailWithError_forRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    WeakRetained = v4;
    if ((v3 & 1) == 0)
    {
      objc_msgSend(v4, "_loadSecureKeyRequest:sendStartReportingEvent:", *(_QWORD *)(a1 + 32), 0);
      WeakRetained = v4;
    }
  }

}

- (TVPSecureKeyDeliveryCoordinator)init
{
  -[TVPSecureKeyDeliveryCoordinator doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)_loadSecureKeyRequest:(id)a3 sendStartReportingEvent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  _BOOL4 v30;
  NSObject *v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = TVPPlaybackReportingEventFPSOverallFetch;
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "reportingID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addStartEventWithName:identifier:", v8, v11);

  }
  -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = TVPPlaybackReportingEventFPSCertFetch;
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "reportingID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addStartEventWithName:identifier:", v13, v16);

  -[TVPSecureKeyDeliveryCoordinator certificateData](self, "certificateData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)sDeliveryCoordinatorLogObject;
    if (os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v6, "requestID");
      _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Using cached cert data for request %lu", buf, 0xCu);

    }
    -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = TVPPlaybackReportingEventFPSCertFetch;
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "reportingID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@%@"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEndEventWithName:identifier:", v21, v24);

    -[TVPSecureKeyDeliveryCoordinator certificateData](self, "certificateData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCertificateData:", v25);

    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader](self, "secureKeyLoader");
    v26 = objc_claimAutoreleasedReturnValue();
    -[NSObject startLoadingContentIdentifierDataForRequest:](v26, "startLoadingContentIdentifierDataForRequest:", v6);
    goto LABEL_13;
  }
  -[TVPSecureKeyDeliveryCoordinator requestsAwaitingCertFetch](self, "requestsAwaitingCertFetch");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObject:", v6);

  v28 = -[TVPSecureKeyDeliveryCoordinator certFetchInProgress](self, "certFetchInProgress");
  v29 = (void *)sDeliveryCoordinatorLogObject;
  v30 = os_log_type_enabled((os_log_t)sDeliveryCoordinatorLogObject, OS_LOG_TYPE_DEFAULT);
  if (!v28)
  {
    if (v30)
    {
      v31 = v29;
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v6, "requestID");
      _os_log_impl(&dword_228A4E000, v31, OS_LOG_TYPE_DEFAULT, "No cached cert data exists in coordinator for request %lu.  Starting cert fetch", buf, 0xCu);

    }
    -[TVPSecureKeyDeliveryCoordinator setCertFetchInProgress:](self, "setCertFetchInProgress:", 1);
    -[TVPSecureKeyDeliveryCoordinator secureKeyLoader](self, "secureKeyLoader");
    v26 = objc_claimAutoreleasedReturnValue();
    -[NSObject startLoadingCertificateDataForRequest:](v26, "startLoadingCertificateDataForRequest:", v6);
    goto LABEL_13;
  }
  if (v30)
  {
    v26 = v29;
    *(_DWORD *)buf = 134217984;
    v33 = objc_msgSend(v6, "requestID");
    _os_log_impl(&dword_228A4E000, v26, OS_LOG_TYPE_DEFAULT, "No cached cert data exists in coordinator for request %lu.  Waiting for cert fetch already in progress to complete", buf, 0xCu);
LABEL_13:

  }
}

- (void)_finishLoadingWithError:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secureKeyDeliveryCoordinator:willFailWithError:", self, v18);

  -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVPSecureKeyDeliveryCoordinator delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secureKeyDeliveryCoordinator:willFailWithError:forKeyRequest:", self, v18, v6);

  }
  -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = TVPPlaybackReportingEventFPSOverallFetch;
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "reportingID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@%@"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEndEventWithName:identifier:", v12, v15);

  -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventError, v18);

  -[TVPSecureKeyDeliveryCoordinator eventCollection](self, "eventCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventErrorEvent, TVPPlaybackReportingEventFPSOverallFetch);

  objc_msgSend(v6, "finishLoadingWithError:", v18);
}

- (TVPSecureKeyDeliveryCoordinatorDelegate)delegate
{
  return (TVPSecureKeyDeliveryCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (TVPSecureKeyLoader)secureKeyLoader
{
  return self->_secureKeyLoader;
}

- (void)setSecureKeyLoader:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyLoader, a3);
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
  objc_storeStrong((id *)&self->_certificateData, a3);
}

- (BOOL)certFetchInProgress
{
  return self->_certFetchInProgress;
}

- (void)setCertFetchInProgress:(BOOL)a3
{
  self->_certFetchInProgress = a3;
}

- (NSMutableSet)requestsAwaitingCertFetch
{
  return self->_requestsAwaitingCertFetch;
}

- (void)setRequestsAwaitingCertFetch:(id)a3
{
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsAwaitingCertFetch, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_secureKeyLoader, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)secureKeyLoader:(uint64_t)a3 didLoadKeyResponseData:(uint64_t)a4 renewalDate:(uint64_t)a5 forRequest:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, a2, a3, "Error converting to offline key data: %@", a5, a6, a7, a8, 2u);
}

- (void)secureKeyLoader:(os_log_t)log didFailWithError:forRequest:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228A4E000, log, OS_LOG_TYPE_ERROR, "Unable to load secure key request.  Retrying in a few seconds.", v1, 2u);
}

- (void)secureKeyLoader:(uint64_t)a3 didFailWithError:(uint64_t)a4 forRequest:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_228A4E000, a2, a3, "Secure Key Delivery failed with error: %@", a5, a6, a7, a8, 2u);
}

@end
