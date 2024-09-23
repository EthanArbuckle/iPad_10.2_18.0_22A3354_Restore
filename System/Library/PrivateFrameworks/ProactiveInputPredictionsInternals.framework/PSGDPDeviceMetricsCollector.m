@implementation PSGDPDeviceMetricsCollector

- (id)initAsDelegate
{
  PSGDPDeviceMetricsCollector *v2;
  uint64_t v3;
  IDSService *idsService;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSGDPDeviceMetricsCollector;
  v2 = -[PSGDPDeviceMetricsCollector init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.suggestions.smartreplies"));
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v3;

    v5 = dispatch_queue_create("com.apple.dpwatchmetricscollection.idsSend", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, v2->_queue);
  }
  return v2;
}

- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  dispatch_queue_t v8;
  PSGDPDeviceMetricsCollector *v9;

  v4 = (objc_class *)MEMORY[0x24BE4FCB8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithService:", CFSTR("com.apple.private.alloy.suggestions.smartreplies"));
  objc_msgSend(MEMORY[0x24BE28698], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("com.apple.dpwatchmetricscollection.idsSend", 0);
  v9 = -[PSGDPDeviceMetricsCollector initWithActivityManager:idsService:queue:store:](self, "initWithActivityManager:idsService:queue:store:", v5, v6, v8, v7);

  return v9;
}

- (PSGDPDeviceMetricsCollector)initWithActivityManager:(id)a3 idsService:(id)a4 queue:(id)a5 store:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PSGDPDeviceMetricsCollector *v15;
  PSGDPDeviceMetricsCollector *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSGDPDeviceMetricsCollector;
  v15 = -[PSGDPDeviceMetricsCollector init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xpcActivityManager, a3);
    objc_storeStrong((id *)&v16->_idsService, a4);
    objc_storeStrong((id *)&v16->_store, a6);
    objc_storeStrong((id *)&v16->_queue, a5);
    -[IDSService addDelegate:queue:](v16->_idsService, "addDelegate:queue:", v16, v16->_queue);
  }

  return v16;
}

- (BOOL)collectDeviceQREngagement:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  SGQuickResponsesStore *store;
  NSObject *v20;
  _QWORD v22[4];
  id v23;
  PSGDPDeviceMetricsCollector *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  psg_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F6A5000, v5, OS_LOG_TYPE_DEFAULT, "Begin syncing QR engagement data", buf, 2u);
  }

  v6 = -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4);
  psg_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v7, OS_LOG_TYPE_DEFAULT, "Begin fetching device experiment information", buf, 2u);
    }

    +[PSGDPDeviceMetricsCollector getActiveTrialInformationWithWithXPCActivityManager:activity:](PSGDPDeviceMetricsCollector, "getActiveTrialInformationWithWithXPCActivityManager:activity:", self->_xpcActivityManager, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (!objc_msgSend(v10, "count"))
      {
        psg_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F6A5000, v15, OS_LOG_TYPE_DEFAULT, "Early returning on engagement data sync since no Trial information associated with device", buf, 2u);
        }

        v9 = 1;
        goto LABEL_28;
      }
      v12 = -[SGXPCActivityManagerProtocol shouldDefer:](self->_xpcActivityManager, "shouldDefer:", v4);
      psg_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEFAULT, "Begin retrieving and recording delta records from DB", buf, 2u);
        }

        +[PSGDPDeviceMetricsCollector recorderForKey:](PSGDPDeviceMetricsCollector, "recorderForKey:", CFSTR("com.apple.proactive.messages.ZKWSelected"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSGDPDeviceMetricsCollector recorderForKey:](PSGDPDeviceMetricsCollector, "recorderForKey:", CFSTR("com.apple.proactive.messages.ZKWIgnored"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
        {
          store = self->_store;
          +[PSGDPDeviceMetricsCollector onDeltaRowWithXPCActivityManager:activity:engagementMetrics:](PSGDPDeviceMetricsCollector, "onDeltaRowWithXPCActivityManager:activity:engagementMetrics:", self->_xpcActivityManager, v4, v11);
          v20 = objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __57__PSGDPDeviceMetricsCollector_collectDeviceQREngagement___block_invoke;
          v22[3] = &unk_24FCB47D8;
          v23 = v11;
          v24 = self;
          v25 = v4;
          v26 = v16;
          v27 = v18;
          v9 = -[SGQuickResponsesStore deltaForResponsesOnRow:completion:](store, "deltaForResponsesOnRow:completion:", v20, v22);

        }
        else
        {
          psg_default_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138413058;
            v29 = CFSTR("com.apple.proactive.messages.ZKWSelected");
            v30 = 1024;
            v31 = v16 == 0;
            v32 = 2112;
            v33 = CFSTR("com.apple.proactive.messages.ZKWIgnored");
            v34 = 1024;
            v35 = v18 == 0;
            _os_log_fault_impl(&dword_22F6A5000, v20, OS_LOG_TYPE_FAULT, "Bailing out because unable to create recorder for some key(s), %@: %d, %@: %d", buf, 0x22u);
          }
          v9 = 0;
        }

        goto LABEL_28;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing after successful experiment id retrieval", buf, 2u);
      }

    }
    -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3);
    v9 = 0;
