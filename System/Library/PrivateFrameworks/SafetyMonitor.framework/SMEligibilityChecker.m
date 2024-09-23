@implementation SMEligibilityChecker

- (SMEligibilityChecker)initWithQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SMEligibilityChecker *v9;

  v4 = (void *)MEMORY[0x24BE4FC40];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.safetymonitor"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.safetymonitor.multiplex"));
  v9 = -[SMEligibilityChecker initWithQueue:IDSIDQueryController:iMessageIDSService:iCloudIDSService:](self, "initWithQueue:IDSIDQueryController:iMessageIDSService:iCloudIDSService:", v5, v6, v7, v8);

  return v9;
}

- (SMEligibilityChecker)initWithQueue:(id)a3 IDSIDQueryController:(id)a4 iMessageIDSService:(id)a5 iCloudIDSService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SMEligibilityChecker *v15;
  id *p_isa;
  SMEligibilityChecker *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SMEligibilityChecker;
  v15 = -[SMEligibilityChecker init](&v19, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (!v15)
    goto LABEL_5;
  v17 = 0;
  if (v12 && v13)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_msgSend(p_isa, "addDelegateForService:", CFSTR("com.apple.private.alloy.safetymonitor"));
    objc_msgSend(p_isa, "addDelegateForService:", CFSTR("com.apple.private.alloy.safetymonitor.multiplex"));
LABEL_5:
    v17 = p_isa;
  }

  return v17;
}

- (void)addDelegateForService:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SMEligibilityChecker idsIDQueryController](self, "idsIDQueryController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SMEligibilityChecker queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDelegate:forService:listenerID:queue:", self, v4, CFSTR("__kSMServiceForEligibilityCheckListenerID"), v5);

}

