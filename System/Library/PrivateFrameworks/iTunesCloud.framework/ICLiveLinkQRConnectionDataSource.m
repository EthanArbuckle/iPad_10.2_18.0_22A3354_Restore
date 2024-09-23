@implementation ICLiveLinkQRConnectionDataSource

- (ICLiveLinkQRConnectionDataSource)initWithSharedListeningSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6;
  id v7;
  ICLiveLinkQRConnectionDataSource *v8;
  uint64_t v9;
  NSString *externalIdentifier;
  uint64_t v11;
  NSString *sharedListeningSessionIdentifier;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICLiveLinkQRConnectionDataSource;
  v8 = -[ICLiveLinkQRConnectionDataSource init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "externalIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v8->_externalIdentifier;
    v8->_externalIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    sharedListeningSessionIdentifier = v8->_sharedListeningSessionIdentifier;
    v8->_sharedListeningSessionIdentifier = (NSString *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.amp.mediaservices.MSVQRConnectionLiveLinkDataSource.serialQueue", v13);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  ICLiveLinkQRConnectionDataSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICLiveLinkQRConnectionDataSource;
  -[ICLiveLinkQRConnectionDataSource dealloc](&v4, sel_dealloc);
}

- (void)populateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICLiveLinkQRConnectionDataSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke;
  v7[3] = &unk_1E4390EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_provisionUserPseudonymWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  ICLiveLinkQRConnectionDataSource *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  ICLiveLinkQRConnectionDataSource *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICLiveLinkQRConnectionDataSource account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICLiveLinkQRConnectionDataSource account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountRegisteredURIs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringForKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURI"));
      v10 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleForKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"));
      v13 = v12;

      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v48 = (void *)v10;
      if (v10)
      {
        objc_msgSend(v14, "timeIntervalSinceNow");
        if (v16 >= 120.0)
        {
          -[ICLiveLinkQRConnectionDataSource service](self, "service");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pseudonymURIMap");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count"))
          {
            v44 = self;
            v45 = v15;
            v46 = v8;
            v47 = v4;
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v43 = v19;
            v20 = v19;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v52;
              while (2)
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v52 != v23)
                    objc_enumerationMutation(v20);
                  v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  objc_msgSend(v25, "properties", v43);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "expirationDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "timeIntervalSinceNow");
                  if (v28 >= 120.0)
                  {
                    objc_msgSend(v25, "URI");
                    v29 = v20;
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "prefixedURI");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "isEqualToString:", v48);

                    v20 = v29;
                    if (v32)
                    {
                      v38 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v25, "URI");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "prefixedURI");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v25, "properties");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v41, "expirationDate");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 134218498;
                        v56 = v44;
                        v57 = 2114;
                        v58 = v40;
                        v59 = 2114;
                        v60 = v42;
                        _os_log_impl(&dword_1A03E3000, v38, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Using existing pseudonym: %{public}@ with expiry: %{public}@", buf, 0x20u);

                        v20 = v29;
                      }

                      v4 = v47;
                      (*((void (**)(id, void *, _QWORD))v47 + 2))(v47, v25, 0);

                      v15 = v45;
                      v8 = v46;
                      goto LABEL_21;
                    }
                  }
                  else
                  {

                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
                if (v22)
                  continue;
                break;
              }
            }

            v8 = v46;
            v4 = v47;
            self = v44;
            v15 = v45;
            v19 = v43;
          }

        }
      }
      -[ICLiveLinkQRConnectionDataSource service](self, "service", v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:", CFSTR("SharedListening"), 0, 43200.0);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      v34 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218243;
        v56 = self;
        v57 = 2113;
        v58 = v8;
        _os_log_impl(&dword_1A03E3000, v34, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Provisioning pseudonym for uri: %{private}@.", buf, 0x16u);
      }

      -[ICLiveLinkQRConnectionDataSource service](self, "service");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __74__ICLiveLinkQRConnectionDataSource__provisionUserPseudonymWithCompletion___block_invoke;
      v49[3] = &unk_1E438F2E0;
      v49[4] = self;
      v50 = v4;
      objc_msgSend(v35, "provisionPseudonymForURI:withProperties:completion:", v8, v20, v49);

LABEL_21:
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CF88], 101, CFSTR("User account has no registered URIs."));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v37);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CF88], 100, CFSTR("No account found on service."));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v36);

  }
}