LABEL_28:

    goto LABEL_29;
  }
  if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F6A5000, v7, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during eager initial check", buf, 2u);
  }

  -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", v4, 3);
  v9 = 0;
LABEL_29:

  return v9;
}

- (BOOL)syncQREngagementToPairedDeviceWithActivity:(id)a3
{
  -[SGXPCActivityManagerProtocol setState:state:](self->_xpcActivityManager, "setState:state:", a3, 5);
  return 1;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  psg_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = v13;
    v16 = 2112;
    v17 = v11;
    v18 = 2048;
    v19 = objc_msgSend(v10, "length");
    _os_log_impl(&dword_22F6A5000, v12, OS_LOG_TYPE_DEFAULT, "Received file for service %@, identifier: %@; size: %tu",
      (uint8_t *)&v14,
      0x20u);

  }
  +[PSGDPDeviceMetricsCollector sendEngagementToDPUsingData:](PSGDPDeviceMetricsCollector, "sendEngagementToDPUsingData:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
}

uint64_t __57__PSGDPDeviceMetricsCollector_collectDeviceQREngagement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v23;
    v5 = 0x24FCB4000uLL;
    v19 = *(_QWORD *)v23;
    while (2)
    {
      v6 = 0;
      v20 = v3;
      do
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v6);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "shouldDefer:", *(_QWORD *)(a1 + 48)))
        {
          psg_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F6A5000, v17, OS_LOG_TYPE_DEFAULT, "Deferring engagement data recording in the middle of recording", buf, 2u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setState:state:", *(_QWORD *)(a1 + 48), 3);
          return 0;
        }
        v8 = objc_msgSend(*(id *)(v5 + 384), "recordEngagementMetrics:selectedRecorder:ignoredRecorder:", v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
        psg_default_log_handle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "lang");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "rolloutId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "factorPackId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "experimentId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "treatmentId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "engagementDeltas");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 138413826;
          v27 = v10;
          v28 = 2112;
          v29 = v11;
          v30 = 2112;
          v31 = v12;
          v32 = 2112;
          v33 = v13;
          v34 = 2112;
          v35 = v14;
          v36 = 2048;
          v37 = v16;
          v38 = 1024;
          v39 = v8;
          _os_log_impl(&dword_22F6A5000, v9, OS_LOG_TYPE_DEFAULT, "Recorded engagement metrics running in language %@, rollout %@, factor pack %@, experiment %@, treatment %@, records %tu, success %d", buf, 0x44u);

          v4 = v19;
          v3 = v20;

          v5 = 0x24FCB4000;
        }

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v40, 16);
      if (v3)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setState:state:", *(_QWORD *)(a1 + 48), 5);
  return 0;
}

