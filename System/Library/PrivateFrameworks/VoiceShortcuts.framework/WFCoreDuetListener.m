@implementation WFCoreDuetListener

- (WFCoreDuetListener)initWithDatabaseProvider:(id)a3 eventQueue:(id)a4
{
  id v8;
  id v9;
  WFCoreDuetListener *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  _CDUserContext *userContext;
  uint64_t v17;
  NSMutableDictionary *registrations;
  WFCoreDuetListener *v19;
  void *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFCoreDuetListener;
  v10 = -[WFCoreDuetListener init](&v22, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.siriactionsd.WFCoreDuetListener", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v15 = objc_claimAutoreleasedReturnValue();
    userContext = v10->_userContext;
    v10->_userContext = (_CDUserContext *)v15;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v10->_eventQueue, a4);
    v17 = objc_opt_new();
    registrations = v10->_registrations;
    v10->_registrations = (NSMutableDictionary *)v17;

    v19 = v10;
  }

  return v10;
}

- (id)databaseWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[WFCoreDuetListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFCoreDuetListener databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFCoreDuetListener queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFCoreDuetListener_registerConfiguredTrigger_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (BOOL)registerTrigger:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  char isKindOfClass;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  BOOL v37;
  _QWORD aBlock[4];
  id v39;
  id location;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  _BYTE v46[14];
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEnabled") & 1) != 0)
  {
    objc_msgSend(v6, "trigger");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!objc_msgSend(v9, "event") || (v10 = objc_msgSend(v9, "event"), v11 = v9, v10 == 1))
      {
        -[WFCoreDuetListener registerSunriseSunsetCallbackIfNeeded](self, "registerSunriseSunsetCallbackIfNeeded");
        v11 = v9;
      }
    }
    else
    {

      v11 = 0;
    }
    v36 = v11;
    objc_msgSend(v9, "contextStorePredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v13 != 0;
    if (v13)
    {
      v35 = objc_msgSend(v9, "contextStoreQualityOfService");
      v14 = objc_msgSend(v9, "contextStoreRegistrationIsForWatch");
      getWFTriggersLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (v14)
          v16 = CFSTR("watch");
        else
          v16 = CFSTR("phone");
        objc_msgSend(v6, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316418;
        v42 = "-[WFCoreDuetListener registerTrigger:error:]";
        v43 = 2112;
        v44 = v13;
        v45 = 1024;
        *(_DWORD *)v46 = v35;
        *(_WORD *)&v46[4] = 2112;
        *(_QWORD *)&v46[6] = v16;
        v47 = 2112;
        v48 = v17;
        v49 = 2114;
        v50 = v19;
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Registering predicate (%@) with QoS (%u) device (%@) for trigger: (%@) of trigger type: (%{public}@)", buf, 0x3Au);

      }
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __44__WFCoreDuetListener_registerTrigger_error___block_invoke;
      aBlock[3] = &unk_1E7AA84B0;
      objc_copyWeak(&v39, &location);
      v20 = _Block_copy(aBlock);
      if (v14)
      {
        v21 = v13;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v23 = v21;
        else
          v23 = 0;
        v24 = v23;

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D15C70], "registrationWithIdentifier:contextualPredicate:deviceTypes:clientIdentifier:mustWake:qualityOfService:callback:", v8, v21, 64, CFSTR("com.apple.siriactionsd.contextstore-registration"), 1, v35, v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          getWFTriggersLogObject();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          {
            v30 = (objc_class *)objc_opt_class();
            NSStringFromClass(v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v42 = "-[WFCoreDuetListener registerTrigger:error:]";
            v43 = 2114;
            v44 = v31;
            _os_log_impl(&dword_1C146A000, v29, OS_LOG_TYPE_FAULT, "%s For watch, predicate must be _CDMDCSContextualPredicate, not %{public}@", buf, 0x16u);

          }
          v25 = 0;
        }

      }
      else
      {
        LODWORD(v34) = v35;
        objc_msgSend(MEMORY[0x1E0D15C70], "registrationWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:clientIdentifier:mustWake:qualityOfService:callback:", v8, v13, 0, 0, CFSTR("com.apple.siriactionsd.contextstore-registration"), 1, v34, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v25, "setLocationManagerEffectiveBundleID:", *MEMORY[0x1E0DC7FD8]);
      -[WFCoreDuetListener registerCallback:withIdentifier:](self, "registerCallback:withIdentifier:", v25, v8);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      getWFTriggersLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v42 = "-[WFCoreDuetListener registerTrigger:error:]";
        v43 = 2112;
        v44 = v9;
        v45 = 2114;
        *(_QWORD *)v46 = v28;
        _os_log_impl(&dword_1C146A000, v26, OS_LOG_TYPE_FAULT, "%s Unable to generate predicate for trigger: %@ of type: %{public}@, unregistering.", buf, 0x20u);

      }
      -[WFCoreDuetListener queue_unregisterCallbackForIdentifier:](self, "queue_unregisterCallbackForIdentifier:", v8);
    }

  }
  else
  {
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDuetListener queue_unregisterCallbackForIdentifier:](self, "queue_unregisterCallbackForIdentifier:", v12);

    v37 = 0;
  }

  return v37;
}

- (void)unregisterConfiguredTriggerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__WFCoreDuetListener_unregisterConfiguredTriggerWithIdentifier___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleCallbackForTriggerWithIdentifier:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _BYTE buf[22];
  __int16 v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[WFCoreDuetListener queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s 🤖 Handling callback for registration with identifier (%{public}@) and info: %@", buf, 0x20u);
  }

  v11 = v8;
  getWFTriggersLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "VCEventInfoForUserFromContextStoreInfo";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s rawInfo: %@", buf, 0x16u);
  }

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NewValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("OldValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v16 = (void *)MEMORY[0x1E0C9AA70];
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v13, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      VCSerializedEventInfo(v17);
      v19 = objc_claimAutoreleasedReturnValue();
      v27 = v18;
      VCSerializedEventInfo(v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v19 | v20)
      {
        if (v19)
          v22 = v19;
        else
          v22 = (uint64_t)v16;
        v34[0] = CFSTR("NewValue");
        v34[1] = CFSTR("OldValue");
        if (v20)
          v23 = v20;
        else
          v23 = (uint64_t)v16;
        *(_QWORD *)buf = v22;
        *(_QWORD *)&buf[8] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v34, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        getWFTriggersLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "VCEventInfoForUserFromContextStoreInfo";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_FAULT, "%s Couldn't build safe object from Context Store info: %@", buf, 0x16u);
        }

        v16 = (void *)MEMORY[0x1E0C9AA70];
      }

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA70];
  }

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke;
  v29[3] = &unk_1E7AA5FD0;
  v29[4] = self;
  v30 = v7;
  v25 = v7;
  -[WFCoreDuetListener fireTriggerWithIdentifier:force:eventInfo:completion:](self, "fireTriggerWithIdentifier:force:eventInfo:completion:", v25, 0, v16, v29);

}

- (BOOL)isCallbackRegisteredWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFCoreDuetListener registrations](self, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7 != 0;
}

- (void)registerCallback:(id)a3 withIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registration"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  -[WFCoreDuetListener queue_unregisterCallbackForIdentifier:](self, "queue_unregisterCallbackForIdentifier:", v7);
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[WFCoreDuetListener registerCallback:withIdentifier:]";
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEBUG, "%s Creating context store registration for identifier: %{public}@", buf, 0x16u);
  }

  -[WFCoreDuetListener userContext](self, "userContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerCallback:", v8);

  -[WFCoreDuetListener registrations](self, "registrations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)queue_unregisterCallbackForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFCoreDuetListener registrations](self, "registrations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = "-[WFCoreDuetListener queue_unregisterCallbackForIdentifier:]";
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s Deleting context store registration for identifier: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    -[WFCoreDuetListener userContext](self, "userContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deregisterCallback:", v7);

    -[WFCoreDuetListener registrations](self, "registrations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v4);

  }
}

- (void)registerSunriseSunsetCallbackIfNeeded
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WFCoreDuetListener queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[WFCoreDuetListener isCallbackRegisteredWithIdentifier:](self, "isCallbackRegisteredWithIdentifier:", CFSTR("com.apple.siriactionsd.registrationForSunsetSunrise"));
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFCoreDuetListener registerSunriseSunsetCallbackIfNeeded]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Already registered for sunrise / sunset changes", buf, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFCoreDuetListener registerSunriseSunsetCallbackIfNeeded]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Registering for sunrise / sunset changes", buf, 0xCu);
    }

    v7 = (void *)MEMORY[0x1E0D15C90];
    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForSunriseSunsetDataDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForChangeAtKeyPath:", v8);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v9 = (void *)MEMORY[0x1E0D15C70];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke;
    v11[3] = &unk_1E7AA84B0;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v9, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.siriactionsd.registrationForSunsetSunrise"), v5, CFSTR("com.apple.siriactionsd.contextstore-registration"), v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCoreDuetListener registerCallback:withIdentifier:](self, "registerCallback:withIdentifier:", v10, CFSTR("com.apple.siriactionsd.registrationForSunsetSunrise"));

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

- (void)handleSunriseSunsetChanged
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[WFCoreDuetListener queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v25 = 0;
  -[WFCoreDuetListener databaseWithError:](self, "databaseWithError:", &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  v6 = v5;
  if (v4)
  {
    v18 = v5;
    v19 = v4;
    objc_msgSend(v4, "allConfiguredTriggers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_1020);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v9;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20 = 0;
          -[WFCoreDuetListener registerTrigger:error:](self, "registerTrigger:error:", v15, &v20);
          v16 = v20;
          if (v16)
          {
            getWFTriggersLogObject();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[WFCoreDuetListener handleSunriseSunsetChanged]";
              v29 = 2114;
              v30 = v16;
              _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_FAULT, "%s Failed to update trigger after sunrise/sunset change: %{public}@", buf, 0x16u);
            }

          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v6 = v18;
    v4 = v19;
  }
  else
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[WFCoreDuetListener handleSunriseSunsetChanged]";
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Failed tp load database: %{public}@", buf, 0x16u);
    }
  }

}

