@implementation TVPStoreFPSKeyLoader

+ (void)initialize
{
  if (initialize_onceToken_2 != -1)
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_6);
}

void __34__TVPStoreFPSKeyLoader_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sLogObject_1;
  sLogObject_1 = (uint64_t)v0;

}

+ (void)preFetchFPSCertificate
{
  TVPStoreFPSKeyLoader *v2;
  void *v3;

  if (!sCertLoader)
  {
    v2 = objc_alloc_init(TVPStoreFPSKeyLoader);
    v3 = (void *)sCertLoader;
    sCertLoader = (uint64_t)v2;

    objc_msgSend((id)sCertLoader, "_preFetchFPSCertificate");
  }
}

- (TVPStoreFPSKeyLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4
{
  id v6;
  id v7;
  TVPStoreFPSKeyLoader *v8;
  uint64_t v9;
  NSURL *certificateDataURL;
  uint64_t v11;
  NSURL *keyDataURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPStoreFPSKeyLoader;
  v8 = -[TVPStoreFPSKeyLoader init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    certificateDataURL = v8->_certificateDataURL;
    v8->_certificateDataURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    keyDataURL = v8->_keyDataURL;
    v8->_keyDataURL = (NSURL *)v11;

  }
  return v8;
}

- (void)loadSecureKeyRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[TVPStoreFPSKeyLoader secureKeyDeliveryCoordinator](self, "secureKeyDeliveryCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVPStoreFPSKeyLoader secureKeyDeliveryCoordinator](self, "secureKeyDeliveryCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loadSecureKeyRequest:", v4);

    }
    else
    {
      -[TVPStoreFPSKeyLoader pendingKeyRequests](self, "pendingKeyRequests");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[TVPStoreFPSKeyLoader setPendingKeyRequests:](self, "setPendingKeyRequests:", v8);

      }
      -[TVPStoreFPSKeyLoader pendingKeyRequests](self, "pendingKeyRequests");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

      v10 = (void *)sLogObject_1;
      if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        *(_DWORD *)buf = 134217984;
        v16 = objc_msgSend(v4, "requestID");
        _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Waiting for URL bag fetch before handling keyRequest %lu", buf, 0xCu);

      }
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke;
      v13[3] = &unk_24F15BDD0;
      objc_copyWeak(&v14, (id *)buf);
      objc_msgSend(v12, "requestAccessToBagUsingBlock:", v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2;
  v8[3] = &unk_24F15BA88;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v5;
  v9 = v7;
  TVPPerformBlockOnMainThreadIfNeeded(v8);

  objc_destroyWeak(&v10);
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  TVPSecureKeyStandardLoader *v13;
  TVPSecureKeyStandardConnector *v14;
  void *v15;
  void *v16;
  TVPSecureKeyDeliveryCoordinator *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  TVPSecureKeyStandardLoader *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  TVPSecureKeyStandardConnector *v57;
  TVPSecureKeyStandardLoader *v58;
  void *v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "secureKeyDeliveryCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = sLogObject_1;
      if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "URL bag dictionary fetched", buf, 2u);
      }
      if (!*(_QWORD *)(a1 + 32))
      {
        v32 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR))
          __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345020, 0);
        objc_msgSend(v3, "_failPendingKeyRequestsWithError:", v6);
        goto LABEL_38;
      }
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2098]), "initWithURLBagDictionary:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v3, "certificateDataURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "keyDataURL");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (!v7 || !v8)
      {
        objc_msgSend(v6, "pastisCertificateURL");
        v10 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "pastisKeyServerURL");
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
        v7 = (void *)v10;
      }
      if (v7 && v9)
      {
        v60 = v6;
        v12 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Certificate and key server URLs available; creating loader objects",
            buf,
            2u);
        }
        v59 = v7;
        v13 = -[TVPSecureKeyStandardLoader initWithCertificateDataURL:keyDataURL:]([TVPSecureKeyStandardLoader alloc], "initWithCertificateDataURL:keyDataURL:", v7, v9);
        v14 = objc_alloc_init(TVPSecureKeyStandardConnector);
        -[TVPSecureKeyStandardLoader setRequestGenerator:](v13, "setRequestGenerator:", v14);
        v57 = v14;
        -[TVPSecureKeyStandardLoader setConnectionHandler:](v13, "setConnectionHandler:", v14);
        -[TVPSecureKeyStandardLoader setHoldKeyResponses:](v13, "setHoldKeyResponses:", objc_msgSend(v3, "holdKeyResponses"));
        -[TVPSecureKeyStandardLoader setDidSkipRentalCheckout:](v13, "setDidSkipRentalCheckout:", objc_msgSend(v3, "didSkipRentalCheckout"));
        -[TVPSecureKeyStandardLoader setIncludeGUID:](v13, "setIncludeGUID:", objc_msgSend(v3, "includeGUID"));
        -[TVPSecureKeyStandardLoader setRequiresExternalEntitlementCheck:](v13, "setRequiresExternalEntitlementCheck:", objc_msgSend(v3, "requiresExternalEntitlementCheck"));
        objc_msgSend(v3, "serviceProviderID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPSecureKeyStandardLoader setServiceProviderID:](v13, "setServiceProviderID:", v15);

        objc_msgSend(v3, "rentalID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPSecureKeyStandardLoader setRentalID:](v13, "setRentalID:", v16);

        objc_msgSend(v3, "setSecureKeyStandardLoader:", v13);
        v58 = v13;
        v17 = -[TVPSecureKeyDeliveryCoordinator initWithSecureKeyLoader:]([TVPSecureKeyDeliveryCoordinator alloc], "initWithSecureKeyLoader:", v13);
        -[TVPSecureKeyDeliveryCoordinator setDelegate:](v17, "setDelegate:", v3);
        objc_msgSend(v3, "eventCollection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPSecureKeyDeliveryCoordinator setEventCollection:](v17, "setEventCollection:", v18);

        objc_msgSend(v3, "setSecureKeyDeliveryCoordinator:", v17);
        objc_msgSend(v3, "pendingKeyRequests");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");

        v61 = v3;
        objc_msgSend(v3, "pendingKeyRequests");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeAllObjects");

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v22 = v20;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v63 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              if ((objc_msgSend(v27, "isCancelled") & 1) != 0)
              {
                v28 = (void *)sLogObject_1;
                if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = v28;
                  v30 = objc_msgSend(v27, "requestID");
                  *(_DWORD *)buf = 134217984;
                  v67 = v30;
                  _os_log_impl(&dword_228A4E000, v29, OS_LOG_TYPE_DEFAULT, "Not loading request %lu since it has been cancelled", buf, 0xCu);

                }
              }
              else
              {
                -[TVPSecureKeyDeliveryCoordinator loadSecureKeyRequest:](v17, "loadSecureKeyRequest:", v27);
              }
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
          }
          while (v24);
        }

        v6 = v60;
        v3 = v61;
        v7 = v59;
        v31 = v58;
      }
      else
      {
        if (!v7)
        {
          v40 = sLogObject_1;
          if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR))
            __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_3(v40, v41, v42, v43, v44, v45, v46, v47);
          v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345021, 0);
          objc_msgSend(v3, "_failPendingKeyRequestsWithError:", v48);

        }
        if (v9)
          goto LABEL_37;
        v49 = sLogObject_1;
        if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_ERROR))
          __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_2(v49, v50, v51, v52, v53, v54, v55, v56);
        v31 = (TVPSecureKeyStandardLoader *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.ATV.secureKeyDelivery"), -345022, 0);
        objc_msgSend(v3, "_failPendingKeyRequestsWithError:", v31);
      }