+ (id)getPrefixFromRolloutID:(id)a3 factorPackId:(id)a4 experimentId:(id)a5 treatmentId:(id)a6
{
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  _BOOL4 v19;
  __CFString *v20;
  __CFString *v21;
  BOOL v22;
  void *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = (__CFString *)a5;
  v12 = (__CFString *)a6;
  v13 = &stru_24FCB4FF8;
  if (v10)
    v14 = v10;
  else
    v14 = &stru_24FCB4FF8;
  v15 = v14;
  if (v11)
    v16 = v11;
  else
    v16 = &stru_24FCB4FF8;
  v17 = v16;
  if (v12)
    v18 = v12;
  else
    v18 = &stru_24FCB4FF8;
  if (v12)
    v19 = v11 != 0;
  else
    v19 = 0;
  v20 = v18;
  v21 = v20;
  if (v10)
    v22 = v9 == 0;
  else
    v22 = 1;
  if (!v22 || v19)
  {
    if (v19)
    {
      v25[0] = v17;
      v25[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_pas_componentsJoinedByString:", CFSTR("|"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v15;
    }
  }

  return v13;
}

+ (BOOL)recordResponse:(id)a3 numTimesToLog:(unint64_t)a4 recorder:(id)a5 prefix:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  void *v27;
  int v28;
  NSObject *v29;
  BOOL v30;
  int v32;
  unint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v9, "length"))
  {
    if (!a4)
    {
      v30 = 1;
      goto LABEL_35;
    }
    v34[0] = v11;
    v34[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR("|"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    psg_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 134217984;
      v33 = a4;
      _os_log_impl(&dword_22F6A5000, v14, OS_LOG_TYPE_DEFAULT, "Preparing to log message %tu times", (uint8_t *)&v32, 0xCu);
    }

    v15 = objc_msgSend(v13, "length");
    v16 = 0x800 / v15;
    if (v15 > 0x800)
      v16 = 1;
    if (v16 >= a4)
      v17 = a4;
    else
      v17 = v16;
    v18 = a4 / v17;
    v19 = a4 / v17 * v17;
    v20 = a4 % v17;
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v17);
    v22 = v21;
    while (-[NSObject count](v21, "count") < v17)
    {
      -[NSObject addObject:](v22, "addObject:", v13);
      v21 = v22;
    }
    v23 = 0;
    v24 = 0;
    do
    {
      v25 = objc_msgSend(v10, "record:", v22);
      v24 += v25;
      v23 += v25 ^ 1;
    }
    while (v24 < v18 && v23 < 3);
    if (a4 != v19 && v23 <= 2)
    {
      -[NSObject subarrayWithRange:](v22, "subarrayWithRange:", 0, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      do
      {
        v28 = objc_msgSend(v10, "record:", v27);
        v23 += v28 ^ 1u;
      }
      while ((v28 & 1) == 0 && v23 < 3);

    }
    if (v23)
    {
      psg_default_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v32 = 134217984;
        v33 = v23;
        _os_log_error_impl(&dword_22F6A5000, v29, OS_LOG_TYPE_ERROR, "Call to recorder failed %tu times", (uint8_t *)&v32, 0xCu);
      }

    }
    v30 = v23 < 3;
  }
  else
  {
    psg_default_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl(&dword_22F6A5000, v22, OS_LOG_TYPE_ERROR, "Logging of empty response is not allowed", (uint8_t *)&v32, 2u);
    }
    v30 = 0;
    v13 = v9;
  }

  v9 = v13;
LABEL_35:

  return v30;
}

+ (BOOL)recordEngagementMetrics:(id)a3 selectedRecorder:(id)a4 ignoredRecorder:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  void *v18;
  void *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v27;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  _BYTE v36[10];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v29 = a4;
  v28 = a5;
  objc_msgSend(v7, "rolloutId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "factorPackId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "experimentId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "treatmentId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSGDPDeviceMetricsCollector getPrefixFromRolloutID:factorPackId:experimentId:treatmentId:](PSGDPDeviceMetricsCollector, "getPrefixFromRolloutID:factorPackId:experimentId:treatmentId:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = v7;
  objc_msgSend(v7, "engagementDeltas");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    v16 = 1;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "response");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          psg_default_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F6A5000, v25, OS_LOG_TYPE_INFO, "Skipping DP logging for empty response.", buf, 2u);
          }
          goto LABEL_16;
        }
        v20 = objc_msgSend(v18, "selected");
        v21 = objc_msgSend(v18, "displayed");
        v22 = v21 - objc_msgSend(v18, "selected");
        if ((v20 & 0x80000000) != 0 || (v22 & 0x80000000) != 0)
        {
          psg_default_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v36 = v20;
            *(_WORD *)&v36[4] = 1024;
            *(_DWORD *)&v36[6] = v22;
            _os_log_error_impl(&dword_22F6A5000, v25, OS_LOG_TYPE_ERROR, "Skipping DP logging for response because invalid count for selected %d or ignored %d", buf, 0xEu);
          }
