@implementation PPLocalConnectionsStore

- (PPLocalConnectionsStore)initWithPredictionStore:(id)a3 donationStore:(id)a4
{
  id v7;
  id v8;
  PPLocalConnectionsStore *v9;
  PPLocalConnectionsStore *v10;
  uint64_t v11;
  NSCache *identifierToSourceBundleMap;
  uint64_t v13;
  NSCache *nameToIdentifierMap;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPLocalConnectionsStore;
  v9 = -[PPLocalConnectionsStore init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictionStore, a3);
    objc_storeStrong((id *)&v10->_donationStore, a4);
    v11 = objc_opt_new();
    identifierToSourceBundleMap = v10->_identifierToSourceBundleMap;
    v10->_identifierToSourceBundleMap = (NSCache *)v11;

    -[NSCache setCountLimit:](v10->_identifierToSourceBundleMap, "setCountLimit:", 3);
    v13 = objc_opt_new();
    nameToIdentifierMap = v10->_nameToIdentifierMap;
    v10->_nameToIdentifierMap = (NSCache *)v13;

    -[NSCache setCountLimit:](v10->_nameToIdentifierMap, "setCountLimit:", 3);
  }

  return v10;
}

- (PPLocalConnectionsStore)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  PPLocalConnectionsStore *v8;
  uint8_t v10[16];

  +[PPConnectionsPredictionStore defaultStore](PPConnectionsPredictionStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsDonationStore defaultStore](PPConnectionsDonationStore, "defaultStore");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    pp_connections_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalConnectionsStore -init failed to get prediction or donation store.", v10, 2u);
    }

    v8 = 0;
  }
  else
  {
    self = -[PPLocalConnectionsStore initWithPredictionStore:donationStore:](self, "initWithPredictionStore:donationStore:", v3, v4);
    v8 = self;
  }

  return v8;
}

- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  NSCache *identifierToSourceBundleMap;
  void *v19;
  void *v20;
  NSCache *nameToIdentifierMap;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PPConnectionsPredictionStore recentLocationsForConsumer:criteria:limit:explanationSet:timeout:error:](self->_predictionStore, "recentLocationsForConsumer:criteria:limit:explanationSet:timeout:error:", a3, a4, a5, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v13 = *MEMORY[0x1E0D70E70];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v15, "originatingBundleID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v13);

        if (v17)
        {
          identifierToSourceBundleMap = self->_identifierToSourceBundleMap;
          objc_msgSend(v15, "originatingBundleID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](identifierToSourceBundleMap, "setObject:forKey:", v19, v20);

          nameToIdentifierMap = self->_nameToIdentifierMap;
          objc_msgSend(v15, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCache setObject:forKey:](nameToIdentifierMap, "setObject:forKey:", v22, v23);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }
  return v9;
}

- (id)recentLocationDonationsSinceDate:(id)a3 error:(id *)a4
{
  return -[PPConnectionsDonationStore recentLocationDonationsSinceDate:error:](self->_donationStore, "recentLocationDonationsSinceDate:error:", a3, a4);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSCache *nameToIdentifierMap;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void (**v35)(id, uint64_t, _QWORD);
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  uint8_t v47[4];
  id v48;
  __int128 buf;
  Class (*v50)(uint64_t);
  void *v51;
  uint64_t *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v47 = 138412290;
    v48 = v6;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPConnections: registerFeedback: %@", v47, 0xCu);
  }

  v8 = v6;
  if (self)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v8;
    objc_msgSend(v8, "feedbackItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v9)
      goto LABEL_39;
    v10 = *(_QWORD *)v38;
    v11 = *MEMORY[0x1E0D70E70];
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        nameToIdentifierMap = self->_nameToIdentifierMap;
        objc_msgSend(v13, "itemString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCache objectForKey:](nameToIdentifierMap, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16
          || (objc_msgSend(v13, "itemString"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              v27 = objc_msgSend(v26, "length") == 36,
              v26,
              v27)
          && (objc_msgSend(v13, "itemString"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[NSCache objectForKey:](self->_identifierToSourceBundleMap, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "hasPrefix:", v11);

          if (!v18)
            goto LABEL_37;
          v41 = 0;
          v42 = &v41;
          v43 = 0x2050000000;
          v19 = (void *)getAFAnalyticsClass_softClass;
          v44 = getAFAnalyticsClass_softClass;
          if (!getAFAnalyticsClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v50 = __getAFAnalyticsClass_block_invoke;
            v51 = &unk_1E7E1F798;
            v52 = &v41;
            __getAFAnalyticsClass_block_invoke((uint64_t)&buf);
            v19 = (void *)v42[3];
          }
          v20 = objc_retainAutorelease(v19);
          _Block_object_dispose(&v41, 8);
          objc_msgSend(v20, "sharedAnalytics");
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v45 = CFSTR("identifier");
            v46 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
            v22 = objc_claimAutoreleasedReturnValue();
            pp_connections_log_handle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v16;
              _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: reporting %@ DisplayedInMaps to Siri", (uint8_t *)&buf, 0xCu);
            }

            -[NSObject logEventWithType:context:](v21, "logEventWithType:context:", 6201, v22);
            v24 = objc_msgSend(v13, "itemFeedbackType");
            if ((v24 - 3) < 3)
            {
              pp_connections_log_handle();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: %@ was rejected or offered", (uint8_t *)&buf, 0xCu);
              }

            }
            else if ((v24 - 1) >= 2)
            {
              if (!v24)
              {
                pp_default_log_handle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                {
                  objc_msgSend(v34, "clientIdentifier");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf) = 138412290;
                  *(_QWORD *)((char *)&buf + 4) = v30;
                  _os_log_fault_impl(&dword_1C392E000, v29, OS_LOG_TYPE_FAULT, "PPConnections: registerFeedback: received feedback of unknown type from %@", (uint8_t *)&buf, 0xCu);

                }
              }
            }
            else
            {
              pp_connections_log_handle();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v16;
                _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: reporting %@ SelectedInMaps to Siri", (uint8_t *)&buf, 0xCu);
              }

              -[NSObject logEventWithType:context:](v21, "logEventWithType:context:", 6202, v22);
            }
          }
          else
          {
            pp_default_log_handle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, "PPConnections: registerFeedback: failed to soft link AFAnalytics", (uint8_t *)&buf, 2u);
            }
          }

        }
        else
        {
          pp_default_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPConnections: registerFeedback: skipping immediate processing of feedback due to lack of identifier.", (uint8_t *)&buf, 2u);
          }
          v16 = 0;
        }

LABEL_37:
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      if (!v9)
      {
LABEL_39:

        v8 = v34;
        break;
      }
    }
  }
  v31 = v8;

  v32 = (void *)objc_opt_new();
  +[PPInternalFeedback fromBaseFeedback:storeType:](PPInternalFeedback, "fromBaseFeedback:storeType:", v31, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "storePendingFeedback:storeType:error:", v33, 6, 0);

  if (v35)
    v35[2](v35, 1, 0);

}

- (void)processFeedback:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "feedbackItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v8, 5, 2, 1);
    objc_msgSend(v8, "feedbackItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v8, v5, v6, v7, 5);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameToIdentifierMap, 0);
  objc_storeStrong((id *)&self->_identifierToSourceBundleMap, 0);
  objc_storeStrong((id *)&self->_donationStore, 0);
  objc_storeStrong((id *)&self->_predictionStore, 0);
}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  pthread_mutex_lock(&defaultStore_lock_13164);
  if (!defaultStore_instance_13165)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_13165;
    defaultStore_instance_13165 = v2;

    if (!defaultStore_instance_13165)
    {
      pp_connections_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalConnectionsStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }

    }
  }
  v5 = (id)defaultStore_instance_13165;
  pthread_mutex_unlock(&defaultStore_lock_13164);
  return v5;
}

@end