- (void)_beginPseudonymAutoRenewal
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6 + -120.0;

  if (v7 < 0.0)
    v7 = 0.0;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D4D110]);
  -[ICLiveLinkQRConnectionDataSource queue](self, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __62__ICLiveLinkQRConnectionDataSource__beginPseudonymAutoRenewal__block_invoke;
  v14 = &unk_1E4391400;
  objc_copyWeak(&v15, &location);
  v10 = (void *)objc_msgSend(v8, "initWithInterval:queue:block:", v9, &v11, v7);
  -[ICLiveLinkQRConnectionDataSource setPseudonymRenewalTimer:](self, "setPseudonymRenewalTimer:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_renewUserPseudonym
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  ICLiveLinkQRConnectionDataSource *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefixedURI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Will renew pseudonym %{public}@", buf, 0x16u);

  }
  -[ICLiveLinkQRConnectionDataSource service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke;
  v9[3] = &unk_1E438F308;
  v9[4] = self;
  objc_msgSend(v7, "renewPseudonym:forUpdatedDuration:completion:", v8, v9, 43200.0);

}

- (void)_revokeUserPseudonymWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ICLiveLinkQRConnectionDataSource pseudonymRenewalTimer](self, "pseudonymRenewalTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ICLiveLinkQRConnectionDataSource setPseudonymRenewalTimer:](self, "setPseudonymRenewalTimer:", 0);
  -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICLiveLinkQRConnectionDataSource service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__ICLiveLinkQRConnectionDataSource__revokeUserPseudonymWithCompletion___block_invoke;
    v9[3] = &unk_1E438F330;
    v10 = v4;
    objc_msgSend(v7, "revokePseudonym:completion:", v8, v9);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)_joinSharedListeningSessionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  ICStoreRequestContext *v16;
  void *v17;
  ICStoreRequestContext *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  ICLiveLinkQRConnectionDataSource *v25;
  __CFString *v26;
  id v27;
  uint8_t buf[4];
  ICLiveLinkQRConnectionDataSource *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICLiveLinkQRConnectionDataSource sharedListeningSessionIdentifier](self, "sharedListeningSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      -[ICLiveLinkQRConnectionDataSource sharedListeningSessionIdentifier](self, "sharedListeningSessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URI");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "prefixedURI");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v29 = self;
      v30 = 2114;
      v31 = v8;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Joining shared listening session %{public}@ with handle %{public}@", buf, 0x20u);

    }
    v12 = CFSTR("Join Request");
  }
  else
  {
    if (v7)
    {
      -[ICLiveLinkQRConnectionDataSource pseudonym](self, "pseudonym");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URI");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "prefixedURI");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v29 = self;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Creating shared listening session with handle %{public}@", buf, 0x16u);

    }
    v12 = CFSTR("Create Request");
  }

  v16 = [ICStoreRequestContext alloc];
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ICStoreRequestContext initWithIdentity:](v16, "initWithIdentity:", v17);

  -[ICLiveLinkQRConnectionDataSource report](self, "report");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startEvent:withParentEvent:", CFSTR("Get Bag"), CFSTR("Session Discovery"));
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke;
  v23[3] = &unk_1E4390738;
  v24 = v19;
  v25 = self;
  v26 = (__CFString *)v12;
  v27 = v4;
  v21 = v4;
  v22 = v19;
  objc_msgSend(v20, "getBagForRequestContext:withCompletionHandler:", v18, v23);

}

- (id)sessionURLForBag:(id)a3 error:(id *)a4
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
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint8_t buf[4];
  ICLiveLinkQRConnectionDataSource *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "dictionaryForBagKey:", CFSTR("ampMusicAPIDomains"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_NSIsNSDictionary() & 1) == 0)
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Missing music API domains.", buf, 0xCu);
    }

    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D4CF88];
      v19 = CFSTR("Missing music API domains.");