LABEL_16:

          goto LABEL_17;
        }
        psg_default_log_handle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v36 = v20;
          *(_WORD *)&v36[8] = 2048;
          v37 = v22;
          _os_log_impl(&dword_22F6A5000, v23, OS_LOG_TYPE_DEFAULT, "Logging message selected %tu, ignored %tu", buf, 0x16u);
        }

        v24 = +[PSGDPDeviceMetricsCollector recordResponse:numTimesToLog:recorder:prefix:](PSGDPDeviceMetricsCollector, "recordResponse:numTimesToLog:recorder:prefix:", v19, v20, v29, v12);
        v16 &= +[PSGDPDeviceMetricsCollector recordResponse:numTimesToLog:recorder:prefix:](PSGDPDeviceMetricsCollector, "recordResponse:numTimesToLog:recorder:prefix:", v19, v22, v28, v12)&& v24;
LABEL_17:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (!v14)
        goto LABEL_21;
    }
  }
  LOBYTE(v16) = 1;
LABEL_21:

  return v16 & 1;
}

+ (id)getActiveTrialInformationWithWithXPCActivityManager:(id)a3 activity:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PSGQuickResponsesEngagementMetrics *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v26;
  id obj;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  PSGQuickResponsesEngagementMetrics *v34;
  void *v35;
  void *v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v32 = a4;
  v26 = MEMORY[0x2348A15A8]();
  v28 = (void *)objc_opt_new();
  +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "zkwLangAndNamespaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = v6;
  v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  v8 = 0;
  if (v30)
  {
    v29 = *(_QWORD *)v39;
    obj = v7;
LABEL_3:
    v9 = 0;
    v10 = v8;
    while (1)
    {
      if (*(_QWORD *)v39 != v29)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v9);
      objc_msgSend(v31, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", v11, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v33, "shouldDefer:", v32))
      {
        psg_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v26;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F6A5000, v24, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during trial information fetching", buf, 2u);
        }

        v7 = obj;
        v22 = 0;
        v21 = v28;
        goto LABEL_17;
      }
      objc_msgSend(v8, "rolloutIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        break;
      objc_msgSend(v8, "experimentIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        goto LABEL_10;
LABEL_11:
      ++v9;
      v10 = v8;
      if (v30 == v9)
      {
        v7 = obj;
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v30)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

LABEL_10:
    v34 = [PSGQuickResponsesEngagementMetrics alloc];
    objc_msgSend(v8, "rolloutIdentifiers");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "rolloutId");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rolloutIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "factorPackId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "experimentId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "experimentIdentifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "treatmentId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PSGQuickResponsesEngagementMetrics initWithLang:rolloutId:factorPackId:experimentId:treatmentId:](v34, "initWithLang:rolloutId:factorPackId:experimentId:treatmentId:", v11, v35, v15, v17, v19);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v20, v11);

    goto LABEL_11;
  }
LABEL_13:

  v21 = v28;
  v22 = (void *)objc_msgSend(v28, "copy");
  v23 = (void *)v26;
LABEL_17:

  objc_autoreleasePoolPop(v23);
  return v22;
}

+ (id)recorderForKey:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE2CBB0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithKey:", v4);

  return v5;
}

+ (id)onDeltaRowWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[4];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SGDPDeviceMetricsCollectorErrorDomain"), 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __91__PSGDPDeviceMetricsCollector_onDeltaRowWithXPCActivityManager_activity_engagementMetrics___block_invoke;
  v17[3] = &unk_24FCB4788;
  v18 = v7;
  v19 = v8;
  v20 = v10;
  v21 = v9;
  v22 = v23;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  v14 = v7;
  v15 = (void *)MEMORY[0x2348A1710](v17);

  _Block_object_dispose(v23, 8);
  return v15;
}

+ (id)onCompletionWithXPCActivityManager:(id)a3 activity:(id)a4 engagementMetrics:(id)a5 idsService:(id)a6 destinationDevice:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SGDPDeviceMetricsCollectorErrorDomain"), 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __122__PSGDPDeviceMetricsCollector_onCompletionWithXPCActivityManager_activity_engagementMetrics_idsService_destinationDevice___block_invoke;
  v25[3] = &unk_24FCB47B0;
  v26 = v13;
  v27 = v11;
  v28 = v12;
  v29 = v16;
  v30 = v15;
  v31 = v14;
  v17 = v14;
  v18 = v15;
  v19 = v16;
  v20 = v12;
  v21 = v11;
  v22 = v13;
  v23 = (void *)MEMORY[0x2348A1710](v25);

  return v23;
}

