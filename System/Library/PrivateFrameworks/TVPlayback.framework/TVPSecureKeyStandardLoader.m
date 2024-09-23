@implementation TVPSecureKeyStandardLoader

+ (void)initialize
{
  if (initialize_onceToken_1 != -1)
    dispatch_once(&initialize_onceToken_1, &__block_literal_global_5);
}

void __40__TVPSecureKeyStandardLoader_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v1 = (void *)sStandardLoaderLogObject;
  sStandardLoaderLogObject = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)sCachedCertData;
  sCachedCertData = (uint64_t)v2;

}

- (TVPSecureKeyStandardLoader)initWithCertificateDataURL:(id)a3 keyDataURL:(id)a4
{
  id v7;
  id v8;
  TVPSecureKeyStandardLoader *v9;
  TVPSecureKeyStandardLoader *v10;
  NSMutableArray *v11;
  NSMutableArray *pendingKeyResponses;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPSecureKeyStandardLoader;
  v9 = -[TVPSecureKeyStandardLoader init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certificateDataURL, a3);
    objc_storeStrong((id *)&v10->_keyDataURL, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingKeyResponses = v10->_pendingKeyResponses;
    v10->_pendingKeyResponses = v11;

  }
  return v10;
}

- (void)setHoldKeyResponses:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (self->_holdKeyResponses != a3)
  {
    v3 = a3;
    self->_holdKeyResponses = a3;
    v5 = sStandardLoaderLogObject;
    v6 = os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Holding subsequent key responses", buf, 2u);
      }
    }
    else
    {
      if (v6)
      {
        v7 = v5;
        -[TVPSecureKeyStandardLoader pendingKeyResponses](self, "pendingKeyResponses");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v28 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "No longer holding key responses.  Sending responses for %lu pending responses", buf, 0xCu);

      }
      -[TVPSecureKeyStandardLoader pendingKeyResponses](self, "pendingKeyResponses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      -[TVPSecureKeyStandardLoader pendingKeyResponses](self, "pendingKeyResponses");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAllObjects");

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v16);
            -[TVPSecureKeyLoader delegate](self, "delegate", (_QWORD)v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "keyData");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "renewalDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "request");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "secureKeyLoader:didLoadKeyResponseData:renewalDate:forRequest:", self, v19, v20, v21);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }

    }
  }
}

