@implementation SMCloudKitZone

- (SMCloudKitZone)initWithZone:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SMCloudKitZone *v10;
  SMCloudKitZone *v11;
  uint64_t v12;
  CKContainer *container;
  SMCloudKitZone *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v14 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: zone";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: queue";
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)SMCloudKitZone;
  v10 = -[SMCloudKitZone init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zone, a3);
    objc_storeStrong((id *)&v11->_queue, a4);
    +[SMCloudKitZone getContainer](SMCloudKitZone, "getContainer");
    v12 = objc_claimAutoreleasedReturnValue();
    container = v11->_container;
    v11->_container = (CKContainer *)v12;

  }
  self = v11;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[SMCloudKitZone deregisterForZoneUpdates](self, "deregisterForZoneUpdates");
  v3.receiver = self;
  v3.super_class = (Class)SMCloudKitZone;
  -[SMCloudKitZone dealloc](&v3, sel_dealloc);
}

+ (id)getContainer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setUseZoneWidePCS:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.SafetyMonitor.SafetyCache"), 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v3, v2);

  return v4;
}

+ (void)supportsDeviceToDeviceEncryptionWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SMCloudKitZone getContainer](SMCloudKitZone, "getContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,calling accountInfoWithCompletionHandler on container %@", buf, 0x20u);

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__SMCloudKitZone_supportsDeviceToDeviceEncryptionWithCompletion___block_invoke;
  v12[3] = &unk_1E9299E18;
  v14 = a1;
  v15 = a2;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v6, "accountInfoWithCompletionHandler:", v12);

}

void __65__SMCloudKitZone_supportsDeviceToDeviceEncryptionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v22;
    v33 = 2112;
    v34 = (uint64_t)v23;
    v35 = 2112;
    v36 = v24;
    v37 = 2112;
    v38 = v25;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,accountInfoWithCompletionHandler accountInfo %@ error %@", buf, 0x2Au);

  }
  if (v6)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_11:
    v8();
    goto LABEL_12;
  }
  if (v5)
  {
    v9 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v32 = v12;
      v33 = 2112;
      if (v9)
        v15 = CFSTR("YES");
      v34 = v13;
      v35 = 2112;
      v36 = v15;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,supportsDeviceToDeviceEncryption %@", buf, 0x20u);

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_11;
  }
  v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v17 = *MEMORY[0x1E0D8BB70];
  v29 = *MEMORY[0x1E0CB2D50];
  v30 = CFSTR("Got nil CKAccountInfo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 0, v18);

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v27;
    v33 = 2112;
    v34 = (uint64_t)v28;
    _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,got nil account info and nil error", buf, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_12:
}

+ (void)configureCloudKitQos:(id)a3 configuration:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "masqueradeBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "masqueradeBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a4, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v6);

  }
  objc_msgSend(v9, "xpcActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v9, "xpcActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*a4, "setXPCActivity:", v8);

  }
  if (objc_msgSend(v9, "defaultQos"))
    objc_msgSend(*a4, "setQualityOfService:", 25);

}

+ (void)fetchAllZonesFromContainer:(id)a3 database:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_9;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0C94E08], "fetchAllRecordZonesOperation");
  v16 = objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v16, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContainer:", v11);

  -[NSObject setDatabase:](v16, "setDatabase:", v12);
  -[NSObject configuration](v16, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v18;
  objc_msgSend(a1, "configureCloudKitQos:configuration:", v13, &v26);
  v19 = v26;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v16, "operationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = v22;
    v29 = 2112;
    v30 = v23;
    v31 = 2112;
    v32 = v24;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);

  }
  -[NSObject setFetchRecordZonesCompletionBlock:](v16, "setFetchRecordZonesCompletionBlock:", v15);
  objc_msgSend(v12, "addOperation:", v16);

LABEL_9:
}

+ (void)acceptShareWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  NSObject *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(_QWORD, _QWORD, _QWORD);
  id v43;
  SEL v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];

  v56[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))v20;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: invitationToken";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_21;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: container";
    goto LABEL_17;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: queue";
    goto LABEL_17;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: completion";
    goto LABEL_17;
  }
  objc_msgSend(v15, "shareURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v46 = v16;
      v47 = 2112;
      v48 = v35;
      v49 = 2112;
      v50 = v26;
      v51 = 2112;
      v52 = v15;
      v53 = 2112;
      v54 = v17;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepting share token,invitationToken,%@,container,%@", buf, 0x34u);

    }
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke;
    v36[3] = &unk_1E9299E68;
    v37 = v16;
    v43 = a1;
    v44 = a2;
    v38 = v15;
    v42 = v21;
    v39 = v17;
    v40 = v18;
    v41 = v19;
    objc_msgSend(a1, "fetchShareMetadataWithInvitationToken:sessionID:container:queue:qos:withCompletion:", v38, v37, v39, v40, v41, v36);

    v27 = v37;
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v16;
      v47 = 2112;
      v48 = v33;
      v49 = 2112;
      v50 = v34;
      _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,missing invitation token", buf, 0x20u);

    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = CFSTR("nil invitation token or share URL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 7, v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v21)[2](v21, 0, v31);

  }
LABEL_21:

}

void __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v25 = v9;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,Fetch share metadata with error %@ for invitationToken %@", buf, 0x34u);

  }
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v14 = *(void **)(a1 + 80);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_41;
    v19[3] = &unk_1E9299E40;
    v20 = v15;
    v23 = *(_OWORD *)(a1 + 80);
    v21 = v6;
    v22 = *(id *)(a1 + 72);
    objc_msgSend(v14, "acceptShareWithShareMetadata:sessionID:container:queue:qos:withCompletion:", v21, v20, v16, v17, v18, v19);

  }
}