+ (BOOL)sendEngagementToDPUsingData:(id)a3
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v56;
  objc_class *v57;
  __CFString *v58;
  NSObject *v59;
  objc_class *v60;
  NSObject *v61;
  __CFString *v62;
  objc_class *v63;
  __CFString *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *obj;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  uint8_t buf[4];
  const __CFString *v86;
  __int16 v87;
  _BYTE v88[20];
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  _BOOL4 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  psg_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F6A5000, v3, OS_LOG_TYPE_DEFAULT, "Begin sending QR engagement data to DP", buf, 2u);
  }

  v4 = (void *)MEMORY[0x2348A15A8]();
  v5 = objc_alloc(MEMORY[0x24BDBCF20]);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v4);
  psg_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEFAULT, "Begin payload deserialization", buf, 2u);
  }

  v84 = 0;
  v14 = v75;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v75, &v84);
  v16 = (__CFString *)v84;
  objc_msgSend(v15, "setRequiresSecureCoding:", 1);
  v17 = objc_msgSend(v15, "setClass:forClassName:", objc_opt_class(), CFSTR("SGQuickResponsesEngagementMetrics"));
  v18 = (void *)MEMORY[0x2348A15A8](v17);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v15, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v19, v12, *MEMORY[0x24BDD0E88]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    psg_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v86 = v16;
      _os_log_fault_impl(&dword_22F6A5000, v21, OS_LOG_TYPE_FAULT, "Unable to deserialize engagement data: %@", buf, 0xCu);
    }
    v22 = 0;
    goto LABEL_65;
  }
  psg_default_log_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v21 = v23;
  if (v20)
  {
    v73 = v20;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v21, OS_LOG_TYPE_DEFAULT, "Successfully deserialized payload", buf, 2u);
    }

    psg_default_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v24, OS_LOG_TYPE_DEFAULT, "Begin payload content validation", buf, 2u);
    }

    objc_msgSend(v73, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_75);
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("compatVer"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      psg_default_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v25, OS_LOG_TYPE_DEFAULT, "Compatability version is not in payload. Assuming payload is legacy and inferring version to be 0", buf, 2u);
      }

      v21 = &unk_24FCBB9A8;
    }
    psg_default_log_handle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v86 = (const __CFString *)v21;
      v87 = 1024;
      *(_DWORD *)v88 = 2;
      _os_log_impl(&dword_22F6A5000, v26, OS_LOG_TYPE_DEFAULT, "Received compatability version %@ with local compatability version %d", buf, 0x12u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      psg_default_log_handle();
      v51 = objc_claimAutoreleasedReturnValue();
      v20 = v73;
      v67 = v51;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        v57 = (objc_class *)objc_opt_class();
        NSStringFromClass(v57);
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v58;
        _os_log_fault_impl(&dword_22F6A5000, v51, OS_LOG_TYPE_FAULT, "Deserialized compatability version was of class %@, something went wrong", buf, 0xCu);

        v20 = v73;
      }
      v22 = 0;
      goto LABEL_64;
    }
    v20 = v73;
    if (-[NSObject intValue](v21, "intValue") != 2)
    {
      psg_default_log_handle();
      v52 = objc_claimAutoreleasedReturnValue();
      v67 = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v52, OS_LOG_TYPE_DEFAULT, "Compatability versions do not match, proceeding to early return", buf, 2u);
      }
      v22 = 1;
      goto LABEL_64;
    }
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("responses"));
    v27 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v27)
      {
        if (-[NSObject count](v27, "count"))
        {
          v66 = v21;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v28 = v27;
          v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
          v67 = v28;
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v81;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v81 != v31)
                  objc_enumerationMutation(v28);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  psg_default_log_handle();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                  {
                    v63 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v63);
                    v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v86 = v64;
                    _os_log_fault_impl(&dword_22F6A5000, v56, OS_LOG_TYPE_FAULT, "Deserialized engagementMetrics elements was of class %@, something went wrong", buf, 0xCu);

                  }
                  v22 = 0;
                  v16 = 0;
                  goto LABEL_77;
                }
              }
              v30 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
              if (v30)
                continue;
              break;
            }
          }

          psg_default_log_handle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22F6A5000, v33, OS_LOG_TYPE_DEFAULT, "Successfully validated payload content", buf, 2u);
          }

          +[PSGDPDeviceMetricsCollector recorderForKey:](PSGDPDeviceMetricsCollector, "recorderForKey:", CFSTR("com.apple.proactive.messages.SmartReplySelected"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSGDPDeviceMetricsCollector recorderForKey:](PSGDPDeviceMetricsCollector, "recorderForKey:", CFSTR("com.apple.proactive.messages.SmartReplyIgnored"));
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          v16 = 0;
          if (v34 && v35)
          {
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            obj = v28;
            v37 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
            if (v37)
            {
              v38 = v37;
              v65 = v12;
              v39 = *(_QWORD *)v77;
              v22 = 1;
              v70 = v34;
              v71 = v15;
              v68 = *(_QWORD *)v77;
              v69 = v36;
              do
              {
                v40 = 0;
                v72 = v38;
                do
                {
                  if (*(_QWORD *)v77 != v39)
                    objc_enumerationMutation(obj);
                  v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v40);
                  v42 = +[PSGDPDeviceMetricsCollector recordEngagementMetrics:selectedRecorder:ignoredRecorder:](PSGDPDeviceMetricsCollector, "recordEngagementMetrics:selectedRecorder:ignoredRecorder:", v41, v34, v36);
                  psg_default_log_handle();
                  v43 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v41, "lang");
                    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "rolloutId");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "factorPackId");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "experimentId");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "treatmentId");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "engagementDeltas");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v49, "count");
                    *(_DWORD *)buf = 138413826;
                    v86 = v44;
                    v87 = 2112;
                    *(_QWORD *)v88 = v45;
                    *(_WORD *)&v88[8] = 2112;
                    *(_QWORD *)&v88[10] = v46;
                    *(_WORD *)&v88[18] = 2112;
                    v89 = v47;
                    v90 = 2112;
                    v91 = v48;
                    v92 = 2048;
                    v93 = v50;
                    v94 = 1024;
                    v95 = v42;
                    _os_log_impl(&dword_22F6A5000, v43, OS_LOG_TYPE_DEFAULT, "Recorded engagement metrics running in language %@, rollout %@, factor pack %@, experiment %@, treatment %@, records %tu, success %d", buf, 0x44u);

                    v38 = v72;
                    v36 = v69;

                    v34 = v70;
                    v15 = v71;

                    v39 = v68;
                  }

                  v22 &= v42;
                  ++v40;
                }
                while (v38 != v40);
                v38 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
              }
              while (v38);
              v14 = v75;
              v12 = v65;
              v16 = 0;
            }
            else
            {
              v22 = 1;
            }
          }
          else
          {
            psg_default_log_handle();
            obj = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138413058;
              v86 = CFSTR("com.apple.proactive.messages.SmartReplySelected");
              v87 = 1024;
              *(_DWORD *)v88 = v34 == 0;
              *(_WORD *)&v88[4] = 2112;
              *(_QWORD *)&v88[6] = CFSTR("com.apple.proactive.messages.SmartReplyIgnored");
              *(_WORD *)&v88[14] = 1024;
              *(_DWORD *)&v88[16] = v36 == 0;
              _os_log_fault_impl(&dword_22F6A5000, obj, OS_LOG_TYPE_FAULT, "Bailing out because unable to create recorder for some key(s), %@: %d, %@: %d", buf, 0x22u);
            }
            v22 = 0;
          }

