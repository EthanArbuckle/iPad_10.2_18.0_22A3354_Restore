@implementation ICQNetworkRequestController

- (ICQNetworkRequestController)init
{
  void *v3;
  void *v4;
  void *v5;
  ICQNetworkRequestController *v6;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("ICQNetworkRequestControllerSession"));
  objc_msgSend(v3, "set_appleIDContext:", v4);

  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQNetworkRequestController initWithSession:](self, "initWithSession:", v5);

  return v6;
}

- (ICQNetworkRequestController)initWithSession:(id)a3
{
  return -[ICQNetworkRequestController initWithSession:numberOfSecondsBetweenRetries:](self, "initWithSession:numberOfSecondsBetweenRetries:", a3, &unk_1E8B552B8);
}

- (ICQNetworkRequestController)initWithSession:(id)a3 numberOfSecondsBetweenRetries:(id)a4
{
  NSURLSession *v6;
  NSArray *v7;
  ICQNetworkRequestController *v8;
  NSURLSession *session;
  NSURLSession *v10;
  NSArray *numberOfSecondsBetweenRetries;
  objc_super v13;

  v6 = (NSURLSession *)a3;
  v7 = (NSArray *)a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQNetworkRequestController;
  v8 = -[ICQNetworkRequestController init](&v13, sel_init);
  session = v8->_session;
  v8->_session = v6;
  v10 = v6;

  numberOfSecondsBetweenRetries = v8->_numberOfSecondsBetweenRetries;
  v8->_numberOfSecondsBetweenRetries = v7;

  return v8;
}

- (void)executeRequest:(id)a3 acceptedStatusCodes:(id)a4 renewHeadersBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ICQRetryController *v15;
  NSUInteger v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  char v42;
  _QWORD v43[5];
  id v44;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)-[NSArray copy](self->_numberOfSecondsBetweenRetries, "copy");
  objc_initWeak(&location, self);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  v44 = (id)objc_msgSend(v10, "mutableCopy");
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v15 = [ICQRetryController alloc];
  v16 = -[NSArray count](self->_numberOfSecondsBetweenRetries, "count");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke;
  v23[3] = &unk_1E8B38298;
  objc_copyWeak(&v32, &location);
  v23[4] = self;
  v17 = v13;
  v26 = v17;
  v28 = &v33;
  v29 = v43;
  v18 = v11;
  v24 = v18;
  v30 = v41;
  v31 = v39;
  v19 = v14;
  v25 = v19;
  v20 = v12;
  v27 = v20;
  v21 = -[ICQRetryController initWithMaxNumberOfRetries:block:](v15, "initWithMaxNumberOfRetries:block:", v16, v23);
  v22 = (void *)v34[5];
  v34[5] = v21;

  objc_msgSend((id)v34[5], "executeBlock");
  _Block_object_dispose(&v33, 8);

  objc_destroyWeak(&v32);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  objc_destroyWeak(&location);
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "numberOfAttempts");
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 134218242;
      v49 = v5;
      v50 = 2112;
      v51 = v6;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "Making attempt (%lu) for network request %@.", buf, 0x16u);
    }

    v7 = (void *)WeakRetained[1];
    v8 = MEMORY[0x1E0C809B0];
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_14;
    v41[3] = &unk_1E8B38248;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 80);
    v42 = v10;
    v45 = v11;
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 72);
    v44 = v12;
    v46 = v13;
    v47 = *(_OWORD *)(a1 + 88);
    v43 = *(id *)(a1 + 48);
    objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v9, v41);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "icq_hasAuthHeaders")
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      objc_msgSend(v14, "resume");
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 88);
      if (*(_BYTE *)(*(_QWORD *)(v15 + 8) + 24))
      {
        _ICQGetLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);

        v24 = *(_QWORD *)(a1 + 56);
        ICQCreateError(15);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v24 + 16))(v24, 0, 0, v25);

        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = 0;

      }
      else
      {
        v32 = *(_QWORD *)(a1 + 64);
        v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v36[0] = v8;
        v36[1] = 3221225472;
        v36[2] = __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_18;
        v36[3] = &unk_1E8B38270;
        v39 = v15;
        v37 = v14;
        v34 = *(id *)(a1 + 56);
        v35 = *(_QWORD *)(a1 + 72);
        v38 = v34;
        v40 = v35;
        (*(void (**)(uint64_t, uint64_t, _QWORD *))(v32 + 16))(v32, v33, v36);

      }
    }

    v31 = v42;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_1(a1, v4);

    v28 = *(_QWORD *)(a1 + 56);
    ICQCreateError(0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v28 + 16))(v28, 0, 0, v29);

    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = 0;
  }

}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_14(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  _ICQGetLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 138412546;
    v53 = v13;
    v54 = 2048;
    v55 = objc_msgSend(v10, "statusCode");
    _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, "Request to (%@) returned status code %lu.", (uint8_t *)&v52, 0x16u);

  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "statusCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

  if ((_DWORD)v14)
  {
    _ICQGetLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v52 = 138413058;
      v53 = v17;
      v54 = 2112;
      v55 = (uint64_t)v7;
      v56 = 2112;
      v57 = (uint64_t)v10;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "Request (%@) succeeded with data (%@) with response (%@) with error (%@)", (uint8_t *)&v52, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;
    goto LABEL_15;
  }
  objc_msgSend(v10, "allHeaderFields");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Retry-After"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "statusCode") == 429)
  {
    +[ICQError retryErrorWithRetryAfter:](ICQError, "retryErrorWithRetryAfter:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v52 = 138413314;
      v53 = v23;
      v54 = 2112;
      v55 = (uint64_t)v19;
      v56 = 2112;
      v57 = (uint64_t)v7;
      v58 = 2112;
      v59 = v10;
      v60 = 2112;
      v61 = v9;
      v24 = "Request (%@) failed from 429 with Retry-After (%@) with data (%@) with response (%@) with error (%@)";
LABEL_13:
      _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v52, 0x34u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "statusCode") == 503)
  {
    +[ICQError serviceUnavailableWithRetryAfter:](ICQError, "serviceUnavailableWithRetryAfter:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _ICQGetLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v52 = 138413314;
      v53 = v25;
      v54 = 2112;
      v55 = (uint64_t)v19;
      v56 = 2112;
      v57 = (uint64_t)v7;
      v58 = 2112;
      v59 = v10;
      v60 = 2112;
      v61 = v9;
      v24 = "Request (%@) failed from 503 with Retry-After (%@) with data (%@) with response (%@) with error (%@)";
      goto LABEL_13;
    }
LABEL_14:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = 0;

    goto LABEL_15;
  }
  if (objc_msgSend(v10, "statusCode") == 400 || objc_msgSend(v10, "statusCode") == 401)
  {
    _ICQGetLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v30 = objc_msgSend(v10, "statusCode");
      v52 = 138413314;
      v53 = v29;
      v54 = 2048;
      v55 = v30;
      v56 = 2112;
      v57 = (uint64_t)v7;
      v58 = 2112;
      v59 = v10;
      v60 = 2112;
      v61 = v9;
      _os_log_impl(&dword_1CDEBD000, v28, OS_LOG_TYPE_DEFAULT, "Request (%@) failed from client error %ld with data (%@) with response (%@) with error (%@). Will attempt to renew headers.", (uint8_t *)&v52, 0x34u);
    }

    v31 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    _ICQGetLogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_14_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);

      v41 = *(_QWORD *)(a1 + 48);
      +[ICQError clientErrorWithStatusCode:](ICQError, "clientErrorWithStatusCode:", objc_msgSend(v10, "statusCode"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, id, void *))(v41 + 16))(v41, v7, v10, v42);