void __94__SMCloudKitZone_acceptShareWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138413314;
      v18 = v12;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v4;
      v25 = 2112;
      v26 = v16;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept share with error %@ for shareMetadata %@", (uint8_t *)&v17, 0x34u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v17 = 138413058;
    v18 = v7;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepted share for shareMetadata %@", (uint8_t *)&v17, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)fetchShareMetadataWithInvitationToken:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _BYTE *v50;
  id v51;
  SEL v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  _BYTE *v58;
  id v59;
  SEL v60;
  id v61;
  uint8_t v62[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  _BYTE buf[24];
  void *v69;
  void *v70;
  id v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v42 = a4;
  v16 = a5;
  v17 = a6;
  v43 = a7;
  v41 = a8;
  objc_msgSend(v15, "shareURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "shareURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v19;
  v71 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E30]), "initWithShareURLs:invitationTokensByShareURL:", v45, v44);
  objc_msgSend(v20, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContainer:", v16);

  objc_msgSend(v20, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v22;
  objc_msgSend(a1, "configureCloudKitQos:configuration:", v43, &v61);
  v40 = v61;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "operationID", v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v69 = v27;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v69) = 0;
  v28 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke;
  v53[3] = &unk_1E9299EB8;
  v29 = v17;
  v54 = v29;
  v30 = v42;
  v55 = v30;
  v59 = a1;
  v60 = a2;
  v31 = v15;
  v56 = v31;
  v58 = buf;
  v32 = v41;
  v57 = v32;
  objc_msgSend(v20, "setPerShareMetadataBlock:", v53);
  v46[0] = v28;
  v46[1] = 3221225472;
  v46[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_48;
  v46[3] = &unk_1E9299F08;
  v33 = v29;
  v47 = v33;
  v50 = buf;
  v34 = v30;
  v48 = v34;
  v51 = a1;
  v52 = a2;
  v35 = v32;
  v49 = v35;
  objc_msgSend(v20, "setFetchShareMetadataCompletionBlock:", v46);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v62 = 138412802;
    v63 = v34;
    v64 = 2112;
    v65 = v38;
    v66 = 2112;
    v67 = v39;
    _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetching share data", v62, 0x20u);

  }
  objc_msgSend(v16, "addOperation:", v20);

  _Block_object_dispose(buf, 8);
}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9299E90;
  v14 = v7;
  v15 = v6;
  v8 = *(NSObject **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v19 = *(_OWORD *)(a1 + 72);
  v17 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 56);
  v9 = (id)v12;
  v18 = v12;
  v10 = v6;
  v11 = v7;
  dispatch_async(v8, block);

}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void (*v4)(void);
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 48);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 56);
      v19 = 138413314;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to fetch share metadata with error %@ for invitationToken %@", (uint8_t *)&v19, 0x34u);

    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (!*(_BYTE *)(v3 + 24))
    {
      *(_BYTE *)(v3 + 24) = 1;
      v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_11:
      v4();
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 56);
      v19 = 138413314;
      v20 = v6;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,fetched share metadata %@ for invitationToken %@", (uint8_t *)&v19, 0x34u);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (!*(_BYTE *)(v12 + 24))
    {
      *(_BYTE *)(v12 + 24) = 1;
      v4 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_11;
    }
  }
}

void __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2_49;
  v6[3] = &unk_1E9299EE0;
  v10 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v4 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __101__SMCloudKitZone_fetchShareMetadataWithInvitationToken_sessionID_container_queue_qos_withCompletion___block_invoke_2_49(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *(_QWORD *)(v1 + 40);
        v4 = (objc_class *)objc_opt_class();
        NSStringFromClass(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 72));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(v1 + 32);
        v8 = 138413058;
        v9 = v3;
        v10 = 2112;
        v11 = v5;
        v12 = 2112;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,%@,failed to complete perShareMetadataBlock with error %@", (uint8_t *)&v8, 0x2Au);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

+ (void)acceptShareWithShareMetadata:(id)a3 sessionID:(id)a4 container:(id)a5 queue:(id)a6 qos:(id)a7 withCompletion:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _BYTE *v48;
  id v49;
  SEL v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  _BYTE *v56;
  id v57;
  SEL v58;
  id v59;
  uint8_t v60[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  _BYTE buf[24];
  void *v67;
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v41 = a4;
  v43 = a5;
  v16 = a6;
  v42 = a7;
  v17 = a8;
  v18 = objc_alloc(MEMORY[0x1E0C94B78]);
  v68[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithShareMetadatas:", v19);

  objc_msgSend(v20, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContainer:", v43);

  objc_msgSend(v20, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v22;
  objc_msgSend(a1, "configureCloudKitQos:configuration:", v42, &v59);
  v40 = v59;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "operationID", v40, v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v67 = v27;
    _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v67) = 0;
  v28 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke;
  v51[3] = &unk_1E9299F58;
  v29 = v16;
  v52 = v29;
  v30 = v41;
  v53 = v30;
  v57 = a1;
  v58 = a2;
  v31 = v15;
  v54 = v31;
  v56 = buf;
  v32 = v17;
  v55 = v32;
  objc_msgSend(v20, "setPerShareCompletionBlock:", v51);
  v44[0] = v28;
  v44[1] = 3221225472;
  v44[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_53;
  v44[3] = &unk_1E9299F08;
  v33 = v29;
  v45 = v33;
  v48 = buf;
  v34 = v30;
  v46 = v34;
  v49 = a1;
  v50 = a2;
  v35 = v32;
  v47 = v35;
  objc_msgSend(v20, "setAcceptSharesCompletionBlock:", v44);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v60 = 138412802;
    v61 = v34;
    v62 = 2112;
    v63 = v38;
    v64 = 2112;
    v65 = v39;
    _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepting share", v60, 0x20u);

  }
  objc_msgSend(v43, "addOperation:", v20);

  _Block_object_dispose(buf, 8);
}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;

  v5 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9299F30;
  v11 = v5;
  v6 = *(NSObject **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v15 = *(_OWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 56);
  v7 = (id)v9;
  v14 = v9;
  v8 = v5;
  dispatch_async(v6, block);

}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void (*v6)(void);
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = 138413314;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Receiver,sessionID:%@,%@,%@,failed to accept share with error %@ for shareMetadata %@", (uint8_t *)&v19, 0x34u);

    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v19 = 138413058;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Receiver,sessionID:%@,%@,%@,accepted share for shareMetadata %@", (uint8_t *)&v19, 0x2Au);

    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_BYTE *)(v12 + 24))
    {
      *(_BYTE *)(v12 + 24) = 1;
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
      goto LABEL_10;
    }
  }
}