LABEL_77:
          v20 = v73;
          v21 = v66;
          goto LABEL_64;
        }
        v67 = v27;
        psg_default_log_handle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F6A5000, v59, OS_LOG_TYPE_DEFAULT, "Received empty engagement rate data to process", buf, 2u);
        }

        v22 = 1;
        goto LABEL_63;
      }
      psg_default_log_handle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F6A5000, v54, OS_LOG_TYPE_ERROR, "Deserialized engagementMetrics was nil, something went wrong", buf, 2u);
      }

      v67 = 0;
    }
    else
    {
      psg_default_log_handle();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        v60 = (objc_class *)objc_opt_class();
        NSStringFromClass(v60);
        v61 = v21;
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v86 = v62;
        _os_log_fault_impl(&dword_22F6A5000, v53, OS_LOG_TYPE_FAULT, "Deserialized engagementMetrics was of class %@, something went wrong", buf, 0xCu);

        v21 = v61;
      }
      v67 = v27;

    }
    v22 = 0;
LABEL_63:
    v20 = v73;
LABEL_64:

    goto LABEL_65;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_22F6A5000, v21, OS_LOG_TYPE_FAULT, "Received empty payload", buf, 2u);
  }
  v22 = 1;
LABEL_65:

  return v22;
}

void __59__PSGDPDeviceMetricsCollector_sendEngagementToDPUsingData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  psg_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "Payload key %@ is of class %@", (uint8_t *)&v9, 0x16u);

  }
}