LABEL_11:
      objc_msgSend(v17, "msv_errorWithDomain:code:debugDescription:", v18, 102, v19);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sharedListening"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("default"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v25 = self;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Missing default music API domain.", buf, 0xCu);
      }

      if (a4)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0D4CF88];
        v19 = CFSTR("Missing default music API domain.");
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  objc_msgSend(v6, "stringForBagKey:", CFSTR("countryCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICLiveLinkQRConnectionDataSource sharedListeningSessionIdentifier](self, "sharedListeningSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E98];
    v12 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
    {
      -[ICLiveLinkQRConnectionDataSource sharedListeningSessionIdentifier](self, "sharedListeningSessionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("https://%@/v1/shared-media/%@/join/media-sessions/%@"), v8, v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://%@/v1/shared-media/%@/create/media-sessions"), v8, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URLWithString:", v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> bag is missing country code", buf, 0xCu);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CF88], 102, CFSTR("Bag is missing country code."));
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

LABEL_24:
  return v15;
}

- (IDSAccount)account
{
  IDSAccount *account;
  IDSAccount **p_account;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_account = &self->_account;
  account = self->_account;
  if (!account)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[ICLiveLinkQRConnectionDataSource service](self, "service", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "accountType") == 1 && objc_msgSend(v10, "isActive"))
          {
            objc_storeStrong((id *)p_account, v10);
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

    account = *p_account;
  }
  return account;
}

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("SharedListening");
}

- (NSString)rpcPath
{
  return (NSString *)CFSTR("/SharedListening/stream");
}

- (NSString)applicationProtocol
{
  return (NSString *)CFSTR("qrp-01");
}

- (id)trustHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke;
  v4[3] = &unk_1E438F3F8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1A1AFA8D0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSUUID)groupSessionIdentifier
{
  return self->_groupSessionIdentifier;
}

- (void)setGroupSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupSessionIdentifier, a3);
}

- (NSDictionary)groupSessionOptions
{
  return self->_groupSessionOptions;
}

- (void)setGroupSessionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_groupSessionOptions, a3);
}

- (NSURL)sharedListeningSessionInviteURL
{
  return self->_sharedListeningSessionInviteURL;
}

- (void)setSharedListeningSessionInviteURL:(id)a3
{
  objc_storeStrong((id *)&self->_sharedListeningSessionInviteURL, a3);
}

- (NSString)sharedListeningSessionIdentifier
{
  return self->_sharedListeningSessionIdentifier;
}

- (void)setSharedListeningSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sharedSessionToken
{
  return self->_sharedSessionToken;
}

- (void)setSharedSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_sharedSessionToken, a3);
}

- (ICSharedListeningConnectionReport)report
{
  return (ICSharedListeningConnectionReport *)objc_loadWeakRetained((id *)&self->_report);
}

- (void)setReport:(id)a3
{
  objc_storeWeak((id *)&self->_report, a3);
}

- (id)dataSourceErrorHandler
{
  return self->_dataSourceErrorHandler;
}

- (void)setDataSourceErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (IDSPseudonym)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_pseudonym, a3);
}

- (MSVTimer)pseudonymRenewalTimer
{
  return self->_pseudonymRenewalTimer;
}