void __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2_54;
  v6[3] = &unk_1E9299EE0;
  v10 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v4 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v11 = *(_OWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __92__SMCloudKitZone_acceptShareWithShareMetadata_sessionID_container_queue_qos_withCompletion___block_invoke_2_54(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *(_QWORD *)(v1 + 40);
        v4 = (objc_class *)objc_opt_class();
        NSStringFromClass(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 72));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(v1 + 32);
        v8 = 138413058;
        v9 = v3;
        v10 = 2112;
        v11 = v5;
        v12 = 2112;
        v13 = v6;
        v14 = 2112;
        v15 = v7;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,%@,failed to complete perShareCompletionBlock with error %@", (uint8_t *)&v8, 0x2Au);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)fetchZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _BYTE *v31;
  SEL v32;
  _QWORD v33[5];
  id v34;
  _BYTE *v35;
  SEL v36;
  id v37;
  _BYTE buf[24];
  void *v39;
  _QWORD v40[4];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_9;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  v13 = objc_alloc(MEMORY[0x1E0C94E08]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "initWithRecordZoneIDs:", v15);

  -[SMCloudKitZone container](self, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v16, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContainer:", v17);

  -[NSObject setDatabase:](v16, "setDatabase:", v9);
  -[NSObject configuration](v16, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v19;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v10, &v37);
  v28 = v37;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v16, "operationID", v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v39 = v24;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,created CKOperation ID, %@", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v39) = 0;
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke;
  v33[3] = &unk_1E9299F80;
  v35 = buf;
  v36 = a2;
  v33[4] = self;
  v26 = v12;
  v34 = v26;
  -[NSObject setPerRecordZoneCompletionBlock:](v16, "setPerRecordZoneCompletionBlock:", v33);
  v29[0] = v25;
  v29[1] = 3221225472;
  v29[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_56;
  v29[3] = &unk_1E9299FA8;
  v29[4] = self;
  v31 = buf;
  v32 = a2;
  v30 = v26;
  -[NSObject setFetchRecordZonesCompletionBlock:](v16, "setFetchRecordZonesCompletionBlock:", v29);
  objc_msgSend(v9, "addOperation:", v16);

  _Block_object_dispose(buf, 8);
LABEL_9:

}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9298690;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v9;
  v13 = *(_OWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 56);
  v17 = v6;
  v10 = (id)v13;
  v18 = v13;
  v11 = v6;
  v12 = v7;
  dispatch_async(v8, block);

}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138413058;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to fetch zone with zoneID %@ with error %@", (uint8_t *)&v15, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone fetched successfully for zoneID %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setZone:", *(_QWORD *)(a1 + 48));
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2_57;
  block[3] = &unk_1E9298528;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v6;
  v14 = *(_QWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v13 = v9;
  v8 = v4;
  dispatch_async(v5, block);

}

uint64_t __59__SMCloudKitZone_fetchZoneFromDatabase_qos_withCompletion___block_invoke_2_57(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(v1 + 32);
        v7 = 138412802;
        v8 = v4;
        v9 = 2112;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneCompletionBlock with error %@", (uint8_t *)&v7, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)saveZoneToDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  SEL v33;
  _QWORD v34[5];
  id v35;
  _BYTE *v36;
  SEL v37;
  id v38;
  _BYTE buf[24];
  void *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: qos";
    goto LABEL_13;
  }
  v13 = objc_alloc(MEMORY[0x1E0C94EF0]);
  -[SMCloudKitZone zone](self, "zone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "initWithRecordZonesToSave:recordZoneIDsToDelete:", v15, 0);

  -[SMCloudKitZone container](self, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v16, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContainer:", v17);

  -[NSObject setDatabase:](v16, "setDatabase:", v9);
  -[NSObject configuration](v16, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v19;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v10, &v38);
  v29 = v38;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v16, "operationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v24;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v40) = 0;
  v25 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke;
  v34[3] = &unk_1E9299F80;
  v36 = buf;
  v37 = a2;
  v34[4] = self;
  v26 = v12;
  v35 = v26;
  -[NSObject setPerRecordZoneSaveBlock:](v16, "setPerRecordZoneSaveBlock:", v34);
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_60;
  v30[3] = &unk_1E9299FD0;
  v30[4] = self;
  v32 = buf;
  v33 = a2;
  v31 = v26;
  -[NSObject setModifyRecordZonesCompletionBlock:](v16, "setModifyRecordZonesCompletionBlock:", v30);
  objc_msgSend(v9, "addOperation:", v16);

  _Block_object_dispose(buf, 8);
LABEL_14:

}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9298690;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v9;
  v13 = *(_OWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 56);
  v17 = v6;
  v10 = (id)v13;
  v18 = v13;
  v11 = v6;
  v12 = v7;
  dispatch_async(v8, block);

}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = 138413058;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@ with error %@", (uint8_t *)&v15, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone saved successfully for zoneID %@", (uint8_t *)&v15, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setZone:", *(_QWORD *)(a1 + 48));
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v9 + 24))
  {
    *(_BYTE *)(v9 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_60(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2_61;
  block[3] = &unk_1E9298528;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v15 = *(_QWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v8 = (id)v10;
  v14 = v10;
  v9 = v5;
  dispatch_async(v6, block);

}

uint64_t __56__SMCloudKitZone_saveZoneToDatabase_qos_withCompletion___block_invoke_2_61(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(v1 + 32);
        v7 = 138412802;
        v8 = v4;
        v9 = 2112;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneSaveBlock with error %@", (uint8_t *)&v7, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)deleteZoneFromDatabase:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _BYTE *v32;
  SEL v33;
  _QWORD v34[5];
  id v35;
  _BYTE *v36;
  SEL v37;
  id v38;
  _BYTE buf[24];
  void *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v29 = a4;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_9;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  v12 = objc_alloc(MEMORY[0x1E0C94EF0]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v14);

  -[SMCloudKitZone container](self, "container");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v15, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContainer:", v16);

  -[NSObject setDatabase:](v15, "setDatabase:", v9);
  -[NSObject configuration](v15, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v18;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v29, &v38);
  v28 = v38;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v15, "operationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v24;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v40) = 0;
  v25 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke;
  v34[3] = &unk_1E929A020;
  v36 = buf;
  v37 = a2;
  v34[4] = self;
  v26 = v11;
  v35 = v26;
  -[NSObject setPerRecordZoneDeleteBlock:](v15, "setPerRecordZoneDeleteBlock:", v34);
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_64;
  v30[3] = &unk_1E9299FD0;
  v30[4] = self;
  v32 = buf;
  v33 = a2;
  v31 = v26;
  -[NSObject setModifyRecordZonesCompletionBlock:](v15, "setModifyRecordZonesCompletionBlock:", v30);
  objc_msgSend(v9, "addOperation:", v15);

  _Block_object_dispose(buf, 8);
LABEL_9:

}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9299FF8;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v6;
  v14 = *(_QWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v13 = v9;
  v8 = v4;
  dispatch_async(v5, block);

}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v12 = 138413058;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to delete zone with zoneID %@ with error %@", (uint8_t *)&v12, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "zoneID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone deleted successfully for zoneID %@", (uint8_t *)&v12, 0x20u);
  }

LABEL_7:
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_BYTE *)(v11 + 24))
  {
    *(_BYTE *)(v11 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_64(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v5 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2_65;
  block[3] = &unk_1E9298528;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v15 = *(_QWORD *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 40);
  v8 = (id)v10;
  v14 = v10;
  v9 = v5;
  dispatch_async(v6, block);

}

uint64_t __60__SMCloudKitZone_deleteZoneFromDatabase_qos_withCompletion___block_invoke_2_65(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(v1 + 32);
        v7 = 138412802;
        v8 = v4;
        v9 = 2112;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordZoneDeleteBlock with error %@", (uint8_t *)&v7, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)fetchShareParticipantsWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  objc_class *v47;
  void *v48;
  void *v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  objc_class *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id obj;
  void *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  _BYTE *v66;
  SEL v67;
  _QWORD v68[7];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t v74[4];
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  void *v79;
  _BYTE buf[24];
  uint64_t (*v81)(uint64_t, uint64_t);
  __int128 v82;
  uint64_t v83;
  const __CFString *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v56 = a5;
  v8 = objc_alloc(MEMORY[0x1E0C99E08]);
  v57 = v7;
  objc_msgSend(v7, "receiverHandles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  objc_msgSend(v7, "receiverHandles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v71;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v71 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0D8B960];
        objc_msgSend(v13, "primaryHandle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "getSMHandleTypeWithHandle:", v15);

        if (v16 == 2)
        {
          v20 = objc_alloc(MEMORY[0x1E0C95218]);
          objc_msgSend(v13, "primaryHandle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v20, "initWithEmailAddress:", v18);
        }
        else
        {
          if (v16 != 1)
            goto LABEL_20;
          v17 = objc_alloc(MEMORY[0x1E0C95218]);
          objc_msgSend(v13, "primaryHandle");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "initWithPhoneNumber:", v18);
        }
        v21 = (void *)v19;

        if (!v21)
        {
LABEL_20:
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "primaryHandle");
            v50 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v48;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v49;
            *(_WORD *)&buf[22] = 2112;
            v81 = v50;
            _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Invalid Handle %@", buf, 0x20u);

          }
          v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v83 = *MEMORY[0x1E0CB2D50];
          v84 = CFSTR("Invalid Receiver Handle received");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 0, v32);
          (*((void (**)(id, _QWORD, _QWORD, void *))v56 + 2))(v56, 0, 0, v46);

          goto LABEL_23;
        }
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "primaryHandle");
          v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2112;
          v81 = v26;
          LOWORD(v82) = 2112;
          *(_QWORD *)((char *)&v82 + 2) = v21;
          _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,Valid Handle %@,%@", buf, 0x2Au);

        }
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v21, v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v85, 16);
      if (v10)
        continue;
      break;
    }
  }

  v27 = objc_alloc(MEMORY[0x1E0C94E50]);
  objc_msgSend(v61, "allValues");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)objc_msgSend(v27, "initWithUserIdentityLookupInfos:", v28);

  -[SMCloudKitZone container](self, "container");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setContainer:", v29);

  objc_msgSend(obj, "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v31;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v55, &v69);
  v32 = v69;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v37 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "operationID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2112;
    v81 = v37;
    LOWORD(v82) = 2112;
    *(_QWORD *)((char *)&v82 + 2) = v38;
    _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v81 = __Block_byref_object_copy__26;
  *(_QWORD *)&v82 = __Block_byref_object_dispose__26;
  v39 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend(v57, "receiverHandles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v82 + 1) = objc_msgSend(v39, "initWithCapacity:", objc_msgSend(v40, "count"));

  v41 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke;
  v68[3] = &unk_1E929A070;
  v68[4] = self;
  v68[5] = buf;
  v68[6] = a2;
  objc_msgSend(obj, "setPerShareParticipantCompletionBlock:", v68);
  v62[0] = v41;
  v62[1] = 3221225472;
  v62[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_73;
  v62[3] = &unk_1E929A0C0;
  v62[4] = self;
  v67 = a2;
  v65 = v56;
  v63 = v57;
  v64 = v61;
  v66 = buf;
  objc_msgSend(obj, "setFetchShareParticipantsCompletionBlock:", v62);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "userIdentityLookupInfos");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v74 = 138412802;
    v75 = v52;
    v76 = 2112;
    v77 = v53;
    v78 = 2112;
    v79 = v54;
    _os_log_debug_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,adding fetch share participants operation with ID lookups %@", v74, 0x20u);

  }
  -[SMCloudKitZone container](self, "container");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addOperation:", obj);

  _Block_object_dispose(buf, 8);
LABEL_23:

}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  __int128 v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2;
  v15[3] = &unk_1E929A048;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v11;
  v18 = v7;
  v19 = v8;
  v20 = *(_OWORD *)(a1 + 40);
  v12 = v8;
  v13 = v7;
  v14 = v9;
  dispatch_async(v10, v15);

}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138413314;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to identify participant %@ for zoneID %@ with error %@", (uint8_t *)&v16, 0x34u);

    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,identified participant %@ for zoneID %@", (uint8_t *)&v16, 0x2Au);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2_74;
  block[3] = &unk_1E929A098;
  v5 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v16 = *(_QWORD *)(a1 + 72);
  v14 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v15 = v7;
  v8 = v3;
  dispatch_async(v4, block);

}