__CFString *__122__PSGDPDeviceMetricsCollector_onCompletionWithXPCActivityManager_activity_engagementMetrics_idsService_destinationDevice___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  __CFString *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  char v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  __CFString *v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "engagementDeltas");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (v11)
          {
            objc_msgSend(v2, "addObject:", v9);
            objc_msgSend(v9, "engagementDeltas");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = (const __CFString *)((char *)v6 + objc_msgSend(v12, "count"));

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v51, v69, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

    psg_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v56 = v6;
      _os_log_impl(&dword_22F6A5000, v15, OS_LOG_TYPE_DEFAULT, "Begin syncing for %tu records", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "shouldDefer:", *(_QWORD *)(a1 + 48)))
    {
      psg_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v16, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during initial completion block check", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 3);
      v17 = (__CFString *)*(id *)(a1 + 56);
      goto LABEL_61;
    }
    if (!v6)
    {
      psg_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F6A5000, v23, OS_LOG_TYPE_DEFAULT, "Completed engagement data syncing with no updates, no records to sync", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 5);
      v17 = 0;
      goto LABEL_61;
    }
    v67[0] = CFSTR("responses");
    v67[1] = CFSTR("compatVer");
    v68[0] = v2;
    v68[1] = &unk_24FCBB990;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    psg_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v19, OS_LOG_TYPE_DEFAULT, "Begin records serialization", buf, 2u);
    }

    v50 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v50);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (__CFString *)v50;
    if (v21)
    {
      v17 = v21;
      psg_default_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v17;
        _os_log_error_impl(&dword_22F6A5000, v22, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing because of serialization error: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 3);
      goto LABEL_60;
    }
    v24 = objc_msgSend(*(id *)(a1 + 40), "shouldDefer:", *(_QWORD *)(a1 + 48));
    psg_default_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F6A5000, v26, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing after data serialization", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 3);
      v17 = (__CFString *)*(id *)(a1 + 56);
      goto LABEL_60;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v20, "length");
      *(_DWORD *)buf = 134217984;
      v56 = (const __CFString *)v27;
      _os_log_impl(&dword_22F6A5000, v26, OS_LOG_TYPE_DEFAULT, "Serialized records with data size of %tu", buf, 0xCu);
    }

    v28 = (void *)MEMORY[0x2348A15A8]();
    v29 = objc_alloc(MEMORY[0x24BDBCF20]);
    v30 = (void *)IDSCopyIDForDevice();
    v31 = (void *)objc_msgSend(v29, "initWithObjects:", v30, 0);

    objc_autoreleasePoolPop(v28);
    psg_default_log_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22F6A5000, v32, OS_LOG_TYPE_DEFAULT, "Begin IDS sync request", buf, 2u);
    }

    v33 = *(void **)(a1 + 72);
    v34 = *MEMORY[0x24BE4FB48];
    v65[0] = *MEMORY[0x24BE4FAA0];
    v65[1] = v34;
    v66[0] = MEMORY[0x24BDBD1C8];
    v66[1] = MEMORY[0x24BDBD1C8];
    v65[2] = *MEMORY[0x24BE4FAC0];
    v66[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = 0;
    v36 = objc_msgSend(v33, "sendData:toDestinations:priority:options:identifier:error:", v20, v31, 100, v35, &v49, &v48);
    v37 = v49;
    v38 = (__CFString *)v48;

    v39 = objc_msgSend(*(id *)(a1 + 40), "shouldDefer:", *(_QWORD *)(a1 + 48));
    psg_default_log_handle();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_22F6A5000, v41, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing after IDS sync call", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 3);
      v42 = (__CFString *)*(id *)(a1 + 56);
    }
    else
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v36);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v20, "length");
        *(_DWORD *)buf = 138413314;
        v56 = CFSTR("com.apple.private.alloy.suggestions.smartreplies");
        v57 = 2112;
        v58 = v43;
        v59 = 2112;
        v60 = v37;
        v61 = 2048;
        v62 = v44;
        v63 = 2112;
        v64 = v38;
        _os_log_impl(&dword_22F6A5000, v41, OS_LOG_TYPE_DEFAULT, "Performed IDS request for service %@, success %@, identifier %@, data size: %tu, error %@", buf, 0x34u);

      }
      if (v38)
        v45 = 0;
      else
        v45 = v36;
      if ((v45 & 1) != 0)
      {
        psg_default_log_handle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22F6A5000, v46, OS_LOG_TYPE_DEFAULT, "Successfully passed data to IDS for syncing", buf, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 5);
        v38 = 0;
        v17 = 0;
        goto LABEL_59;
      }
      if (!v38)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SGDPDeviceMetricsCollectorErrorDomain"), 1, 0);
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      psg_default_log_handle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v38;
        _os_log_error_impl(&dword_22F6A5000, v47, OS_LOG_TYPE_ERROR, "Deferring engagement data syncing because IDS failure: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 3);
      v42 = v38;
      v38 = v42;
    }
    v17 = v42;