+ (id)convertToPushTokenMap:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a3)
    return MEMORY[0x24BDBD1B8];
  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SMEligibilityChecker_convertToPushTokenMap___block_invoke;
  v9[3] = &unk_25166D750;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __46__SMEligibilityChecker_convertToPushTokenMap___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "pushToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)checkReceiverEligibility:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  _QWORD block[5];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  __int128 *v40;
  _QWORD *v41;
  uint64_t *v42;
  SEL v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[4];
  _QWORD v50[5];
  id v51;
  _QWORD v52[4];
  id v53;
  NSObject *v54;
  _QWORD *v55;
  __int128 *p_buf;
  _QWORD v57[4];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  os_signpost_id_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "primaryHandle"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    v61 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v59[3];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMCheckReceiverEligibility", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(v6, "primaryHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SMEligibilityChecker checkRecipientAccountIsUnique:](self, "checkRecipientAccountIsUnique:", v14);

    if (v15)
    {
      v16 = dispatch_group_create();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v66 = 0x3032000000;
      v67 = __Block_byref_object_copy_;
      v68 = __Block_byref_object_dispose_;
      v69 = (id)MEMORY[0x24BDBD1B8];
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x2020000000;
      v57[3] = 0;
      dispatch_group_enter(v16);
      objc_msgSend(v6, "primaryHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = *MEMORY[0x24BE4FDE0];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke;
      v52[3] = &unk_25166D778;
      v21 = v6;
      v53 = v21;
      v55 = v57;
      p_buf = &buf;
      v22 = v16;
      v54 = v22;
      -[SMEligibilityChecker resolveEndpointsForDestinations:service:requiredCapabilities:completionBlock:](self, "resolveEndpointsForDestinations:service:requiredCapabilities:completionBlock:", v18, CFSTR("com.apple.private.alloy.safetymonitor"), v19, v52);

      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy_;
      v50[4] = __Block_byref_object_dispose_;
      v51 = (id)MEMORY[0x24BDBD1B8];
      v49[0] = 0;
      v49[1] = v49;
      v49[2] = 0x2020000000;
      v49[3] = 0;
      dispatch_group_enter(v22);
      objc_msgSend(v21, "primaryHandle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v23;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v62, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v20;
      v44[1] = 3221225472;
      v44[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_17;
      v44[3] = &unk_25166D778;
      v25 = v21;
      v45 = v25;
      v47 = v49;
      v48 = v50;
      v26 = v22;
      v46 = v26;
      -[SMEligibilityChecker resolveEndpointsForDestinations:service:requiredCapabilities:completionBlock:](self, "resolveEndpointsForDestinations:service:requiredCapabilities:completionBlock:", v24, CFSTR("com.apple.private.alloy.safetymonitor.multiplex"), MEMORY[0x24BDBD1A8], v44);

      -[SMEligibilityChecker queue](self, "queue");
      v27 = objc_claimAutoreleasedReturnValue();
      block[0] = v20;
      block[1] = 3221225472;
      block[2] = __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_18;
      block[3] = &unk_25166D7A0;
      block[4] = self;
      v38 = v57;
      v39 = v49;
      v40 = &buf;
      v41 = v50;
      v43 = a2;
      v36 = v25;
      v42 = &v58;
      v37 = v7;
      dispatch_group_notify(v26, v27, block);

      _Block_object_dispose(v49, 8);
      _Block_object_dispose(v50, 8);

      _Block_object_dispose(v57, 8);
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      v70 = *MEMORY[0x24BDD0FC8];
      v71 = CFSTR("Receiver handle overlaps with initiator iMessage or iCloud account");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 1, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = v59[3];
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LODWORD(buf) = 134349056;
        *(_QWORD *)((char *)&buf + 4) = 2;
        _os_signpost_emit_with_name_impl(&dword_245521000, v32, OS_SIGNPOST_INTERVAL_END, v33, "SMCheckReceiverEligibility", " enableTelemetry=YES {receiverEligibility:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, uint64_t, _QWORD, void *))v7 + 2))(v7, 2, MEMORY[0x24BDBD1A8], v30);
    }

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    v72 = *MEMORY[0x24BDD0FC8];
    v73[0] = CFSTR("No handles in the query");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, void *))v7 + 2))(v7, 2, MEMORY[0x24BDBD1A8], v29);

  }
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 32), "primaryHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = v8;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "Got %lu zelkova endpoints for %@, error, %@", buf, 0x20u);

  }
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE4FA30]);

    if (v12)
    {
      v13 = objc_msgSend(v6, "code");
      v14 = 6;
      if (v13 != 5)
        v14 = 7;
      if (v13 == 3)
        v14 = 3;
      goto LABEL_12;
    }
  }
  if (!objc_msgSend(v5, "count"))
  {
    v14 = 4;
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;
  }
  +[SMEligibilityChecker convertToPushTokenMap:](SMEligibilityChecker, "convertToPushTokenMap:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 32), "primaryHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v20 = v8;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "Got %lu nice endpoints for %@, error, %@", buf, 0x20u);

  }
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE4FA30]);

    if (v12)
    {
      v13 = objc_msgSend(v6, "code");
      v14 = 6;
      if (v13 != 5)
        v14 = 7;
      if (v13 == 3)
        v14 = 5;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v14;
    }
  }
  +[SMEligibilityChecker convertToPushTokenMap:](SMEligibilityChecker, "convertToPushTokenMap:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__SMEligibilityChecker_checkReceiverEligibility_handler___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "reportedEligibilityWithiMessageEligibility:iCloudEligibility:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v9, "intersectSet:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v15), (_QWORD)v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
    }
    while (v13);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 40);
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 138413826;
    v35 = (uint64_t)v26;
    v36 = 2112;
    v37 = v27;
    v38 = 2048;
    v39 = v28;
    v40 = 2048;
    v41 = v29;
    v42 = 2112;
    v43 = v5;
    v44 = 2112;
    v45 = v8;
    v46 = 2112;
    v47 = v11;
    _os_log_debug_impl(&dword_245521000, v17, OS_LOG_TYPE_DEBUG, "%@, handle, %@, iMessageEligibilityError, %ld, iCloudEligibilityError, %ld, pushTokenSetForZelkova, %@, pushTokenSetForNice, %@, pushTokenSetIntersection, %@", buf, 0x48u);

  }
  if (!v2)
  {
    if (objc_msgSend(v10, "count"))
      v2 = 1;
    else
      v2 = 2;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 134349056;
    v35 = v2;
    _os_signpost_emit_with_name_impl(&dword_245521000, v19, OS_SIGNPOST_INTERVAL_END, v20, "SMCheckReceiverEligibility", " enableTelemetry=YES {receiverEligibility:%{public,signpost.telemetry:number1}ld}", buf, 0xCu);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 96));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    v35 = (uint64_t)v22;
    v36 = 2112;
    v37 = v23;
    v38 = 2048;
    v39 = v2;
    _os_log_impl(&dword_245521000, v21, OS_LOG_TYPE_INFO, "%@, handle, %@, eligibility, %ld", buf, 0x20u);

  }
  v24 = *(_QWORD *)(a1 + 48);
  v25 = (void *)objc_msgSend(v10, "copy");
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v24 + 16))(v24, v2, v25, 0);

}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD block[4];
  id v21;
  id v22;
  _BYTE *v23;
  _QWORD *v24;
  SEL v25;
  _QWORD v26[5];
  NSObject *v27;
  _BYTE *v28;
  _QWORD *v29;
  SEL v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  uint8_t v37[128];
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = a4;
  if (v5
    && (objc_msgSend(v5, "receiverHandles"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "%@, checking eligibility for %@", buf, 0x16u);

    }
    v9 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v39 = __Block_byref_object_copy_;
    v40 = __Block_byref_object_dispose_;
    v41 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy_;
    v35[4] = __Block_byref_object_dispose_;
    v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v5, "receiverHandles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setObject:forKey:", &unk_25167EE18, v14, v17);
          dispatch_group_enter(v9);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke;
          v26[3] = &unk_25166D7C8;
          v26[4] = v14;
          v28 = buf;
          v29 = v35;
          v30 = a2;
          v27 = v9;
          -[SMEligibilityChecker checkReceiverEligibility:handler:](self, "checkReceiverEligibility:handler:", v14, v26);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v11);
    }

    -[SMEligibilityChecker queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke_27;
    block[3] = &unk_25166D7F0;
    v23 = buf;
    v24 = v35;
    v25 = a2;
    v21 = v5;
    v22 = v17;
    dispatch_group_notify(v9, v15, block);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v42 = *MEMORY[0x24BDD0FC8];
    v43[0] = CFSTR("No conversation or missing conversation data in the query");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, v17);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), 7, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v17 + 2))(v17, 2, v16);

  }
}