- (id)_assetIdentifierForKeyRequest:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyJSONDataForRequest:(id)a3 forceStop:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  objc_msgSend(v6, "keyRequestData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "requestID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("id"));

  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("spc"));
  objc_msgSend(v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("uri"));
  if (-[TVPSecureKeyStandardLoader includeGUID](self, "includeGUID"))
  {
    objc_msgSend(MEMORY[0x24BE08118], "deviceGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("guid"));

  }
  -[TVPSecureKeyStandardLoader rentalID](self, "rentalID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend(v6, "rentalID"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v9, "setObject:forKey:", v14, CFSTR("rental-id"));

  }
  if (-[TVPSecureKeyStandardLoader requiresExternalEntitlementCheck](self, "requiresExternalEntitlementCheck"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("isExternal"));
  -[TVPSecureKeyStandardLoader serviceProviderID](self, "serviceProviderID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    -[TVPSecureKeyStandardLoader serviceProviderID](self, "serviceProviderID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("svcId"));

  }
  if (a4)
  {
    v18 = CFSTR("stop");
  }
  else if (objc_msgSend(v6, "isRenewal"))
  {
    v18 = CFSTR("renew");
  }
  else
  {
    v18 = CFSTR("start");
  }
  objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("lease-action"));
  if (-[TVPSecureKeyStandardLoader didSkipRentalCheckout](self, "didSkipRentalCheckout"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("skipped-rental-checkout"));
  if (objc_msgSend(v6, "retrievesOfflineKeys"))
    objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("offline"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v9);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", &unk_24F1734E0, CFSTR("version"));
  objc_msgSend(v20, "setObject:forKey:", v19, CFSTR("streaming-keys"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", v20, CFSTR("fairplay-streaming-request"));
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v21, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (TVPSecureKeyStandardLoader)init
{
  -[TVPSecureKeyStandardLoader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)startLoadingCertificateDataForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  BOOL v21;
  uint8_t buf[8];
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v4 = a3;
  -[TVPSecureKeyStandardLoader certificateDataURL](self, "certificateDataURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sCachedCertData, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke;
  v23[3] = &unk_24F15BCF8;
  v7 = v4;
  v24 = v7;
  objc_copyWeak(&v25, &location);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x22E2BA4B0](v23);
  if (v5)
  {
    v9 = objc_msgSend(v6, "length");
    if (v9)
    {
      v10 = sStandardLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Returning cached cert data.  Refreshing cert data, but not waiting for response", buf, 2u);
      }
      -[TVPSecureKeyLoader eventCollection](self, "eventCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventFPSUsingCachedCertData, MEMORY[0x24BDBD1C8]);

      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v6, 0);
    }
    else
    {
      -[TVPSecureKeyLoader eventCollection](self, "eventCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventFPSUsingCachedCertData, MEMORY[0x24BDBD1C0]);

      v14 = sStandardLoaderLogObject;
      if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "No cached cert data available.  Fetching cert data and waiting for response", buf, 2u);
      }
    }
    -[TVPSecureKeyStandardLoader requestGenerator](self, "requestGenerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyStandardLoader certificateDataURL](self, "certificateDataURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "secureKeyStandardLoader:requestForFetchingDataFromURL:", self, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPSecureKeyStandardLoader connectionHandler](self, "connectionHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke_61;
    v18[3] = &unk_24F15BD20;
    v19 = v5;
    v21 = v9 == 0;
    v20 = v8;
    objc_msgSend(v17, "secureKeyStandardLoader:sendAsynchronousRequest:completionHandler:", self, v12, v18);

  }
  else
  {
    TVPSKDErrorWithCode(-345021);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v12);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = *(_QWORD *)(a1 + 32);
    if (v10)
      objc_msgSend(v7, "secureKeyLoader:didLoadCertificateData:forRequest:", v8, v10, v9);
    else
      objc_msgSend(v7, "secureKeyLoader:didFailWithError:forRequest:", v8, v5, v9);

  }
}

void __68__TVPSecureKeyStandardLoader_startLoadingCertificateDataForRequest___block_invoke_61(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "length") && *(_QWORD *)(a1 + 32))
  {
    v8 = sStandardLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Updating cached cert data", buf, 2u);
    }
    objc_msgSend((id)sCachedCertData, "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v9 = sStandardLoaderLogObject;
    if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Returning newly fetched cert data", v10, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)startLoadingContentIdentifierDataForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TVPSecureKeyStandardLoader _assetIdentifierForKeyRequest:](self, "_assetIdentifierForKeyRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureKeyLoader:didLoadContentIdentifierData:forRequest:", self, v6, v4);
  }
  else
  {
    TVPSKDErrorWithCode(-345005);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureKeyLoader:didFailWithError:forRequest:", self, v6, v4);
  }

}

- (void)startLoadingKeyResponseDataForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[TVPSecureKeyStandardLoader savedRequestToUseForStopping](self, "savedRequestToUseForStopping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[TVPSecureKeyStandardLoader setSavedRequestToUseForStopping:](self, "setSavedRequestToUseForStopping:", v4);
  -[TVPSecureKeyStandardLoader keyDataURL](self, "keyDataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[TVPSecureKeyStandardLoader _bodyJSONDataForRequest:forceStop:](self, "_bodyJSONDataForRequest:forceStop:", v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPSecureKeyStandardLoader requestGenerator](self, "requestGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secureKeyStandardLoader:requestForPostingData:toURL:", self, v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    -[TVPSecureKeyStandardLoader connectionHandler](self, "connectionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke;
    v11[3] = &unk_24F15BD48;
    v12 = v4;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v10, "secureKeyStandardLoader:sendAsynchronousRequest:completionHandler:", self, v9, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    -[TVPSecureKeyLoader delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TVPSKDErrorWithCode(-345022);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureKeyLoader:didFailWithError:forRequest:", self, v9, v4);
  }

}

void __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  char v32;
  void *v33;
  id WeakRetained;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  __CFString *v43;
  void *v44;
  NSObject *v45;
  id v46;
  void *v47;
  char v48;
  TVPSecureKeyResponse *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  void *v60;
  char v61;
  id v62;
  id v63;
  void *v64;
  char v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  char v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  int v76;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  double v96;
  void *v97;
  id v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  _BYTE buf[24];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "statusCode") == 403)
    {
      v10 = -345018;
LABEL_28:
      TVPSKDErrorWithCode(v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v35, "secureKeyLoader:didFailWithError:forRequest:", v36, v33, *(_QWORD *)(a1 + 32));

      goto LABEL_62;
    }
    if (v7)
    {
      if (!objc_msgSend(v7, "length"))
      {
        v10 = -345009;
        goto LABEL_28;
      }
      v111 = *(id *)(a1 + 32);
      *(_QWORD *)buf = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, buf);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = *(id *)buf;
      v109 = v11;
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
        goto LABEL_35;
      }
      objc_msgSend(v11, "objectForKey:", CFSTR("fairplay-streaming-response"));
      v12 = objc_claimAutoreleasedReturnValue();
      v105 = (void *)v12;
      if (!v12 || (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
LABEL_34:

LABEL_35:
        v108 = v28;
        v106 = v29;
        v37 = v30;
        v112 = v31;
        v38 = v27;
        v110 = v37;
        if ((v32 & 1) == 0)
        {
          v49 = (TVPSecureKeyResponse *)objc_loadWeakRetained((id *)(a1 + 40));
          -[TVPSecureKeyResponse delegate](v49, "delegate");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v50, "secureKeyLoader:didFailWithError:forRequest:", v51, v38, *(_QWORD *)(a1 + 32));
          v53 = v106;
          v52 = v108;
LABEL_61:

          goto LABEL_62;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "allHeaderFields");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "tvp_appleTimingAppHeaderValue");

          if (v40 >= 1)
          {
            v41 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v41, "eventCollection");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = TVPPlaybackReportingEventFPSServerProcessingTimeMS;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addSingleShotEventWithName:value:", v43, v44);

          }
        }
        if (v37)
        {
          v45 = sStandardLoaderLogObject;
          if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v37;
            _os_log_impl(&dword_228A4E000, v45, OS_LOG_TYPE_DEFAULT, "Rental expiration date: %@", buf, 0xCu);
          }
          v46 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v46, "rentalExpirationDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v37, "isEqualToDate:", v47);

          if ((v48 & 1) != 0)
          {
            LODWORD(v37) = 0;
          }
          else
          {
            v54 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v54, "setRentalExpirationDate:", v37);

            v55 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v55, "delegate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v56, "secureKeyLoader:didReceiveUpdatedRentalExpirationDate:", v57, v37);

            LODWORD(v37) = 1;
          }
        }
        if (!v112)
          goto LABEL_50;
        v58 = sStandardLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v112;
          _os_log_impl(&dword_228A4E000, v58, OS_LOG_TYPE_DEFAULT, "Rental playback start date: %@", buf, 0xCu);
        }
        v59 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v59, "rentalPlaybackStartDate");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v112, "isEqualToDate:", v60);

        if ((v61 & 1) == 0)
        {
          v62 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v62, "setRentalPlaybackStartDate:", v112);

          v63 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v63, "delegate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_opt_respondsToSelector();

          if ((v65 & 1) != 0)
          {
            v66 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v66, "delegate");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(v67, "secureKeyLoader:didReceiveUpdatedRentalPlaybackStartDate:", v68, v112);

          }
        }
        else
        {
LABEL_50:
          if (!(_DWORD)v37)
          {
LABEL_56:
            v75 = objc_loadWeakRetained((id *)(a1 + 40));
            v76 = objc_msgSend(v75, "holdKeyResponses");

            if (v76)
            {
              v77 = (void *)sStandardLoaderLogObject;
              v52 = v108;
              if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_DEFAULT))
              {
                v78 = *(void **)(a1 + 32);
                v79 = v77;
                v80 = objc_msgSend(v78, "requestID");
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v80;
                _os_log_impl(&dword_228A4E000, v79, OS_LOG_TYPE_DEFAULT, "Adding FPS key response to pending responses for id %lu", buf, 0xCu);

              }
              v81 = *(void **)(a1 + 32);
              v82 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
              objc_msgSend(v82, "numberWithDouble:");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "setRequestCompletionTime:", v83);

              v49 = objc_alloc_init(TVPSecureKeyResponse);
              -[TVPSecureKeyResponse setKeyData:](v49, "setKeyData:", v108);
              v53 = v106;
              -[TVPSecureKeyResponse setRenewalDate:](v49, "setRenewalDate:", v106);
              -[TVPSecureKeyResponse setRequest:](v49, "setRequest:", *(_QWORD *)(a1 + 32));
              v50 = objc_loadWeakRetained((id *)(a1 + 40));
              objc_msgSend(v50, "pendingKeyResponses");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "addObject:", v49);
            }
            else
            {
              v49 = (TVPSecureKeyResponse *)objc_loadWeakRetained((id *)(a1 + 40));
              -[TVPSecureKeyResponse delegate](v49, "delegate");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_loadWeakRetained((id *)(a1 + 40));
              v53 = v106;
              v52 = v108;
              objc_msgSend(v50, "secureKeyLoader:didLoadKeyResponseData:renewalDate:forRequest:", v51, v108, v106, *(_QWORD *)(a1 + 32));
            }
            goto LABEL_61;
          }
        }
        v69 = objc_loadWeakRetained((id *)(a1 + 40));
        objc_msgSend(v69, "delegate");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_opt_respondsToSelector();

        if ((v71 & 1) != 0)
        {
          v72 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v72, "delegate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v73, "secureKeyLoader:didReceiveUpdatedRentalExpirationDate:playbackStartDate:", v74, v110, v112);

        }
        goto LABEL_56;
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("version"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v104 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("streaming-keys"));
      v14 = objc_claimAutoreleasedReturnValue();
      v103 = (void *)v14;
      if (!v14
        || (v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || !objc_msgSend(v15, "count"))
      {
        TVPSKDErrorWithCode(-345008);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
LABEL_32:

        goto LABEL_33;
      }
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = objc_claimAutoreleasedReturnValue();
      v102 = (void *)v16;
      if (!v16 || (v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        TVPSKDErrorWithCode(-345008);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = 0;
        v29 = 0;
        v30 = 0;
        v31 = 0;
        v32 = 0;
LABEL_68:

        goto LABEL_32;
      }
      objc_msgSend(v17, "objectForKey:", CFSTR("status"));
      v18 = objc_claimAutoreleasedReturnValue();
      v101 = (void *)v18;
      if (v18 && (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v20 = objc_msgSend(v19, "integerValue");
        if (!v20)
        {
          objc_msgSend(v102, "objectForKey:", CFSTR("ckc"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if (v100 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v100, "length"))
          {
            objc_msgSend(v102, "objectForKey:", CFSTR("renew-after"));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            if (v84 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              objc_msgSend(v111, "startDate");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "doubleValue");
              objc_msgSend(v85, "dateByAddingTimeInterval:");
              v29 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v29 = 0;
            }

            objc_msgSend(v102, "objectForKey:", CFSTR("expiration-time"));
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if (v94 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v95 = objc_alloc(MEMORY[0x24BDBCE60]);
              objc_msgSend(v94, "doubleValue");
              v30 = (id)objc_msgSend(v95, "initWithTimeIntervalSince1970:", v96 / 1000.0);
            }
            else
            {
              v30 = 0;
            }

            objc_msgSend(v102, "objectForKey:", CFSTR("playback-start-time"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            if (v97 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v98 = objc_alloc(MEMORY[0x24BDBCE60]);
              objc_msgSend(v97, "doubleValue");
              v31 = (id)objc_msgSend(v98, "initWithTimeIntervalSince1970:", v99 / 1000.0);
            }
            else
            {
              v31 = 0;
            }

            v32 = 1;
            v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v100, 1);
            v27 = 0;
            v28 = v86;
          }
          else
          {
            TVPSKDErrorWithCode(-345008);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 0;
            v29 = 0;
            v30 = 0;
            v31 = 0;
            v32 = 0;
            v27 = v86;
          }
          v87 = v86;

          goto LABEL_67;
        }
        v21 = v20;
        v22 = sStandardLoaderLogObject;
        if (os_log_type_enabled((os_log_t)sStandardLoaderLogObject, OS_LOG_TYPE_ERROR))
          __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke_cold_1(v21, v22);
        switch(v21)
        {
          case -1009:
            v23 = -345017;
            goto LABEL_65;
          case -1008:
            v23 = -345016;
            goto LABEL_65;
          case -1004:
            v23 = -345014;
            goto LABEL_65;
          case -1002:
            v23 = -345015;
            goto LABEL_65;
          default:
            v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.fpsRequest"), v21, 0);
            TVPSKDErrorWithCode(-345013);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "userInfo");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = (void *)objc_msgSend(v90, "mutableCopy");

            objc_msgSend(v91, "setObject:forKey:", v88, *MEMORY[0x24BDD1398]);
            v92 = objc_alloc(MEMORY[0x24BDD1540]);
            objc_msgSend(v89, "domain");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (id)objc_msgSend(v92, "initWithDomain:code:userInfo:", v93, objc_msgSend(v89, "code"), v91);

            break;
        }
      }
      else
      {
        v23 = -345008;
LABEL_65:
        TVPSKDErrorWithCode(v23);
        v27 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
LABEL_67:

      goto LABEL_68;
    }
    v24 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v24, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v25, "secureKeyLoader:didFailWithError:forRequest:", v26, v9, *(_QWORD *)(a1 + 32));

  }
LABEL_62:

}