- (void)setPseudonymRenewalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_pseudonymRenewalTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pseudonymRenewalTimer, 0);
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong(&self->_dataSourceErrorHandler, 0);
  objc_destroyWeak((id *)&self->_report);
  objc_storeStrong((id *)&self->_sharedSessionToken, 0);
  objc_storeStrong((id *)&self->_sharedListeningSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedListeningSessionInviteURL, 0);
  objc_storeStrong((id *)&self->_groupSessionOptions, 0);
  objc_storeStrong((id *)&self->_groupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

void __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  NSObject *v8;
  NSObject *v9;
  void (**v10)(id, uint64_t, _QWORD);
  id WeakRetained;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  uint64_t AppleSSLPinned;
  const void *v20;
  __SecTrust *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD result[4];
  void (**v26)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  id v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!MSVDeviceOSIsInternalInstall())
  {
    v16 = 0;
    v18 = CFSTR("music-colistening.itunes.apple.com");
LABEL_14:
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("QA2")))
    {
      v10[2](v10, 1, 0);
    }
    else
    {
      AppleSSLPinned = SecPolicyCreateAppleSSLPinned();
      if (AppleSSLPinned)
      {
        v20 = (const void *)AppleSSLPinned;
        v21 = sec_trust_copy_ref(v8);
        SecTrustSetPolicies(v21, v20);
        CFRelease(v20);
        result[0] = MEMORY[0x1E0C809B0];
        result[1] = 3221225472;
        result[2] = __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke_169;
        result[3] = &unk_1E438F3D0;
        v26 = v10;
        SecTrustEvaluateAsyncWithError(v21, v9, result);

      }
      else
      {
        v22 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v28 = WeakRetained;
          _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to create pinning policy.", buf, 0xCu);
        }

        v10[2](v10, 0, 0);
      }
    }
    goto LABEL_30;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileipod"));
  objc_msgSend(v12, "stringForKey:", CFSTR("PotluckEnvironment"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("Default");
  if (v13)
    v15 = (__CFString *)v13;
  v16 = v15;

  v17 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218243;
    v28 = WeakRetained;
    v29 = 2113;
    v30 = v16;
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Selected environment %{private}@.", buf, 0x16u);
  }

  if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Default")) & 1) != 0
    || (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Production")) & 1) != 0
    || (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Carry")) & 1) != 0
    || (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("QA2")) & 1) != 0)
  {
    v18 = CFSTR("music-colistening.itunes.apple.com");
  }
  else if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Sandbox")) & 1) != 0)
  {
    v18 = CFSTR("music-colistening-sandbox.itunes.apple.com");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("Custom")))
    {
      v18 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v12, "stringForKey:", CFSTR("PotluckCustomHostName"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_27;
  }
  if (-[__CFString length](v18, "length"))
  {

    goto LABEL_14;
  }
LABEL_27:
  v23 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v28 = WeakRetained;
    _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Cannot determine environment.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", *MEMORY[0x1E0D4CF88], 300, CFSTR("Cannot determine environment."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v24);

LABEL_30:
}

uint64_t __48__ICLiveLinkQRConnectionDataSource_trustHandler__block_invoke_169(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICMusicKitURLRequest *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  ICMusicKitRequestContext *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  void *v53;
  _BYTE buf[24];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "endEvent:withError:", CFSTR("Get Bag"), v6);
  if (!v6)
  {
    v9 = a1[5];
    v47 = 0;
    objc_msgSend(v9, "sessionURLForBag:error:", v5, &v47);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v47;
    if (v11)
    {
      (*((void (**)(void))a1[7] + 2))();
LABEL_22:

      goto LABEL_23;
    }
    v12 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[5];
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> resolved session discovery URL %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(v43, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "pseudonym");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prefixedURI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v16, CFSTR("anonymousHandle"));

    objc_msgSend(a1[5], "externalIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v17, CFSTR("externalParticipantId"));

    v18 = (void *)MEMORY[0x1E0CB36D8];
    v52 = CFSTR("parameters");
    v53 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataWithJSONObject:options:error:", v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setHTTPBody:", v20);

    v41 = -[ICMusicKitRequestContext initWithBlock:]([ICMusicKitRequestContext alloc], "initWithBlock:", &__block_literal_global_29352);
    v21 = -[ICMusicKitURLRequest initWithURLRequest:requestContext:]([ICMusicKitURLRequest alloc], "initWithURLRequest:requestContext:", v43, v41);
    objc_msgSend(a1[5], "sharedListeningSessionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("sharedListening/join");
    if (!v22)
      v23 = CFSTR("sharedListening/create");
    v40 = v23;

    -[ICURLRequest enableLoadURLMetricsWithRequestName:](v21, "enableLoadURLMetricsWithRequestName:", v40);
    objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v25 = (_QWORD *)getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
    v55 = getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
    if (!getMCFeatureExplicitContentAllowedSymbolLoc_ptr)
    {
      v26 = ManagedConfigurationLibrary();
      v25 = dlsym(v26, "MCFeatureExplicitContentAllowed");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v25;
      getMCFeatureExplicitContentAllowedSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(buf, 8);
    if (v25)
    {
      v27 = objc_msgSend(v24, "effectiveBoolValueForSetting:", *v25) == 1;

      if (!v27)
      {
        v50 = CFSTR("itre");
        v51 = CFSTR("1");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMusicKitURLRequest setAdditionalHTTPCookies:](v21, "setAdditionalHTTPCookies:", v28);

      }
      objc_msgSend(getMCProfileConnectionClass(), "sharedConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v30 = (_QWORD *)getMCFeatureMusicVideosAllowedSymbolLoc_ptr;
      v55 = getMCFeatureMusicVideosAllowedSymbolLoc_ptr;
      if (!getMCFeatureMusicVideosAllowedSymbolLoc_ptr)
      {
        v31 = ManagedConfigurationLibrary();
        v30 = dlsym(v31, "MCFeatureMusicVideosAllowed");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v30;
        getMCFeatureMusicVideosAllowedSymbolLoc_ptr = (uint64_t)v30;
      }
      _Block_object_dispose(buf, 8);
      if (v30)
      {
        v32 = objc_msgSend(v29, "effectiveBoolValueForSetting:", *v30) == 1;

        if (!v32)
        {
          v48 = CFSTR("itrv");
          v49 = CFSTR("1");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICMusicKitURLRequest setAdditionalHTTPCookies:](v21, "setAdditionalHTTPCookies:", v33);

        }
        objc_msgSend(a1[5], "report");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "startEvent:withParentEvent:", a1[6], CFSTR("Session Discovery"));

        +[ICURLSessionManager highPrioritySession](ICURLSessionManager, "highPrioritySession");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_2;
        v44[3] = &unk_1E438F3A8;
        v44[4] = a1[5];
        v45 = a1[6];
        v46 = a1[7];
        objc_msgSend(v35, "enqueueDataRequest:withCompletionHandler:", v21, v44);

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureMusicVideosAllowed(void)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("ICLiveLinkQRConnectionDataSource.m"), 35, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureExplicitContentAllowed(void)");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("ICLiveLinkQRConnectionDataSource.m"), 34, CFSTR("%s"), dlerror());

    }
    __break(1u);
  }
  v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = a1[5];
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to load bag with error %{public}@", buf, 0x16u);
  }

  (*((void (**)(void))a1[7] + 2))();