LABEL_37:
LABEL_38:

    }
  }

}

- (void)setEventCollection:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_eventCollection, a3);
  -[TVPStoreFPSKeyLoader secureKeyDeliveryCoordinator](self, "secureKeyDeliveryCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVPStoreFPSKeyLoader secureKeyDeliveryCoordinator](self, "secureKeyDeliveryCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEventCollection:", v7);

  }
}

- (void)setHoldKeyResponses:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_holdKeyResponses = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHoldKeyResponses:", v3);

}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_didSkipRentalCheckout = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDidSkipRentalCheckout:", v3);

}

- (void)setIncludeGUID:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_includeGUID = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeGUID:", v3);

}

- (void)setRequiresExternalEntitlementCheck:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_requiresExternalEntitlementCheck = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequiresExternalEntitlementCheck:", v3);

}

- (void)setServiceProviderID:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_serviceProviderID, a3);
  v5 = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceProviderID:", v5);

}

- (void)setRentalID:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_rentalID, a3);
  v5 = a3;
  -[TVPStoreFPSKeyLoader secureKeyStandardLoader](self, "secureKeyStandardLoader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRentalID:", v5);

}

- (void)sendStopRequest
{
  id v2;

  -[TVPStoreFPSKeyLoader secureKeyDeliveryCoordinator](self, "secureKeyDeliveryCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendStopRequest");

}