- (void)sendStopRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[TVPSecureKeyStandardLoader savedRequestToUseForStopping](self, "savedRequestToUseForStopping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVPSecureKeyStandardLoader keyDataURL](self, "keyDataURL");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[TVPSecureKeyStandardLoader savedRequestToUseForStopping](self, "savedRequestToUseForStopping");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPSecureKeyStandardLoader _bodyJSONDataForRequest:forceStop:](self, "_bodyJSONDataForRequest:forceStop:", v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPSecureKeyStandardLoader requestGenerator](self, "requestGenerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "secureKeyStandardLoader:requestForPostingData:toURL:", self, v5, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPSecureKeyStandardLoader connectionHandler](self, "connectionHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "secureKeyStandardLoader:sendAsynchronousRequest:completionHandler:", self, v7, &__block_literal_global_70);

    }
    -[TVPSecureKeyStandardLoader setSavedRequestToUseForStopping:](self, "setSavedRequestToUseForStopping:", 0);

  }
}

- (TVPSecureKeyStandardLoaderRequestGenerating)requestGenerator
{
  return self->_requestGenerator;
}

- (void)setRequestGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_requestGenerator, a3);
}

- (TVPSecureKeyStandardLoaderConnectionHandling)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_connectionHandler, a3);
}

- (BOOL)holdKeyResponses
{
  return self->_holdKeyResponses;
}