- (void)queue_fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[WFCoreDuetListener queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  -[WFCoreDuetListener eventQueue](self, "eventQueue");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "enqueueTriggerWithIdentifier:eventInfo:force:completion:", v13, v12, v7, v11);

}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v14)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v13)
    goto LABEL_5;
LABEL_3:
  -[WFCoreDuetListener queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WFCoreDuetListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  block[3] = &unk_1E7AA8160;
  block[4] = self;
  v22 = v11;
  v25 = a4;
  v23 = v12;
  v24 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  dispatch_async(v15, block);

}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFCoreDuetListener queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WFCoreDuetListener_checkTriggerStateWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  v16 = v7;
  v17 = v9;
  block[4] = self;
  v11 = v7;
  v12 = v9;
  dispatch_async(v10, block);

}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPathName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCoreDuetListener.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Triggers] Couldn't find keyPath for: %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getWFGeneralLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFCoreDuetListener checkTriggerStateWithKeyPath:completion:]";
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1001, CFSTR("%@"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v16);
    goto LABEL_9;
  }
  -[WFCoreDuetListener userContext](self, "userContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v12)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@) %@"), v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, v16, 0);
LABEL_9:

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Triggers] No value for keyPath: %@"), v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  getWFGeneralLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[WFCoreDuetListener checkTriggerStateWithKeyPath:completion:]";
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6001, CFSTR("%@"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v20);

  v12 = 0;
LABEL_13:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_CDUserContext)userContext
{
  return self->_userContext;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFTriggerEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__WFCoreDuetListener_checkTriggerStateWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v21 = 0;
  objc_msgSend(v2, "databaseWithError:", &v21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
  if (v3)
  {
    objc_msgSend(v3, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "contextStoreKeyPathForCurrentState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "userContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("(%@) %@"), v14, v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Triggers] Couldn't find keyPath for trigger: %@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        getWFGeneralLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
          v24 = 2112;
          v25 = v9;
          _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
        }

        v20 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 1001, CFSTR("%@"), v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, v11);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Triggers] Couldn't find trigger with id: %@"), *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      getWFGeneralLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
        v24 = 2112;
        v25 = v8;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }

      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6003, CFSTR("%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v18 + 16))(v18, 0, 0, v9);
    }

  }
  else
  {
    getWFGeneralLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFCoreDuetListener checkTriggerStateWithIdentifier:completion:]_block_invoke";
      v24 = 2114;
      v25 = v4;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_ERROR, "%s Failed to load database: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __75__WFCoreDuetListener_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_fireTriggerWithIdentifier:force:eventInfo:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id __48__WFCoreDuetListener_handleSunriseSunsetChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v2;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }

  v5 = v4;
  return v5;
}

void __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke_2;
  block[3] = &unk_1E7AA8300;
  block[4] = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __59__WFCoreDuetListener_registerSunriseSunsetCallbackIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSunriseSunsetChanged");
}

void __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggersLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke_140;
  v9[3] = &unk_1E7AA8138;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  dispatch_async(v7, v9);

}

void __66__WFCoreDuetListener_handleCallbackForTriggerWithIdentifier_info___block_invoke_140(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v16 = 0;
  objc_msgSend(v2, "databaseWithError:", &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
  if (v3)
  {
    objc_msgSend(v3, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "needsRegistrationAfterFiring");

    if (v7)
    {
      getWFTriggersLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Re-registering trigger", buf, 0xCu);
      }

      v9 = *(void **)(a1 + 32);
      v15 = 0;
      v10 = objc_msgSend(v9, "registerTrigger:error:", v5, &v15);
      v11 = v15;
      if ((v10 & 1) == 0)
      {
        getWFTriggersLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
          v19 = 2114;
          v20 = v13;
          _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s 🤖 Failed to reregister trigger after firing with identifier: %{public}@", buf, 0x16u);
        }

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFCoreDuetListener handleCallbackForTriggerWithIdentifier:info:]_block_invoke";
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s 🤖 Failed to reregister trigger after firing with identifier because the database could not be loaded: %{public}@", buf, 0x16u);
    }
  }

}

uint64_t __64__WFCoreDuetListener_unregisterConfiguredTriggerWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_unregisterCallbackForIdentifier:", *(_QWORD *)(a1 + 40));
}

void __44__WFCoreDuetListener_registerTrigger_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WFCoreDuetListener_registerTrigger_error___block_invoke_2;
  block[3] = &unk_1E7AA82B0;
  block[4] = WeakRetained;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __44__WFCoreDuetListener_registerTrigger_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCallbackForTriggerWithIdentifier:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__WFCoreDuetListener_registerConfiguredTrigger_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = 0;
  objc_msgSend(v2, "registerTrigger:error:", v3, &v5);
  v4 = v5;
  (*(void (**)(void))(a1[6] + 16))();

}

@end