void __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138413058;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2048;
    v17 = a2;
    v18 = 2112;
    v19 = v6;
    _os_log_debug_impl(&dword_245521000, v7, OS_LOG_TYPE_DEBUG, "%@, handle, %@, eligibility, %ld, error, %@", (uint8_t *)&v12, 0x2Au);

  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__SMEligibilityChecker_checkConversationEligibility_handler___block_invoke_27(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectForKey:", v8, (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (int)objc_msgSend(v9, "intValue");

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKey:", v8);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          v5 = v10;
          goto LABEL_15;
        }
        if (v5 == 1)
          v5 = 1;
        else
          v5 = v10;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v28, 16);
      if (v4)
        continue;
      break;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v5 = 0;
  }
LABEL_15:

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 2048;
    v25 = v5;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_INFO, "%@, conversation, %@, eligibility, %ld, error, %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)resolveEndpointsForDestinations:(id)a3 service:(id)a4 requiredCapabilities:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  SEL v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[SMEligibilityChecker idsIDQueryController](self, "idsIDQueryController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMEligibilityChecker queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke;
  v21[3] = &unk_25166D868;
  v25 = v14;
  v26 = a2;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v14;
  objc_msgSend(v15, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlockWithError:", v19, v18, CFSTR("__kSMServiceForEligibilityCheckListenerID"), v16, v21);

}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v12 = objc_msgSend(v5, "count");
      objc_msgSend(0, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v14;
      v26 = 2048;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_debug_impl(&dword_245521000, v8, OS_LOG_TYPE_DEBUG, "%@, destinations, %@, service, %@, capabilities, %@, numResults, %ld, error, %@", buf, 0x3Eu);

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_28;
    v15[3] = &unk_25166D840;
    v16 = *(id *)(a1 + 48);
    v17 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_2;
  v5[3] = &unk_25166D818;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v5);

}

void __101__SMEligibilityChecker_resolveEndpointsForDestinations_service_requiredCapabilities_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v6)
  {

LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3, (_QWORD)v11);
    goto LABEL_12;
  }
  v7 = v6;
  v8 = *(_QWORD *)v12;
  v9 = 1;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v12 != v8)
        objc_enumerationMutation(v5);
      v9 &= objc_msgSend(v4, "valueForCapability:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v7);

  if ((v9 & 1) != 0)
    goto LABEL_11;
LABEL_12:

}

+ (id)convertEligibilityTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("Valid");
  else
    return *(&off_25166D888 + a3);
}

- (int64_t)reportedEligibilityWithiMessageEligibility:(int64_t)a3 iCloudEligibility:(int64_t)a4
{
  int64_t v4;
  BOOL v5;
  int64_t v6;

  if (a3 && a4)
  {
    v4 = 7;
    v5 = a4 == 5 && a3 == 3;
    v6 = 2;
    if (!v5)
      v6 = a3;
    if (a4 == 7)
      v6 = 7;
    if (a3 != 7)
      v4 = v6;
    if (a4 == 6)
      v4 = 6;
    if (a3 == 6)
      return 6;
    else
      return v4;
  }
  else if (a3)
  {
    return a3;
  }
  else
  {
    return a4;
  }
}

- (BOOL)checkRecipientAccountIsUnique:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char v12;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[SMEligibilityChecker iMessageIDSService](self, "iMessageIDSService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aliases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  -[SMEligibilityChecker iCloudIDSService](self, "iCloudIDSService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aliases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v10);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v14;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_245521000, v11, OS_LOG_TYPE_DEBUG, "%@, checking recipient handle, recipientHandle, %@, self aliases, %@", (uint8_t *)&v15, 0x20u);

  }
  v12 = objc_msgSend(v6, "containsObject:", v5);

  return v12 ^ 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSIDQueryController)idsIDQueryController
{
  return self->_idsIDQueryController;
}

- (void)setIdsIDQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_idsIDQueryController, a3);
}

- (IDSService)iMessageIDSService
{
  return self->_iMessageIDSService;
}

- (void)setIMessageIDSService:(id)a3
{
  objc_storeStrong((id *)&self->_iMessageIDSService, a3);
}

- (IDSService)iCloudIDSService
{
  return self->_iCloudIDSService;
}

- (void)setICloudIDSService:(id)a3
{
  objc_storeStrong((id *)&self->_iCloudIDSService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudIDSService, 0);
  objc_storeStrong((id *)&self->_iMessageIDSService, 0);
  objc_storeStrong((id *)&self->_idsIDQueryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