LABEL_34:
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v51 = *(void **)(v50 + 40);
      *(_QWORD *)(v50 + 40) = 0;

      goto LABEL_15;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v52) = 0;
      _os_log_impl(&dword_1CDEBD000, v33, OS_LOG_TYPE_DEFAULT, "400 or 401 but we have not attempted to renew yet.", (uint8_t *)&v52, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  v43 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "numberOfAttempts") - 1;
  if (v43 >= objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    _ICQGetLogSystem();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v52 = 138413058;
      v53 = v49;
      v54 = 2112;
      v55 = (uint64_t)v7;
      v56 = 2112;
      v57 = (uint64_t)v10;
      v58 = 2112;
      v59 = v9;
      _os_log_impl(&dword_1CDEBD000, v48, OS_LOG_TYPE_DEFAULT, "Request (%@) failed with no more retries with data (%@) with response (%@) with error (%@)", (uint8_t *)&v52, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_34;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "unsignedIntegerValue");

  _ICQGetLogSystem();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v52 = 138412802;
    v53 = v47;
    v54 = 2048;
    v55 = v43;
    v56 = 2048;
    v57 = v45;
    _os_log_impl(&dword_1CDEBD000, v46, OS_LOG_TYPE_DEFAULT, "Retrying request (%@) with attempt (%lu) with retryAfterSeconds (%lu)", (uint8_t *)&v52, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "retryAfterSeconds:", v45);
LABEL_15:

}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_18(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Request headers renewed successfully", v17, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "resume");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_18_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(_QWORD *)(a1 + 40);
    ICQCreateError(15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v13 + 16))(v13, 0, 0, v14);

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfSecondsBetweenRetries, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_ERROR, "%@ instance no longer exist.", (uint8_t *)&v4, 0xCu);

}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Already attempted renewal, giving up on this request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_14_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Failed to renew headers, will not retry", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __95__ICQNetworkRequestController_executeRequest_acceptedStatusCodes_renewHeadersBlock_completion___block_invoke_18_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CDEBD000, a1, a3, "Failed to renew headers, will not launch request", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
