@implementation SMCloudKitFunction

- (SMCloudKitFunction)initWithEnvironment:(unint64_t)a3 version:(id)a4 queue:(id)a5
{
  __CFString *v8;
  id v9;
  SMCloudKitFunction *v10;
  SMCloudKitFunction *v11;
  const __CFString *v12;
  void *v13;
  _TtC13SafetyMonitor23SMCloudKitFunctionSwift *v14;
  _TtC13SafetyMonitor23SMCloudKitFunctionSwift *swiftCKF;
  SMCloudKitFunction *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[16];

  v8 = (__CFString *)a4;
  v9 = a5;
  if (v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SMCloudKitFunction;
    v10 = -[SMCloudKitFunction init](&v19, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_queue, a5);
      v12 = CFSTR("d");
      if (a3 != 1)
        v12 = 0;
      if (!a3)
        v12 = CFSTR("p");
      if (!v8)
        v8 = CFSTR("1.0");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@"), CFSTR("SafetyMonitorServer"), v12, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SMCloudKitFunctionSwift initWithServiceName:]([_TtC13SafetyMonitor23SMCloudKitFunctionSwift alloc], "initWithServiceName:", v13);
      swiftCKF = v11->_swiftCKF;
      v11->_swiftCKF = v14;

    }
    self = v11;
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)requestSafetyCacheRecordFromZone:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23[2];
  id location[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    LOWORD(location[0]) = 0;
    v18 = "Invalid parameter not satisfying: zoneName";
LABEL_10:
    _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)location, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(location[0]) = 0;
    v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_10;
  }
  objc_initWeak(location, self);
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitFunction swiftCKF](self, "swiftCKF");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke;
  v19[3] = &unk_25166DB30;
  objc_copyWeak(v23, location);
  v20 = v9;
  v16 = v14;
  v21 = v16;
  v23[1] = (id)a2;
  v22 = v12;
  objc_msgSend(v15, "requestSafetyCacheRecordFromZone:token:completion:", v20, v10, v19);

  objc_destroyWeak(v23);
  objc_destroyWeak(location);
LABEL_8:

}

void __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke_12;
    block[3] = &unk_25166DB08;
    v19 = v8;
    v20 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 64);
    v21 = v12;
    v24 = v13;
    v23 = *(id *)(a1 + 48);
    v22 = v7;
    v25 = a2;
    dispatch_async(v11, block);

    v14 = v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413570;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 1024;
      v33 = a2;
      v34 = 2112;
      v35 = v8;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_245521000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,cloud kit function released before safety cache request completed,responseCode,%d,error,%@,record,%@", buf, 0x3Au);

    }
  }

}

void __76__SMCloudKitFunction_requestSafetyCacheRecordFromZone_withToken_completion___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v48 = v10;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v12;
      v53 = 2112;
      v54 = v13;
      _os_log_error_impl(&dword_245521000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning error thrown from server: %@", buf, 0x2Au);

    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v3;
      v49 = 2112;
      v50 = v4;
      v51 = 2112;
      v52 = v5;
      _os_log_impl(&dword_245521000, v2, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning Safety Cache record", buf, 0x20u);

    }
    goto LABEL_8;
  }
  switch(*(_QWORD *)(a1 + 80))
  {
    case 1:
      v6 = objc_alloc(MEMORY[0x24BDD1540]);
      v45 = *MEMORY[0x24BDD0FC8];
      v46 = CFSTR("Unknown error");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = 1;
      goto LABEL_19;
    case 2:
      v21 = objc_alloc(MEMORY[0x24BDD1540]);
      v43 = *MEMORY[0x24BDD0FC8];
      v44 = CFSTR("Access denied");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v21;
      v9 = 2;
      goto LABEL_19;
    case 3:
      v14 = objc_alloc(MEMORY[0x24BDD1540]);
      v41 = *MEMORY[0x24BDD0FC8];
      v42 = CFSTR("Access Data record query failed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      v9 = 3;
      goto LABEL_19;
    case 4:
      v15 = objc_alloc(MEMORY[0x24BDD1540]);
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = CFSTR("Safety Cache record query failed");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      v9 = 4;
      goto LABEL_19;
    case 5:
      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v37 = *MEMORY[0x24BDD0FC8];
      v38 = CFSTR("Token missing from Access Data record");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v16;
      v9 = 5;
      goto LABEL_19;
    case 6:
      v22 = objc_alloc(MEMORY[0x24BDD1540]);
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = CFSTR("Release time missing from Access Data record");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v22;
      v9 = 6;
      goto LABEL_19;
    case 7:
      v23 = objc_alloc(MEMORY[0x24BDD1540]);
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("Zone not found");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v23;
      v9 = 7;
      goto LABEL_19;
    case 8:
      v17 = objc_alloc(MEMORY[0x24BDD1540]);
      v31 = *MEMORY[0x24BDD0FC8];
      v32 = CFSTR("Failed to initialize Record Transport with Safety Cache record");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v17;
      v9 = 8;
LABEL_19:
      v20 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("SafetyMonitorServerErrorDomain"), v9, v7);
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unrecognized response code %d"), *(_QWORD *)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x24BDD1540]);
      v29 = *MEMORY[0x24BDD0FC8];
      v30 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithDomain:code:userInfo:", CFSTR("SafetyMonitorServerErrorDomain"), 1, v19);

      break;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(_QWORD *)(a1 + 48);
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v48 = v25;
    v49 = 2112;
    v50 = v26;
    v51 = 2112;
    v52 = v27;
    v53 = 2112;
    v54 = v28;
    _os_log_error_impl(&dword_245521000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,returning error from server: %@", buf, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)swiftCKF
{
  return self->_swiftCKF;
}

- (void)setSwiftCKF:(id)a3
{
  objc_storeStrong((id *)&self->_swiftCKF, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_swiftCKF, 0);
}

@end