LABEL_23:

}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void (*v35)(void);
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "report");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEvent:withError:", *(_QWORD *)(a1 + 40), v6);

  if (v5 || !v6)
  {
    objc_msgSend(v5, "urlResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("x-responding-instance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parsedBodyDictionary");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      v12 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        v78 = v13;
        v79 = 2112;
        v80 = v74;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEBUG, "[ICQRConnectionLLDS] <%p> Session discovery response %@", buf, 0x16u);
      }

      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("errors"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v11;
      if (_NSIsNSArray() && objc_msgSend(v14, "count"))
      {
        v15 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134218754;
          v78 = v16;
          v79 = 2114;
          v80 = v11;
          v81 = 2114;
          v82 = v73;
          v83 = 2114;
          v84 = v74;
          _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_ERROR, "<%p> response contains errors: instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
        }

        objc_msgSend(v14, "firstObject");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("code"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (_NSIsNSString())
        {
          objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("code"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

        }
        else
        {
          v19 = 0;
        }

        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("messageForDisplay"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        v63 = v14;
        if (v48)
        {
          v50 = v48;
        }
        else
        {
          objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("detail"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (v51)
          {
            v53 = v51;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Server Error [%ld]"), v19);
            v53 = (id)objc_claimAutoreleasedReturnValue();
          }
          v66 = v53;

          v50 = v66;
        }

        v54 = *(_QWORD *)(a1 + 48);
        v67 = (void *)MEMORY[0x1E0CB35C8];
        v55 = *MEMORY[0x1E0D4CF90];
        v56 = *MEMORY[0x1E0CB2D50];
        v75[0] = CFSTR("serverError");
        v75[1] = v56;
        v76[0] = v72;
        v76[1] = v50;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("title"));
        v57 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("detail"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "msv_errorWithDomain:code:userInfo:debugDescription:", v55, v19, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v54 + 16))(v54, 0, 0, v59);

        v26 = (void *)v57;
        v14 = v63;
        v22 = v50;
      }
      else
      {
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("results"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("session"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("attributes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("results"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("joinParams"));
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v24;
        v72 = v21;
        if (v21 && v22 && v24)
        {
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("id"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("groupId"));
          v65 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("anonymousHandles"));
          v64 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("joinToken"));
          v27 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("url"));
          v28 = objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v28);
            v68 = v25;
            v29 = v27;
            v30 = v28;
            v31 = v22;
            v32 = v14;
            v33 = v26;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setSharedListeningSessionInviteURL:", v34);

            v26 = v33;
            v14 = v32;
            v22 = v31;
            v28 = v30;
            v27 = v29;
            v25 = v68;
          }
          v61 = (void *)v28;
          if (v26 && v65 && v64 && v27)
          {
            objc_msgSend(*(id *)(a1 + 32), "setSharedListeningSessionIdentifier:", v26);
            objc_msgSend(*(id *)(a1 + 32), "setSharedSessionToken:", v27);
            v35 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
            v36 = (void *)v65;
            v37 = (void *)v27;
            v38 = (void *)v64;
            v35();
          }
          else
          {
            v60 = (void *)v27;
            v70 = v26;
            v62 = v14;
            v45 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v46 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 134218754;
              v78 = v46;
              v79 = 2114;
              v80 = v71;
              v81 = 2114;
              v82 = v73;
              v83 = 2114;
              v84 = v74;
              _os_log_impl(&dword_1A03E3000, v45, OS_LOG_TYPE_ERROR, "<%p> Response is missing required information. instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 102, v6, CFSTR("Session response is missing required fields."));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            v14 = v62;
            v38 = (void *)v64;
            v36 = (void *)v65;
            v26 = v70;
            v37 = v60;
          }

        }
        else
        {
          v69 = (void *)v24;
          v42 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 134218754;
            v78 = v43;
            v79 = 2114;
            v80 = v71;
            v81 = 2114;
            v82 = v73;
            v83 = 2114;
            v84 = v74;
            _os_log_impl(&dword_1A03E3000, v42, OS_LOG_TYPE_ERROR, "<%p> response is missing required fields: instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);
          }

          v44 = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 102, v6, CFSTR("Session response is missing required fields."));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v44 + 16))(v44, 0, 0, v26);
          v25 = v69;
        }
      }

      v11 = v71;
    }
    else
    {
      v39 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay_Oversize");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "parsedBody");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v78 = v40;
        v79 = 2114;
        v80 = v11;
        v81 = 2114;
        v82 = v73;
        v83 = 2114;
        v84 = v41;
        _os_log_impl(&dword_1A03E3000, v39, OS_LOG_TYPE_ERROR, "<%p> unexpected response instance=%{public}@ correlationKey=%{public}@ body=%{public}@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 102, v6, CFSTR("Session data did not form dictionary."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v78 = v9;
      v79 = 2114;
      v80 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Response error %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 102, v6, CFSTR("Received error from session discovery."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __78__ICLiveLinkQRConnectionDataSource__joinSharedListeningSessionWithCompletion___block_invoke_71(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  v6 = (id)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  +[ICClientInfo clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:](ICClientInfo, "clientInfoForMusicKitRequestWithClientIdentifier:clientVersion:", v6, CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientInfo:", v3);
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentityStore:", v4);

  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentity:", v5);

}

uint64_t __71__ICLiveLinkQRConnectionDataSource__revokeUserPseudonymWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke_2;
  block[3] = &unk_1E4391230;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __55__ICLiveLinkQRConnectionDataSource__renewUserPseudonym__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pseudonym");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v25 = 134217984;
      v26 = v13;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Cleared while renewing pseudonym.", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      v25 = 134218242;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "[ICQRConnectionLLDS] <%p> Failed to renew pseudonym with error: %{public}@", (uint8_t *)&v25, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 101, *(_QWORD *)(a1 + 40), CFSTR("Failed to renew pseudonym."));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURI"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"));

    objc_msgSend(*(id *)(a1 + 32), "dataSourceErrorHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSourceErrorHandler");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSObject *))v12)[2](v12, v8);

    }