void __72__SMCloudKitZone_fetchShareParticipantsWithConversation_qos_completion___block_invoke_2_74(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "code") == 2)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
      v4 = objc_claimAutoreleasedReturnValue();

      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v39 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              v11 = (objc_class *)objc_opt_class();
              NSStringFromClass(v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(*(SEL *)(a1 + 80));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138413058;
              v44 = v12;
              v45 = 2112;
              v46 = v13;
              v47 = 2112;
              v48 = v9;
              v49 = 2112;
              v50 = v14;
              _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perShareParticipantCompletionBlock for user ID lookup info %@ with error %@", buf, 0x2Au);

            }
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v6);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v44 = v31;
        v45 = 2112;
        v46 = v32;
        v47 = 2112;
        v48 = v33;
        _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete fetching of share participants with error %@", buf, 0x20u);

      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v17;
      v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,completed fetch of share participants", buf, 0x16u);

    }
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 48), "receiverHandles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "receiverHandles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKeyedSubscript:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, v29);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v24);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

- (void)saveRecord:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint8_t buf[16];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: database";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_12;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: record";
    goto LABEL_11;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: completion";
    goto LABEL_11;
  }
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__SMCloudKitZone_saveRecord_toDatabase_qos_withCompletion___block_invoke;
  v18[3] = &unk_1E9299760;
  v19 = v14;
  -[SMCloudKitZone saveRecords:toDatabase:qos:withCompletion:](self, "saveRecords:toDatabase:qos:withCompletion:", v15, v11, v12, v18);

  v16 = v19;
LABEL_12:

}