- (BOOL)didSkipRentalCheckout
{
  return self->_didSkipRentalCheckout;
}

- (void)setDidSkipRentalCheckout:(BOOL)a3
{
  self->_didSkipRentalCheckout = a3;
}

- (BOOL)includeGUID
{
  return self->_includeGUID;
}

- (void)setIncludeGUID:(BOOL)a3
{
  self->_includeGUID = a3;
}

- (BOOL)requiresExternalEntitlementCheck
{
  return self->_requiresExternalEntitlementCheck;
}

- (void)setRequiresExternalEntitlementCheck:(BOOL)a3
{
  self->_requiresExternalEntitlementCheck = a3;
}

- (NSString)serviceProviderID
{
  return self->_serviceProviderID;
}

- (void)setServiceProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderID, a3);
}

- (NSNumber)rentalID
{
  return self->_rentalID;
}

- (void)setRentalID:(id)a3
{
  objc_storeStrong((id *)&self->_rentalID, a3);
}

- (NSURL)certificateDataURL
{
  return self->_certificateDataURL;
}

- (void)setCertificateDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_certificateDataURL, a3);
}

- (NSURL)keyDataURL
{
  return self->_keyDataURL;
}

- (void)setKeyDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_keyDataURL, a3);
}

- (TVPSecureKeyRequest)savedRequestToUseForStopping
{
  return self->_savedRequestToUseForStopping;
}

- (void)setSavedRequestToUseForStopping:(id)a3
{
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, a3);
}

- (NSMutableArray)pendingKeyResponses
{
  return self->_pendingKeyResponses;
}

- (void)setPendingKeyResponses:(id)a3
{
  objc_storeStrong((id *)&self->_pendingKeyResponses, a3);
}

- (NSDate)rentalExpirationDate
{
  return self->_rentalExpirationDate;
}

- (void)setRentalExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_rentalExpirationDate, a3);
}

- (NSDate)rentalPlaybackStartDate
{
  return self->_rentalPlaybackStartDate;
}

- (void)setRentalPlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_rentalExpirationDate, 0);
  objc_storeStrong((id *)&self->_pendingKeyResponses, 0);
  objc_storeStrong((id *)&self->_savedRequestToUseForStopping, 0);
  objc_storeStrong((id *)&self->_keyDataURL, 0);
  objc_storeStrong((id *)&self->_certificateDataURL, 0);
  objc_storeStrong((id *)&self->_rentalID, 0);
  objc_storeStrong((id *)&self->_serviceProviderID, 0);
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_requestGenerator, 0);
}

void __68__TVPSecureKeyStandardLoader_startLoadingKeyResponseDataForRequest___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_228A4E000, a2, OS_LOG_TYPE_ERROR, "Received FPS response error status of %ld", (uint8_t *)&v2, 0xCu);
}

@end