- (void)secureKeyDeliveryCoordinatorWillSucceed:(id)a3 forKeyRequest:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[TVPStoreFPSKeyLoader setError:](self, "setError:", 0);
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeFPSKeyLoaderWillSucceed:forKeyRequest:", self, v8);

  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 willFailWithError:(id)a4 forKeyRequest:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[TVPStoreFPSKeyLoader error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[TVPStoreFPSKeyLoader setError:](self, "setError:", v12);
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storeFPSKeyLoader:willFailWithError:forKeyRequest:", self, v12, v7);

  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeFPSKeyLoader:didReceiveUpdatedRentalExpirationDate:", self, v8);

  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalPlaybackStartDate:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeFPSKeyLoader:didReceiveUpdatedRentalPlaybackStartDate:", self, v8);

  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveOfflineKeyData:(id)a4 forKeyRequest:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeFPSKeyLoader:didLoadOfflineKeyData:forKeyRequest:", self, v11, v7);

  }
}

- (void)secureKeyDeliveryCoordinator:(id)a3 didReceiveUpdatedRentalExpirationDate:(id)a4 playbackStartDate:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[TVPStoreFPSKeyLoader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TVPStoreFPSKeyLoader delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storeFPSKeyLoader:didReceiveUpdatedRentalExpirationDate:playbackStartDate:", self, v11, v7);

  }
}

- (void)secureKeyLoader:(id)a3 didFailWithError:(id)a4 forRequest:(id)a5
{
  void *v5;

  v5 = (void *)sCertLoader;
  sCertLoader = 0;

}

- (void)secureKeyLoader:(id)a3 didLoadCertificateData:(id)a4 forRequest:(id)a5
{
  void *v5;

  v5 = (void *)sCertLoader;
  sCertLoader = 0;

}

- (void)_preFetchFPSCertificate
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEC8C50], "sharedBagLoadingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke;
  v3[3] = &unk_24F15BDD0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "requestAccessToBagUsingBlock:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke_2;
  v8[3] = &unk_24F15BA88;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v7 = v5;
  v9 = v7;
  TVPPerformBlockOnMainThreadIfNeeded(v8);

  objc_destroyWeak(&v10);
}

void __47__TVPStoreFPSKeyLoader__preFetchFPSCertificate__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  TVPSecureKeyStandardLoader *v8;
  TVPSecureKeyStandardConnector *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v10 = WeakRetained;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2098]), "initWithURLBagDictionary:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "pastisCertificateURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pastisKeyServerURL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = -[TVPSecureKeyStandardLoader initWithCertificateDataURL:keyDataURL:]([TVPSecureKeyStandardLoader alloc], "initWithCertificateDataURL:keyDataURL:", v4, v5);
      v9 = objc_alloc_init(TVPSecureKeyStandardConnector);
      -[TVPSecureKeyStandardLoader setRequestGenerator:](v8, "setRequestGenerator:", v9);
      -[TVPSecureKeyStandardLoader setConnectionHandler:](v8, "setConnectionHandler:", v9);
      -[TVPSecureKeyLoader setDelegate:](v8, "setDelegate:", v10);
      objc_msgSend(v10, "setFpsCertLoader:", v8);
      -[TVPSecureKeyStandardLoader startLoadingCertificateDataForRequest:](v8, "startLoadingCertificateDataForRequest:", 0);

    }
    WeakRetained = v10;
  }

}