void __59__SMCloudKitZone_saveRecord_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)saveRecords:(id)a3 toDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  SEL v37;
  _QWORD v38[6];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: database";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_19;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: records";
    goto LABEL_18;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: qos";
    goto LABEL_18;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: completion";
    goto LABEL_18;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = v30;
    v42 = 2112;
    v43 = v31;
    v44 = 2112;
    v45 = v11;
    _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,%@,%@,saving records,%@", buf, 0x20u);

  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v11, 0);
  -[SMCloudKitZone container](self, "container");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v17, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContainer:", v18);

  -[NSObject setDatabase:](v17, "setDatabase:", v12);
  -[NSObject setSavePolicy:](v17, "setSavePolicy:", 1);
  -[NSObject configuration](v17, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v20;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v13, &v39);
  v34 = v39;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v33 = a2;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v17, "operationID");
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v41 = v32;
    v42 = 2112;
    v43 = v23;
    v44 = 2112;
    v45 = v24;
    v46 = 2112;
    v47 = v25;
    v26 = (void *)v25;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    a2 = v33;
  }

  v27 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke;
  v38[3] = &unk_1E929A0E8;
  v38[4] = self;
  v38[5] = a2;
  -[NSObject setPerRecordSaveBlock:](v17, "setPerRecordSaveBlock:", v38);
  v35[0] = v27;
  v35[1] = 3221225472;
  v35[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_78;
  v35[3] = &unk_1E929A110;
  v35[4] = self;
  v37 = a2;
  v36 = v15;
  -[NSObject setModifyRecordsCompletionBlock:](v17, "setModifyRecordsCompletionBlock:", v35);
  objc_msgSend(v12, "addOperation:", v17);

LABEL_19:
}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_2;
  v13[3] = &unk_1E9298238;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v9;
  v16 = v6;
  v17 = v10;
  v11 = v6;
  v12 = v7;
  dispatch_async(v8, v13);

}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138413058;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save record with recordID %@ with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully saved records with recordID %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }

}

void __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_78(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  _QWORD block[4];
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,modifyRecordsCompletionBlock called, savedRecords, %@, deletedRecordIDs, %@, operationError, %@", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_79;
  block[3] = &unk_1E9298750;
  v15 = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = v15;
  v19 = *(_OWORD *)(a1 + 40);
  v16 = (id)v19;
  v24 = v19;
  v23 = v7;
  v17 = v7;
  v18 = v9;
  dispatch_async(v14, block);

}

uint64_t __60__SMCloudKitZone_saveRecords_toDatabase_qos_withCompletion___block_invoke_79(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to save records with error %@", (uint8_t *)&v11, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully saved all records", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)saveRecordsWithRetry:(int64_t)a3 records:(id)a4 toDatabase:(id)a5 qos:(id)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  SEL v25;
  int64_t v26;
  uint8_t buf[16];

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: database";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_15;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: records";
    goto LABEL_14;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: completion";
    goto LABEL_14;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: qos";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__SMCloudKitZone_saveRecordsWithRetry_records_toDatabase_qos_withCompletion___block_invoke;
  v21[3] = &unk_1E929A138;
  v21[4] = self;
  v25 = a2;
  v24 = v17;
  v26 = a3;
  v22 = v13;
  v23 = v15;
  -[SMCloudKitZone saveRecords:toDatabase:qos:withCompletion:](self, "saveRecords:toDatabase:qos:withCompletion:", v22, v18, v23, v21);

LABEL_16:
}

void __77__SMCloudKitZone_saveRecordsWithRetry_records_toDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412802;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,records saved successfully for zoneID %@", (uint8_t *)&v29, 0x20u);

    }
    goto LABEL_13;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v6))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_14;
    }
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138413058;
    v30 = v19;
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v6;
    v22 = "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@ with non recoverable error %@";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v29, 0x2Au);

    goto LABEL_13;
  }
  v7 = *(_QWORD *)(a1 + 72);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7 <= 0)
  {
    if (!v9)
      goto LABEL_13;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138413058;
    v30 = v19;
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v6;
    v22 = "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@  after retries with recoverable error %@";
    goto LABEL_16;
  }
  if (v9)
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 72);
    v29 = 138413314;
    v30 = v24;
    v31 = 2112;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v6;
    v37 = 1024;
    v38 = v27;
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save records in zone with zoneID %@ with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v29, 0x30u);

  }
  v10 = *(_QWORD *)(a1 + 72) - 1;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "privateDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveRecordsWithRetry:records:toDatabase:qos:withCompletion:", v10, v12, v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

LABEL_14:
}

- (void)fetchRecord:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _BYTE *v34;
  SEL v35;
  _QWORD v36[5];
  id v37;
  _BYTE *v38;
  SEL v39;
  id v40;
  _BYTE buf[24];
  void *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[4];

  v45[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: recordID";
    goto LABEL_13;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  v16 = objc_alloc(MEMORY[0x1E0C94E18]);
  v45[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "initWithRecordIDs:", v17);

  -[SMCloudKitZone container](self, "container");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v18, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContainer:", v19);

  -[NSObject setDatabase:](v18, "setDatabase:", v12);
  -[NSObject configuration](v18, "configuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v21;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v13, &v40);
  v31 = v40;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v18, "operationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v29;
    *(_WORD *)&buf[22] = 2112;
    v42 = v24;
    v43 = 2112;
    v44 = v25;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v42) = 0;
  v26 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke;
  v36[3] = &unk_1E929A160;
  v38 = buf;
  v39 = a2;
  v36[4] = self;
  v27 = v15;
  v37 = v27;
  -[NSObject setPerRecordCompletionBlock:](v18, "setPerRecordCompletionBlock:", v36);
  v32[0] = v26;
  v32[1] = 3221225472;
  v32[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_82;
  v32[3] = &unk_1E9299FA8;
  v32[4] = self;
  v34 = buf;
  v35 = a2;
  v33 = v27;
  -[NSObject setFetchRecordsCompletionBlock:](v18, "setFetchRecordsCompletionBlock:", v32);
  objc_msgSend(v12, "addOperation:", v18);

  _Block_object_dispose(buf, 8);
LABEL_14:

}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  uint64_t v19;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2;
  block[3] = &unk_1E9298690;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v7;
  v16 = v9;
  v13 = *(_OWORD *)(a1 + 40);
  v19 = *(_QWORD *)(a1 + 56);
  v17 = v6;
  v10 = (id)v13;
  v18 = v13;
  v11 = v6;
  v12 = v7;
  dispatch_async(v8, block);

}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to fetch record error %@ for record %@", (uint8_t *)&v13, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully fetch record %@", (uint8_t *)&v13, 0x20u);
  }