LABEL_9:

    return;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "URI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prefixedURI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "expirationDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 134218498;
    v26 = v14;
    v27 = 2114;
    v28 = v16;
    v29 = 2114;
    v30 = v18;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Renewed pseudonym: %{public}@ with expiry: %{public}@", (uint8_t *)&v25, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "URI");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "prefixedURI");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURI"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "properties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "expirationDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceReferenceDate");
  objc_msgSend(v22, "setDouble:forKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"));

  objc_msgSend(*(id *)(a1 + 32), "setPseudonym:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_beginPseudonymAutoRenewal");
}

void __62__ICLiveLinkQRConnectionDataSource__beginPseudonymAutoRenewal__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pseudonymRenewalTimer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

  objc_msgSend(WeakRetained, "_renewUserPseudonym");
}

void __74__ICLiveLinkQRConnectionDataSource__provisionUserPseudonymWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "URI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prefixedURI");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expirationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218754;
    v21 = v8;
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Provisioned pseudonym: %{public}@ with expiry: %{public}@, error: %{public}@", (uint8_t *)&v20, 0x2Au);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x1E0D4CF88], 101, v6, CFSTR("Failed to provision pseudonym."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URI");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prefixedURI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURI"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "expirationDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    objc_msgSend(v17, "setDouble:forKey:", CFSTR("ICLiveLinkQRConnectionDataSourcePseudonymURIExpirationTimestamp"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2;
  v14[3] = &unk_1E438F268;
  v2 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = v2;
  v4 = (void *)MEMORY[0x1A1AFA8D0](v14);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = CFSTR("com.apple.private.alloy.itunes");
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] Creating service %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.itunes"));
  objc_msgSend(*(id *)(a1 + 32), "setService:", v6);

  objc_msgSend(*(id *)(a1 + 32), "report");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startEvent:", CFSTR("Provision Pseudonym"));

  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_29;
  v10[3] = &unk_1E438F2B8;
  v8 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v8;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v11, "_provisionUserPseudonymWithCompletion:", v10);

}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "report");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endEvent:withError:", CFSTR("Session Discovery"), v9);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "pseudonymRenewalTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v10, "setGroupSessionIdentifier:", v7);
    objc_msgSend(*(id *)(a1 + 32), "sharedListeningSessionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSharedListeningSessionIdentifier:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setGroupSessionIdentifier:", v14);

    v15 = *MEMORY[0x1E0D34260];
    v27[0] = *MEMORY[0x1E0D34280];
    v27[1] = v15;
    v28[0] = &unk_1E43E6898;
    v28[1] = MEMORY[0x1E0C9AAB0];
    v16 = *MEMORY[0x1E0D34040];
    v27[2] = *MEMORY[0x1E0D34278];
    v27[3] = v16;
    v28[2] = MEMORY[0x1E0C9AAB0];
    v28[3] = v8;
    v27[4] = *MEMORY[0x1E0D34038];
    objc_msgSend(*(id *)(a1 + 32), "groupSessionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setGroupSessionOptions:", v19);

    v20 = os_log_create("com.apple.amp.iTunesCloud", "QuickRelay");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 32);
      objc_msgSend(v21, "sharedListeningSessionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218242;
      v24 = v21;
      v25 = 2114;
      v26 = v22;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "[ICQRConnectionLLDS] <%p> Populated with shared listening identifier: %{public}@", (uint8_t *)&v23, 0x16u);

    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();

}