LABEL_59:

LABEL_60:
LABEL_61:

    return v17;
  }
  psg_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F6A5000, v13, OS_LOG_TYPE_DEFAULT, "Completed engagement data syncing with no updates, no Trial information for device", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setState:state:", *(_QWORD *)(a1 + 48), 5);
  return (__CFString *)0;
}

uint64_t __91__PSGDPDeviceMetricsCollector_onDeltaRowWithXPCActivityManager_activity_engagementMetrics___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  unsigned __int8 *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v24;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  psg_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_22F6A5000, v6, OS_LOG_TYPE_DEFAULT, "Begin validation for record", (uint8_t *)&v25, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer:", *(_QWORD *)(a1 + 40)))
  {
    psg_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    LOWORD(v25) = 0;
    goto LABEL_6;
  }
  v9 = *(void **)(a1 + 56);
  objc_msgSend(v5, "lang");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    psg_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "lang");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      *(_QWORD *)v26 = v24;
      _os_log_error_impl(&dword_22F6A5000, v19, OS_LOG_TYPE_ERROR, "Error for record due to us recording an unknown language code %@", (uint8_t *)&v25, 0xCu);

    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v5, "displayed") & 0x80000000) != 0 || (objc_msgSend(v5, "selected") & 0x80000000) != 0)
  {
    psg_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend(v5, "displayed");
      v21 = objc_msgSend(v5, "selected");
      v25 = 67109376;
      v26[0] = v20;
      LOWORD(v26[1]) = 1024;
      *(_DWORD *)((char *)&v26[1] + 2) = v21;
      _os_log_error_impl(&dword_22F6A5000, v19, OS_LOG_TYPE_ERROR, "Error for record due to negative value for displayed %d or selected %d", (uint8_t *)&v25, 0xEu);
    }
    goto LABEL_25;
  }
  if (!objc_msgSend(v5, "displayed") && !objc_msgSend(v5, "selected"))
  {
    psg_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_22F6A5000, v19, OS_LOG_TYPE_DEFAULT, "Skipping record since no delta in displayed or selected", (uint8_t *)&v25, 2u);
    }
LABEL_25:

    goto LABEL_26;
  }
  psg_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_22F6A5000, v12, OS_LOG_TYPE_DEFAULT, "Validated record to sync", (uint8_t *)&v25, 2u);
  }

  v13 = *(void **)(a1 + 56);
  objc_msgSend(v5, "lang");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "engagementDeltas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v5);

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= 0xD06uLL)
  {
    psg_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v25 = 134217984;
      *(_QWORD *)v26 = v18;
      _os_log_impl(&dword_22F6A5000, v17, OS_LOG_TYPE_DEFAULT, "Truncating number of responses to fetch since it's greater than %tu", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_9;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldDefer:", *(_QWORD *)(a1 + 40)))
  {
LABEL_26:
    v8 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
    goto LABEL_27;
  }
  psg_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
LABEL_6:
    _os_log_impl(&dword_22F6A5000, v7, OS_LOG_TYPE_DEFAULT, "Deferring engagement data syncing during delta row iteration", (uint8_t *)&v25, 2u);
  }
LABEL_7:

  objc_msgSend(*(id *)(a1 + 32), "setState:state:", *(_QWORD *)(a1 + 40), 3);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(a1 + 48));
LABEL_9:
  v8 = (unsigned __int8 *)MEMORY[0x24BE7A6B0];
LABEL_27:
  v22 = *v8;

  return v22;
}

@end