LABEL_7:
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (!*(_BYTE *)(v12 + 24))
  {
    *(_BYTE *)(v12 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2_83;
  block[3] = &unk_1E9298528;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v6;
  v14 = *(_QWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v7 = (id)v9;
  v13 = v9;
  v8 = v4;
  dispatch_async(v5, block);

}

uint64_t __62__SMCloudKitZone_fetchRecord_fromDatabase_qos_withCompletion___block_invoke_2_83(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24))
  {
    v1 = result;
    if (*(_QWORD *)(result + 32))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = (objc_class *)objc_opt_class();
        NSStringFromClass(v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(*(SEL *)(v1 + 64));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(v1 + 32);
        v7 = 138412802;
        v8 = v4;
        v9 = 2112;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to complete perRecordCompletionBlock with error %@", (uint8_t *)&v7, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)updateRecord:(id)a3 inDatabase:(id)a4 qos:(id)a5 usingBlock:(id)a6 withCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: database";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_15;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: recordID";
    goto LABEL_14;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: block";
    goto LABEL_14;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: completion";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke;
  v21[3] = &unk_1E929A1B0;
  v21[4] = self;
  v27 = a2;
  v22 = v13;
  v25 = v18;
  v26 = v16;
  v23 = v14;
  v24 = v15;
  -[SMCloudKitZone fetchRecord:fromDatabase:qos:withCompletion:](self, "fetchRecord:fromDatabase:qos:withCompletion:", v22, v23, v24, v21);

LABEL_16:
}

void __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 80));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v27 = v15;
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to fetch record for recordID %@ for zoneID %@ with error %@", buf, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 72);
    v25 = v5;
    (*(void (**)(void))(v8 + 16))();
    v9 = v25;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[2] = __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke_84;
    v19[3] = &unk_1E929A188;
    v10 = *(_QWORD *)(a1 + 80);
    v11 = *(void **)(a1 + 40);
    v20 = *(id *)(a1 + 32);
    v24 = v10;
    v12 = *(_QWORD *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v19[1] = 3221225472;
    v21 = v11;
    v5 = v9;
    v22 = v5;
    v23 = *(id *)(a1 + 64);
    objc_msgSend(v20, "saveRecord:toDatabase:qos:withCompletion:", v5, v12, v13, v19);

  }
}

void __72__SMCloudKitZone_updateRecord_inDatabase_qos_usingBlock_withCompletion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413314;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save record for recordID %@ for zoneID %@ with error %@", (uint8_t *)&v16, 0x34u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,record %@ saved successfully for zoneID %@", (uint8_t *)&v16, 0x2Au);
    goto LABEL_6;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)deleteRecords:(id)a3 fromDatabase:(id)a4 qos:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  SEL v33;
  _QWORD v34[6];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: database";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: recordIDs";
    goto LABEL_13;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: completion";
    goto LABEL_13;
  }
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", 0, v11);
  -[SMCloudKitZone container](self, "container");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject configuration](v16, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContainer:", v17);

  -[NSObject setDatabase:](v16, "setDatabase:", v12);
  -[NSObject configuration](v16, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v19;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v13, &v35);
  v30 = v35;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v29 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v28 = a2;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject operationID](v16, "operationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v37 = v22;
    v38 = 2112;
    v39 = v23;
    v40 = 2112;
    v41 = v24;
    v42 = 2112;
    v43 = v25;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    a2 = v28;
    v13 = v29;

  }
  v26 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke;
  v34[3] = &unk_1E929A1D8;
  v34[4] = self;
  v34[5] = a2;
  -[NSObject setPerRecordDeleteBlock:](v16, "setPerRecordDeleteBlock:", v34);
  v31[0] = v26;
  v31[1] = 3221225472;
  v31[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_87;
  v31[3] = &unk_1E929A110;
  v31[4] = self;
  v33 = a2;
  v32 = v15;
  -[NSObject setModifyRecordsCompletionBlock:](v16, "setModifyRecordsCompletionBlock:", v31);
  objc_msgSend(v12, "addOperation:", v16);

LABEL_14:
}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2;
  v12[3] = &unk_1E9298238;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138413058;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete record with recordID %@ with error %@", (uint8_t *)&v12, 0x2Au);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully deleted record with recordID %@", (uint8_t *)&v12, 0x20u);
    goto LABEL_6;
  }

}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_87(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  __int128 v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2_88;
  block[3] = &unk_1E9297910;
  v14 = v7;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v12 = *(_OWORD *)(a1 + 40);
  v9 = (id)v12;
  v17 = v12;
  v10 = v6;
  v11 = v7;
  dispatch_async(v8, block);

}

void __64__SMCloudKitZone_deleteRecords_fromDatabase_qos_withCompletion___block_invoke_2_88(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v14;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,successfully deleted all records", buf, 0x16u);

    }
    goto LABEL_17;
  }
  if (objc_msgSend(v2, "code") != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      v35 = 2112;
      v36 = v22;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,%@,%@,failed to delete one or more records with error %@", buf, 0x20u);

    }
LABEL_17:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10, (_QWORD)v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(a1 + 64));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v10);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v32 = v24;
            v33 = 2112;
            v34 = v25;
            v35 = 2112;
            v36 = v10;
            v37 = 2112;
            v38 = v26;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,Partial failure - Failed to delete record with record ID %@ with error %@", buf, 0x2Au);

          }
          v17 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

          goto LABEL_21;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_21:

}

- (void)removeShareParticipantsInConversation:(id)a3 qos:(id)a4 withCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  _BYTE *v33;
  SEL v34;
  _QWORD v35[5];
  NSObject *v36;
  _BYTE *v37;
  SEL v38;
  uint64_t v39;
  void *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[SMCloudKitZone share](self, "share");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "receiverPrimaryHandles");
      v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v42 = v18;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,removing handles from share,%@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__26;
    v43 = __Block_byref_object_dispose__26;
    v44 = (id)MEMORY[0x1E0C9AA60];
    v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v20 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke;
    v35[3] = &unk_1E929A200;
    v37 = buf;
    v38 = a2;
    v35[4] = self;
    v21 = v19;
    v36 = v21;
    -[SMCloudKitZone fetchShareParticipantsWithConversation:qos:completion:](self, "fetchShareParticipantsWithConversation:qos:completion:", v9, v10, v35);
    -[SMCloudKitZone queue](self, "queue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_90;
    block[3] = &unk_1E9299FF8;
    block[4] = self;
    v31 = v10;
    v33 = buf;
    v34 = a2;
    v32 = v11;
    dispatch_group_notify(v21, v22, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v29;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,CloudKit zone share not set up", buf, 0x16u);

    }
    v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CloudKit zone share has not been set up"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 49, v25);

    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);
  }

}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "allKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = 138412802;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,found participants to remove from share,%@", (uint8_t *)&v11, 0x20u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_90(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "privateDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_2;
  v12[3] = &unk_1E929A228;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_92;
  v9[3] = &unk_1E929A250;
  v9[4] = v13;
  v11 = v15;
  v10 = v8;
  objc_msgSend(v2, "updateRecord:inDatabase:qos:usingBlock:withCompletion:", v4, v5, v6, v12, v9);

}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_2(uint64_t a1, id *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = a1;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v14 = v3;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(*(SEL *)(v3 + 48));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v20 = v12;
            v21 = 2112;
            v22 = v13;
            v23 = 2112;
            v24 = v9;
            _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "#SafetyCache,%@,%@,removing participant from share,%@", buf, 0x20u);

            v3 = v14;
          }

          objc_msgSend(*a2, "removeParticipant:", v9);
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      }
      while (v6);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", buf, 2u);
    }
  }

}