void __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_29(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "report");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEvent:withError:", CFSTR("Provision Pseudonym"), v6);

  objc_msgSend(a1[4], "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2_30;
  block[3] = &unk_1E438F290;
  v13 = v6;
  v9 = a1[5];
  v15 = v5;
  v16 = v9;
  v14 = a1[4];
  v17 = a1[6];
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __59__ICLiveLinkQRConnectionDataSource_populateWithCompletion___block_invoke_2_30(uint64_t a1)
{
  void *v3;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setPseudonym:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_beginPseudonymAutoRenewal");
  objc_msgSend(*(id *)(a1 + 40), "report");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startEvent:", CFSTR("Session Discovery"));

  return objc_msgSend(*(id *)(a1 + 40), "_joinSharedListeningSessionWithCompletion:", *(_QWORD *)(a1 + 64));
}

+ (id)dataSourceForNewSharedListeningSessionWithIdentity:(id)a3
{
  id v3;
  ICLiveLinkQRConnectionDataSource *v4;

  v3 = a3;
  v4 = -[ICLiveLinkQRConnectionDataSource initWithSharedListeningSessionIdentifier:identity:]([ICLiveLinkQRConnectionDataSource alloc], "initWithSharedListeningSessionIdentifier:identity:", 0, v3);

  return v4;
}

+ (id)dataSourceForExistingSharedListeningSession:(id)a3 identity:(id)a4
{
  id v5;
  id v6;
  ICLiveLinkQRConnectionDataSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ICLiveLinkQRConnectionDataSource initWithSharedListeningSessionIdentifier:identity:]([ICLiveLinkQRConnectionDataSource alloc], "initWithSharedListeningSessionIdentifier:identity:", v6, v5);

  return v7;
}

@end
