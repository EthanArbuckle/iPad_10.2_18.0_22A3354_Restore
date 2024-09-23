@implementation ICQOfferUpdateController

- (ICQOfferUpdateController)initWithSession:(id)a3
{
  id v5;
  ICQOfferUpdateController *v6;
  ICQOfferUpdateController *v7;

  v5 = a3;
  v6 = -[ICQOfferUpdateController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedURLSession, a3);

  return v7;
}

- (void)performOfferUpdateWithContext:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  ICQRequestProvider *v14;
  void *v15;
  ICQRequestProvider *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[4];
  void (**v46)(id, _QWORD, void *);
  _BYTE *v47;
  _BYTE buf[24];
  _BYTE v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "offerId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttonId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isZeroAction");
    objc_msgSend(v5, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)v49 = v10;
    *(_WORD *)&v49[4] = 2112;
    *(_QWORD *)&v49[6] = v11;
    _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "performOfferUpdateWithContext:%@ - %@ zeroAction:%d account:%@", buf, 0x26u);

  }
  objc_msgSend(v5, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    ICQCreateError(0);
    v16 = (ICQRequestProvider *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v16);
  }
  else
  {
    v14 = [ICQRequestProvider alloc];
    objc_msgSend(v5, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICQRequestProvider initWithAccount:](v14, "initWithAccount:", v15);

    -[ICQRequestProvider urlForUpdateOfferWithContext:](v16, "urlForUpdateOfferWithContext:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", v17, 1, 30.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "offerId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ICQRequestProvider willUseNewKey:offerID:notificationID:](v16, "willUseNewKey:offerID:notificationID:", CFSTR("quotaUpdateOfferURL"), v20, 0);

    if (v21)
    {
      objc_msgSend(v5, "buttonId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v5, "buttonId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("buttonId"));

      }
    }
    else
    {
      objc_msgSend(v5, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "aa_personID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v5, "account");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "aa_personID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("dsid"));

      }
      objc_msgSend(v5, "buttonId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v5, "buttonId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("btnId"));

      }
      objc_msgSend(v5, "offerId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v5, "offerId");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("offerId"));

      }
      if (objc_msgSend(v5, "isZeroAction"))
        objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("directAction"));
    }
    -[ICQRequestProvider addCommonHeadersToRequest:](v16, "addCommonHeadersToRequest:", v18);
    if (!+[ICQRequestProvider attemptSetRequest:toPostWithJSONDict:](ICQRequestProvider, "attemptSetRequest:toPostWithJSONDict:", v18, v19))
    {

      v18 = 0;
    }
    objc_msgSend(v5, "offerId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQRequestProvider httpMethodForKey:offerID:notificationID:](v16, "httpMethodForKey:offerID:notificationID:", CFSTR("quotaUpdateOfferURL"), v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHTTPMethod:", v33);

    if (v18)
    {
      objc_msgSend(v18, "HTTPBody");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v18, "HTTPBody");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (__CFString *)objc_msgSend(v35, "initWithData:encoding:", v36, 4);

      }
      else
      {
        v37 = &stru_1E8B3C468;
      }

      _ICQGetLogSystem();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "allHTTPHeaderFields");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "HTTPBody");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)v49 = v41;
        *(_WORD *)&v49[8] = 2112;
        *(_QWORD *)&v49[10] = v37;
        _os_log_impl(&dword_1CDEBD000, v39, OS_LOG_TYPE_DEFAULT, "update offer request: %@ headers: %@ body: %@ body (as string): %@", buf, 0x2Au);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)v49 = __Block_byref_object_copy__4;
      *(_QWORD *)&v49[8] = __Block_byref_object_dispose__4;
      *(_QWORD *)&v49[16] = self;
      v42 = *(void **)(*(_QWORD *)&v49[16] + 8);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __69__ICQOfferUpdateController_performOfferUpdateWithContext_completion___block_invoke;
      v45[3] = &unk_1E8B38D08;
      v46 = v6;
      v47 = buf;
      objc_msgSend(v42, "dataTaskWithRequest:completionHandler:", v18, v45);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "resume");

      _Block_object_dispose(buf, 8);
    }
    else
    {
LABEL_22:
      _ICQGetLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v17;
        _os_log_impl(&dword_1CDEBD000, v38, OS_LOG_TYPE_DEFAULT, "update offer - failed to create request to URL %@", buf, 0xCu);
      }

      ICQCreateError(0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v18);
    }

  }
}

void __69__ICQOfferUpdateController_performOfferUpdateWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;

  v7 = a4;
  ICQLogDataTaskComplete(CFSTR("updateOffer"), a2, a3, v7);
  (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7 == 0, v7);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedURLSession, 0);
}

@end