void __75__SMCloudKitZone_removeShareParticipantsInConversation_qos_withCompletion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = a2;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to remove participants with error,%@", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setShare:", a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createNewInvitationTokensWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  SEL v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke;
  v15[3] = &unk_1E929A2C8;
  v18 = v11;
  v19 = a2;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v12 = v10;
  v13 = v11;
  v14 = v9;
  -[SMCloudKitZone fetchShareParticipantsWithConversation:qos:completion:](self, "fetchShareParticipantsWithConversation:qos:completion:", v14, v12, v15);

}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "receiverHandles");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      v46 = 2112;
      v47 = v29;
      v48 = 2112;
      v49 = v30;
      v50 = 2112;
      v51 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to identify participants %@ for zoneID %@ with error %@", buf, 0x34u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 40), "receiverHandles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "share");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeParticipant:", v17);

          objc_msgSend(*(id *)(a1 + 32), "share");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addParticipant:", v17);

          objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v14);
    }

    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "share");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "privateDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 48);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_97;
    v32[3] = &unk_1E929A2A0;
    v32[4] = *(_QWORD *)(a1 + 32);
    v31 = *(_OWORD *)(a1 + 56);
    v24 = (id)v31;
    v36 = v31;
    v33 = *(id *)(a1 + 40);
    v34 = v11;
    v35 = v12;
    v25 = v11;
    objc_msgSend(v20, "saveRecord:toDatabase:qos:withCompletion:", v21, v22, v23, v32);

  }
}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _BYTE *v49;
  uint8_t v50[128];
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v36 = v4;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v33;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2112;
      v52 = v35;
      LOWORD(v53) = 2112;
      *(_QWORD *)((char *)&v53 + 2) = v36;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed for zoneID %@ with error %@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v52 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,record saved successfully for zoneID %@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v52 = __Block_byref_object_copy__26;
    *(_QWORD *)&v53 = __Block_byref_object_dispose__26;
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 40), "receiverHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v53 + 1) = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count"));

    objc_msgSend(v37, "participants");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_99;
    v46[3] = &unk_1E929A278;
    v47 = *(id *)(a1 + 48);
    v49 = buf;
    v48 = *(id *)(a1 + 40);
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v46);

    objc_msgSend(*(id *)(a1 + 32), "setShare:", v37);
    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 40), "receiverHandles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = *(id *)(*(_QWORD *)&buf[8] + 40);
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v16)
    {
      v39 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v39)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v19 = objc_alloc(MEMORY[0x1E0C94CE0]);
          objc_msgSend(v18, "invitationToken");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sharingInvitationData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "share");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "URL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "invitationToken");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "participantID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v19, "initWithSharingInvitationData:shareURL:participantID:", v21, v23, v25);

          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v18);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "primaryHandle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v26, v28);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v16);
    }

    v29 = (void *)objc_msgSend(v40, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setInvitationTokenMap:", v29);

    v30 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "invitationTokenMap");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v30 + 16))(v30, v31, 1, 0);

    _Block_object_dispose(buf, 8);
  }

}

void __75__SMCloudKitZone_createNewInvitationTokensWithConversation_qos_completion___block_invoke_99(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    objc_msgSend(*(id *)(a1 + 40), "receiverHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 == v8)
      *a4 = 1;
  }

}

- (void)subscribeToZoneChangesInPrivateDatabaseWithQoS:(id)a3 completion:(id)a4
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  const char *v32;
  _QWORD v33[5];
  id v34;
  SEL v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (objc_class *)MEMORY[0x1E0C950B0];
  v9 = a3;
  v10 = [v8 alloc];
  -[SMCloudKitZone zoneID](self, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitZone zoneSubscriptionID](self, "zoneSubscriptionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithZoneID:subscriptionID:", v11, v12);

  v14 = objc_alloc_init(MEMORY[0x1E0C94F50]);
  objc_msgSend(v14, "setShouldSendContentAvailable:", 1);
  objc_msgSend(v13, "setNotificationInfo:", v14);
  v15 = objc_alloc(MEMORY[0x1E0C94F28]);
  v45[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v16, 0);

  objc_msgSend(v17, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v18;
  objc_msgSend((id)objc_opt_class(), "configureCloudKitQos:configuration:", v9, &v36);

  v19 = v36;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneID](self, "zoneID");
    v32 = a2;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "operationID");
    v31 = v14;
    v25 = v19;
    v26 = v13;
    v27 = v7;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v38 = v22;
    v39 = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v24;
    v43 = 2112;
    v44 = v28;
    _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zoneID,%@,created CKOperation ID, %@", buf, 0x2Au);

    v7 = v27;
    v13 = v26;
    v19 = v25;
    v14 = v31;

    a2 = v32;
  }

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__SMCloudKitZone_subscribeToZoneChangesInPrivateDatabaseWithQoS_completion___block_invoke;
  v33[3] = &unk_1E929A110;
  v34 = v7;
  v35 = a2;
  v33[4] = self;
  v29 = v7;
  objc_msgSend(v17, "setModifySubscriptionsCompletionBlock:", v33);
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addOperation:", v17);

}

void __76__SMCloudKitZone_subscribeToZoneChangesInPrivateDatabaseWithQoS_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413058;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed for zoneID %@ with error %@", (uint8_t *)&v16, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = 0;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,succeeded for zoneID %@ with error %@", (uint8_t *)&v16, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (BOOL)shouldRetryCkError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  v7 = 1;
  if (v5)
  {
    if ((v6 = objc_msgSend(v3, "code"), v6 <= 0x24) && ((1 << v6) & 0x1BFFAF5FA2) != 0 || v6 - 110 < 3)
      v7 = 0;
  }

  return v7;
}