- (void)_failPendingKeyRequestsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVPStoreFPSKeyLoader pendingKeyRequests](self, "pendingKeyRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[TVPStoreFPSKeyLoader pendingKeyRequests](self, "pendingKeyRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v20;
    *(_QWORD *)&v10 = 134217984;
    v18 = v10;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isCancelled", v18, (_QWORD)v19) & 1) != 0)
        {
          v15 = (void *)sLogObject_1;
          if (os_log_type_enabled((os_log_t)sLogObject_1, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = objc_msgSend(v14, "requestID");
            *(_DWORD *)buf = v18;
            v24 = v17;
            _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Not failing request %lu since it has been cancelled", buf, 0xCu);

          }
        }
        else
        {
          objc_msgSend(v14, "finishLoadingWithError:", v4);
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

}

- (TVPStoreFPSKeyLoaderDelegate)delegate
{
  return (TVPStoreFPSKeyLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (TVPPlaybackReportingEventCollection)eventCollection
{
  return self->_eventCollection;
}

- (BOOL)holdKeyResponses
{
  return self->_holdKeyResponses;
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (BOOL)includeGUID
{
  return self->_includeGUID;
}

- (BOOL)requiresExternalEntitlementCheck
{
  return self->_requiresExternalEntitlementCheck;
}

- (NSString)serviceProviderID
{
  return self->_serviceProviderID;
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (TVPSecureKeyDeliveryCoordinator)secureKeyDeliveryCoordinator
{
  return self->_secureKeyDeliveryCoordinator;
}

- (void)setSecureKeyDeliveryCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyDeliveryCoordinator, a3);
}

- (TVPSecureKeyStandardLoader)secureKeyStandardLoader
{
  return self->_secureKeyStandardLoader;
}

- (void)setSecureKeyStandardLoader:(id)a3
{
  objc_storeStrong((id *)&self->_secureKeyStandardLoader, a3);
}

- (NSMutableArray)pendingKeyRequests
{
  return self->_pendingKeyRequests;
}

- (void)setPendingKeyRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingKeyRequests, a3);
}

- (TVPSecureKeyStandardLoader)fpsCertLoader
{
  return self->_fpsCertLoader;
}

- (void)setFpsCertLoader:(id)a3
{
  objc_storeStrong((id *)&self->_fpsCertLoader, a3);
}

- (NSURL)certificateDataURL
{
  return self->_certificateDataURL;
}

- (void)setCertificateDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)keyDataURL
{
  return self->_keyDataURL;
}

- (void)setKeyDataURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDataURL, 0);
  objc_storeStrong((id *)&self->_certificateDataURL, 0);
  objc_storeStrong((id *)&self->_fpsCertLoader, 0);
  objc_storeStrong((id *)&self->_pendingKeyRequests, 0);
  objc_storeStrong((id *)&self->_secureKeyStandardLoader, 0);
  objc_storeStrong((id *)&self->_secureKeyDeliveryCoordinator, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_serviceProviderID, 0);
  objc_storeStrong((id *)&self->_eventCollection, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228A4E000, a1, a3, "Unable to create loader objects since bag dictionary is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228A4E000, a1, a3, "Unable to create loader objects because key data URL is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __45__TVPStoreFPSKeyLoader_loadSecureKeyRequest___block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228A4E000, a1, a3, "Unable to create loader objects because certificate URL is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