- (CKRecordZoneID)zoneID
{
  void *v2;
  void *v3;

  -[SMCloudKitZone zone](self, "zone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordZoneID *)v3;
}

- (NSString)zoneName
{
  void *v2;
  void *v3;

  -[SMCloudKitZone zoneID](self, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)zoneSubscriptionID
{
  void *v2;
  void *v3;

  -[SMCloudKitZone zoneName](self, "zoneName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SMCloudKitSubscription-"), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)ownerName
{
  void *v2;
  void *v3;

  -[SMCloudKitZone zoneID](self, "zoneID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ownerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CKDatabase)privateDatabase
{
  void *v2;
  void *v3;

  -[SMCloudKitZone container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDatabase *)v3;
}

- (CKDatabase)sharedDatabase
{
  void *v2;
  void *v3;

  -[SMCloudKitZone container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDatabase *)v3;
}

- (id)apsEnvironmentString
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  dispatch_time_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  objc_class *v33;
  id v34;
  id v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v38;
  _QWORD v39[8];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE buf[12];
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  _BYTE v51[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  __int128 v53;
  _QWORD v54[4];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)xpc_copy_entitlement_for_self();
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__26;
  v44 = __Block_byref_object_dispose__26;
  v45 = 0;
  if (v4)
  {
    v5 = _CFXPCCreateCFObjectFromXPCObject();
    v6 = (void *)v41[5];
    v41[5] = v5;

    v7 = (void *)v41[5];
    if (v7)
    {
      if (!objc_msgSend(v7, "compare:options:", *MEMORY[0x1E0C94968], 1))
      {
        *(_QWORD *)v51 = 0;
        *(_QWORD *)&v51[8] = v51;
        *(_QWORD *)&v51[16] = 0x3032000000;
        v52 = __Block_byref_object_copy__26;
        *(_QWORD *)&v53 = __Block_byref_object_dispose__26;
        *((_QWORD *)&v53 + 1) = dispatch_semaphore_create(0);
        -[SMCloudKitZone container](self, "container");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __38__SMCloudKitZone_apsEnvironmentString__block_invoke;
        v39[3] = &unk_1E929A2F0;
        v39[4] = self;
        v39[5] = &v40;
        v39[6] = v51;
        v39[7] = a2;
        objc_msgSend(v8, "serverPreferredPushEnvironmentWithCompletionHandler:", v39);

        v9 = *(id *)(*(_QWORD *)&v51[8] + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v9, v11))
          goto LABEL_9;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceDate:", v10);
        v13 = v12;
        v14 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v20 = (void *)MEMORY[0x1E0CB35C8];
        v54[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v54, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v23 = objc_retainAutorelease(v22);

        }
        else
        {
LABEL_9:
          v23 = 0;
        }

        v24 = v23;
        if (v24)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v28 = (id)objc_claimAutoreleasedReturnValue();
            -[SMCloudKitZone zoneName](self, "zoneName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v27;
            v47 = 2112;
            v48 = v28;
            v49 = 2112;
            v50 = v29;
            _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Timeout getting server preferred push environment", buf, 0x20u);

          }
        }
        _Block_object_dispose(v51, 8);

      }
    }
  }
  v30 = (void *)v41[5];
  if (!v30)
    v30 = (void *)*MEMORY[0x1E0CFE130];
  v31 = v30;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneName](self, "zoneName");
    v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v51 = 138413058;
    *(_QWORD *)&v51[4] = v34;
    *(_WORD *)&v51[12] = 2112;
    *(_QWORD *)&v51[14] = v35;
    *(_WORD *)&v51[22] = 2112;
    v52 = v36;
    LOWORD(v53) = 2112;
    *(_QWORD *)((char *)&v53 + 2) = v31;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Using push environment %@", v51, 0x2Au);

  }
  _Block_object_dispose(&v40, 8);

  return v31;
}

void __38__SMCloudKitZone_apsEnvironmentString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Error getting server preferred push environment %@", (uint8_t *)&v15, 0x2Au);

    }
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

- (id)createPushConnection
{
  APSConnection *pushConnection;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  APSConnection *v9;
  APSConnection *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  pushConnection = self->_pushConnection;
  if (!pushConnection)
  {
    v5 = objc_alloc(MEMORY[0x1E0CFE148]);
    -[SMCloudKitZone apsEnvironmentString](self, "apsEnvironmentString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D8BB10];
    -[SMCloudKitZone queue](self, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (APSConnection *)objc_msgSend(v5, "initWithEnvironmentName:namedDelegatePort:queue:", v6, v7, v8);
    v10 = self->_pushConnection;
    self->_pushConnection = v9;

    -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
    pushConnection = self->_pushConnection;
    if (!pushConnection)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMCloudKitZone zoneName](self, "zoneName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412802;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Couldn't create push connection", (uint8_t *)&v17, 0x20u);

      }
      pushConnection = self->_pushConnection;
    }
  }
  return pushConnection;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneName](self, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413314;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Received public token \"%@\" on connection %@", (uint8_t *)&v14, 0x34u);

  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneName](self, "zoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413826;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@", (uint8_t *)&v20, 0x48u);

  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneName](self, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413314;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@,\nAPS Push received: %@ %@", (uint8_t *)&v21, 0x34u);

  }
  objc_msgSend(v8, "subscriptionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitZone zoneSubscriptionID](self, "zoneSubscriptionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v17)
  {
    -[SMCloudKitZone zoneUpdateHandler](self, "zoneUpdateHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[SMCloudKitZone zoneUpdateHandler](self, "zoneUpdateHandler");
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[SMCloudKitZone zoneName](self, "zoneName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v19)[2](v19, v20);

    }
  }

}

- (void)registerForZoneUpdatesWithHandler:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB34D0];
  v6 = a3;
  objc_msgSend(v5, "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "executablePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SMCloudKitZone createPushConnection](self, "createPushConnection");
  v26[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[APSConnection _setOpportunisticTopics:](self->_pushConnection, "_setOpportunisticTopics:", v14);

  -[SMCloudKitZone setZoneUpdateHandler:](self, "setZoneUpdateHandler:", v6);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone zoneName](self, "zoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@", (uint8_t *)&v20, 0x20u);

  }
}

- (void)deregisterForZoneUpdates
{
  APSConnection *pushConnection;
  APSConnection *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    -[APSConnection _setOpportunisticTopics:](pushConnection, "_setOpportunisticTopics:", 0);
    -[APSConnection shutdown](self->_pushConnection, "shutdown");
    v5 = self->_pushConnection;
    self->_pushConnection = 0;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMCloudKitZone zoneName](self, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,APSConnectionDelegate,%@,%@,zone,%@", (uint8_t *)&v11, 0x20u);

    }
  }
  -[SMCloudKitZone setZoneUpdateHandler:](self, "setZoneUpdateHandler:", 0);
}

- (NSDictionary)invitationTokenMap
{
  return self->_invitationTokenMap;
}

- (void)setInvitationTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_invitationTokenMap, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (id)zoneUpdateHandler
{
  return self->_zoneUpdateHandler;
}

- (void)setZoneUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong(&self->_zoneUpdateHandler, 0);
  objc_storeStrong((id *)&self->_share, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invitationTokenMap, 0);
}

@end
