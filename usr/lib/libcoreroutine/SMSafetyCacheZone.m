@implementation SMSafetyCacheZone

- (SMSafetyCacheZone)initWithSessionID:(id)a3 token:(id)a4 defaultsManager:(id)a5 queue:(id)a6
{
  return -[SMSafetyCacheZone initWithSessionID:ownerName:token:defaultsManager:queue:](self, "initWithSessionID:ownerName:token:defaultsManager:queue:", a3, *MEMORY[0x1E0C94730], a4, a5, a6);
}

- (SMSafetyCacheZone)initWithSessionID:(id)a3 ownerName:(id)a4 token:(id)a5 defaultsManager:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  SMSafetyCacheZone *v27;
  id *p_isa;
  SMSafetyCacheZone *v29;
  const char *v30;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sessionID";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_19;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: ownerName";
    goto LABEL_18;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: token";
    goto LABEL_18;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: queue";
      goto LABEL_18;
    }
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v32 = v16;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v35 = v13;
    v36 = 2112;
    v37 = v21;
    v38 = 2112;
    v39 = v22;
    v40 = 2112;
    v41 = v14;
    _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,ownerName,%@", buf, 0x2Au);

    v16 = v32;
  }

  v23 = objc_alloc(MEMORY[0x1E0C95098]);
  objc_msgSend(v13, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "initWithZoneName:ownerName:", v24, v14);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v25);
  v33.receiver = self;
  v33.super_class = (Class)SMSafetyCacheZone;
  v27 = -[SMCloudKitZone initWithZone:queue:](&v33, sel_initWithZone_queue_, v26, v18);
  p_isa = (id *)&v27->super.super.isa;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_token, a5);
    objc_storeStrong(p_isa + 8, a6);
  }
  self = p_isa;

  v29 = self;
LABEL_20:

  return v29;
}

- (void)setupZoneAndShareWithConversation:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  id v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t *v42;
  uint8_t *v43;
  SEL v44;
  uint8_t v45[16];
  uint8_t v46[8];
  uint8_t *v47;
  uint64_t v48;
  os_signpost_id_t v49;
  _QWORD v50[4];
  id v51;
  _BYTE *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint8_t *v59;
  SEL v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[3];
  char v64;
  _QWORD v65[3];
  int v66;
  uint8_t v67[8];
  uint8_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE buf[24];
  os_signpost_id_t v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v38 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v67 = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", v67, 2u);
    }
    goto LABEL_19;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v67 = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", v67, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  *(_QWORD *)v67 = 0;
  v68 = v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__114;
  v71 = __Block_byref_object_dispose__114;
  v72 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 2;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 1;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__114;
  v61[4] = __Block_byref_object_dispose__114;
  v62 = 0;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke;
  v53[3] = &unk_1E92A2510;
  v57 = v63;
  v58 = v61;
  v56 = v65;
  v53[4] = self;
  v59 = v67;
  v60 = a2;
  v13 = v10;
  v54 = v13;
  v55 = v12;
  v36 = (void *)MEMORY[0x1D8232094](v53);
  -[SMSafetyCacheZone defaultsManager](self, "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("RTDefaultsSafetyCacheCloudKitZoneTTL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v15 = &unk_1E9328C28;
  -[SMCloudKitZone zone](self, "zone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExpirationAfterTimeInterval:", v15);
  v37 = v15;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    -[SMCloudKitZone zoneID](self, "zoneID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "zoneName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    v74 = (os_signpost_id_t)v22;
    v75 = 2112;
    v76 = v37;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,zone TTL set to %@ seconds", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v74 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);

  v74 = v24;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v46 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "SMInitializationSequenceSetupZoneAndShareSaveZone", " enableTelemetry=YES ", v46, 2u);
  }

  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_21;
  v50[3] = &unk_1E92A2538;
  v52 = buf;
  v28 = v36;
  v51 = v28;
  -[SMSafetyCacheZone saveZoneToDatabaseWithRetryCount:qos:completion:](self, "saveZoneToDatabaseWithRetryCount:qos:completion:", 2, v13, v50);
  *(_QWORD *)v46 = 0;
  v47 = v46;
  v48 = 0x2020000000;
  v49 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_signpost_id_generate(v29);

  v49 = v30;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  v33 = *((_QWORD *)v47 + 3);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SMInitializationSequenceSetupZoneAndShareFetchParticipants", " enableTelemetry=YES ", v45, 2u);
  }

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_22;
  v39[3] = &unk_1E92A2560;
  v42 = v46;
  v43 = v67;
  v39[4] = self;
  v44 = a2;
  v40 = v9;
  v34 = v28;
  v41 = v34;
  -[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:](self, "fetchShareParticipantsWithRetryCount:conversation:qos:completion:", 2, v40, v13, v39);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

LABEL_20:
}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE *v29;
  char v30;
  uint8_t v31[16];
  _BYTE buf[24];
  os_signpost_id_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = a2;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 88));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 138413826;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v33 = (os_signpost_id_t)v15;
    v34 = 1024;
    v35 = a2;
    v36 = 2112;
    v37 = v7;
    v38 = 1024;
    v39 = v16;
    v40 = 1024;
    v41 = v17;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", buf, 0x3Cu);

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v33 = 0;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_signpost_id_generate(v18);

      v33 = v19;
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)v31 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1A22000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "SMInitializationSequenceSetupZoneAndShareCreateRecordsWithParticipants", " enableTelemetry=YES ", v31, 2u);
      }

      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v24 = *(void **)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_16;
      v26[3] = &unk_1E92A24E8;
      v29 = buf;
      v30 = a2;
      v27 = v7;
      v28 = *(id *)(a1 + 48);
      objc_msgSend(v24, "createRecordsWithParticipants:qos:completion:", v23, v25, v26);

      _Block_object_dispose(buf, 8);
    }
  }

}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");
    v11 = objc_msgSend(*(id *)(a1 + 32), "code");
    v12 = 134349570;
    v13 = v8;
    v14 = 2082;
    v15 = v10;
    v16 = 2050;
    v17 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMInitializationSequenceSetupZoneAndShareCreateRecordsWithParticipants", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v12, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_21(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    objc_msgSend(v5, "domain");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = 134349570;
    v11 = a2;
    v12 = 2082;
    v13 = objc_msgSend(v9, "UTF8String");
    v14 = 2050;
    v15 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMInitializationSequenceSetupZoneAndShareSaveZone", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__SMSafetyCacheZone_setupZoneAndShareWithConversation_qos_completion___block_invoke_22(uint64_t a1, void *a2, unsigned int a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_msgSend(v9, "domain");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 134349570;
    v23 = a3;
    v24 = 2082;
    v25 = objc_msgSend(v13, "UTF8String");
    v26 = 2050;
    v27 = objc_msgSend(v9, "code");
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMInitializationSequenceSetupZoneAndShareFetchParticipants", " enableTelemetry=YES {success:%{public, signpost.telemetry:number1}ld, errorDomain:%{public, signpost.telemetry:string1}s, errorCode:%{public, signpost.telemetry:number2}ld}", buf, 0x20u);

  }
  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 72));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "receiverPrimaryHandles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v23 = (unint64_t)v15;
      v24 = 2112;
      v25 = (uint64_t)v17;
      v26 = 2112;
      v27 = (uint64_t)v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully identified participants %@ for zoneID %@", buf, 0x34u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)saveZoneToDatabaseWithRetryCount:(int64_t)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;
  int64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (a3 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SMSafetyCacheZone saveZoneToDatabaseWithRetryCount:qos:completion:]";
      v21 = 1024;
      v22 = 188;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pendingRetryCount >= 0 (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_3;
  }
  else if (v9)
  {
LABEL_3:
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SMSafetyCacheZone_saveZoneToDatabaseWithRetryCount_qos_completion___block_invoke;
    v14[3] = &unk_1E92A2588;
    v14[4] = self;
    v17 = a2;
    v16 = v10;
    v18 = a3;
    v15 = v9;
    -[SMCloudKitZone saveZoneToDatabase:qos:withCompletion:](self, "saveZoneToDatabase:qos:withCompletion:", v11, v15, v14);

    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: qosOptions", buf, 2u);
  }

LABEL_10:
}

void __69__SMSafetyCacheZone_saveZoneToDatabaseWithRetryCount_qos_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  const char *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_class *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEFAULT, "#SafetyCache,%@,%@,zone saved successfully for zoneID %@", (uint8_t *)&v23, 0x20u);

    }
    goto LABEL_13;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v4))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_14;
    }
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v4;
    v16 = "#SafetyCache,%@,%@,failed to save zone with zoneID %@ with non recoverable error %@";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, 0x2Au);

    goto LABEL_13;
  }
  v5 = *(_QWORD *)(a1 + 64);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5 <= 0)
  {
    if (!v7)
      goto LABEL_13;
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138413058;
    v24 = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v4;
    v16 = "#SafetyCache,%@,%@,failed to save zone with zoneID %@  after retries with recoverable error %@";
    goto LABEL_16;
  }
  if (v7)
  {
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 64);
    v23 = 138413314;
    v24 = v18;
    v25 = 2112;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v4;
    v31 = 1024;
    v32 = v21;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@  with recoverable error %@, pendingRetryCount %d, retrying...", (uint8_t *)&v23, 0x30u);

  }
  objc_msgSend(*(id *)(a1 + 32), "saveZoneToDatabaseWithRetryCount:qos:completion:", *(_QWORD *)(a1 + 64) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_14:

}

- (void)fetchShareParticipantsWithRetryCount:(int64_t)a3 conversation:(id)a4 qos:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  SEL v24;
  int64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3 < 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
      v28 = 1024;
      v29 = 228;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pendingRetryCount >= 0 (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  else if (v11)
  {
    goto LABEL_3;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
    v28 = 1024;
    v29 = 229;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v12)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SMSafetyCacheZone fetchShareParticipantsWithRetryCount:conversation:qos:completion:]";
      v28 = 1024;
      v29 = 230;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: qosOptions (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86__SMSafetyCacheZone_fetchShareParticipantsWithRetryCount_conversation_qos_completion___block_invoke;
  v20[3] = &unk_1E92A25B0;
  v20[4] = self;
  v21 = v11;
  v24 = a2;
  v25 = a3;
  v22 = v12;
  v23 = v13;
  v17 = v12;
  v18 = v13;
  v19 = v11;
  -[SMCloudKitZone fetchShareParticipantsWithConversation:qos:completion:](self, "fetchShareParticipantsWithConversation:qos:completion:", v19, v17, v20);

}

void __86__SMSafetyCacheZone_fetchShareParticipantsWithRetryCount_conversation_qos_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (*v16)(void);
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_class *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v31 = v7;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "receiverPrimaryHandles");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v33 = v10;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v13;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v15;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,successfully identified participants %@ for zoneID %@", buf, 0x34u);

      v7 = v31;
    }

    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  if (!+[SMCloudKitZone shouldRetryCkError:](SMCloudKitZone, "shouldRetryCkError:", v7))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_14:
      v16();
      goto LABEL_15;
    }
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v7;
    v24 = "#SafetyCache,%@,%@,failed to fetch share participant with zoneID %@ with non recoverable error %@";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v24, buf, 0x2Au);

    goto LABEL_13;
  }
  v17 = *(_QWORD *)(a1 + 72);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  if (v17 <= 0)
  {
    if (!v19)
      goto LABEL_13;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v33 = v21;
    v34 = 2112;
    v35 = v22;
    v36 = 2112;
    v37 = v23;
    v38 = 2112;
    v39 = v7;
    v24 = "#SafetyCache,%@,%@,failed to fetch share participant with zoneID %@  after retries with recoverable error %@";
    goto LABEL_17;
  }
  if (v19)
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138413314;
    v33 = v26;
    v34 = 2112;
    v35 = v27;
    v36 = 2112;
    v37 = v28;
    v38 = 2112;
    v39 = v7;
    v40 = 1024;
    LODWORD(v41) = v29;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to save zone with zoneID %@  with recoverable error %@, pendingRetryCount %d, retrying...", buf, 0x30u);

  }
  objc_msgSend(*(id *)(a1 + 32), "fetchShareParticipantsWithRetryCount:conversation:qos:completion:", *(_QWORD *)(a1 + 72) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_15:

}

- (void)createRecordsWithParticipants:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void (**v53)(_QWORD, _QWORD, _QWORD);
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[5];
  id v64;
  id v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  SEL v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _QWORD v73[3];
  uint64_t v74;
  const __CFString *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: fetchedParticipantsToHandlesMap";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
    goto LABEL_28;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: qos";
    goto LABEL_25;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v47 = "Invalid parameter not satisfying: completion";
    goto LABEL_25;
  }
  v53 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  v11 = objc_alloc(MEMORY[0x1E0C95048]);
  -[SMSafetyCacheZone safetyCacheRecordID](self, "safetyCacheRecordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRecordType:recordID:", CFSTR("SafetyCacheRecord"), v12);
  -[SMSafetyCacheZone setSafetyCacheRecord:](self, "setSafetyCacheRecord:", v13);

  v14 = objc_alloc(MEMORY[0x1E0C95048]);
  -[SMSafetyCacheZone accessDataRecordID](self, "accessDataRecordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithRecordType:recordID:", CFSTR("AccessDataRecord"), v15);

  v72 = v16;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 7200.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSafetyCacheZone updateAccessDataRecord:cacheReleaseTime:](self, "updateAccessDataRecord:cacheReleaseTime:", &v72, v17);
  v18 = v72;

  v52 = v18;
  -[SMSafetyCacheZone setAccessDataRecord:](self, "setAccessDataRecord:", v18);
  v19 = objc_alloc(MEMORY[0x1E0C95110]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithRecordZoneID:", v20);
  -[SMCloudKitZone setShare:](self, "setShare:", v21);

  v54 = v7;
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v69;
    v57 = v22;
    v56 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v69 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[SMCloudKitZone zoneID](self, "zoneID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "zoneName");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "userIdentity");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v24;
          v33 = objc_msgSend(v61, "hasiCloudAccount");
          objc_msgSend(v27, "userIdentity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "publicSharingKey");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v77 = v60;
          v78 = 2112;
          v79 = v30;
          v80 = 2112;
          v81 = v31;
          v82 = 1024;
          v83 = v33;
          v24 = v32;
          v84 = 2112;
          v85 = v35;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,share participant,hasiCloudAccount,%d,publicSharingKey,%@", buf, 0x30u);

          v25 = v56;
          v22 = v57;

        }
        objc_msgSend(v27, "userIdentity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v36, "hasiCloudAccount") & 1) != 0)
        {
          objc_msgSend(v27, "userIdentity");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "publicSharingKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
          {
            objc_msgSend(v27, "setPermission:", 2);
            -[SMCloudKitZone share](self, "share");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "addParticipant:", v27);

            objc_msgSend(v55, "addObject:", v27);
          }
        }
        else
        {

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
    }
    while (v24);
  }

  v40 = v55;
  if (objc_msgSend(v55, "count"))
  {
    -[SMSafetyCacheZone safetyCacheRecord](self, "safetyCacheRecord");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v41;
    -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v42;
    -[SMCloudKitZone share](self, "share");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke;
    v63[3] = &unk_1E92A2600;
    v63[4] = self;
    v67 = a2;
    v10 = v53;
    v66 = v53;
    v64 = v22;
    v65 = v55;
    -[SMCloudKitZone saveRecordsWithRetry:records:toDatabase:qos:withCompletion:](self, "saveRecordsWithRetry:records:toDatabase:qos:withCompletion:", 2, v44, v45, v8, v63);

    v40 = v55;
  }
  else
  {
    v48 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0D8BB70];
    v74 = *MEMORY[0x1E0CB2D50];
    v75 = CFSTR("All receivers have Manatee/iCloud services disabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, 44, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v53;
    ((void (**)(_QWORD, _QWORD, void *))v53)[2](v53, 0, v51);

  }
  v7 = v54;
  v46 = v52;
LABEL_28:

}

void __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  id v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _BYTE *v46;
  uint64_t *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  const __CFString *v58;
  uint8_t v59[128];
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v42 = v5;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID", v41);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "zoneName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v61 = v40;
      LOWORD(v62) = 2112;
      *(_QWORD *)((char *)&v62 + 2) = v5;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID", v41);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "zoneName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v12 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v61 = v12;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,all records saved successfully", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v61 = __Block_byref_object_copy__114;
    *(_QWORD *)&v62 = __Block_byref_object_dispose__114;
    *((_QWORD *)&v62 + 1) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v53 = 0;
    v54 = &v53;
    v55 = 0x2020000000;
    v56 = 0;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v13 = v41;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v50 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v17, "recordID", v41);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "safetyCacheRecordID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (v20)
          {
            objc_msgSend(*(id *)(a1 + 32), "setSafetyCacheRecord:", v17);
          }
          else
          {
            objc_msgSend(v17, "recordID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "accessDataRecordID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqual:", v22);

            if (v23)
            {
              objc_msgSend(*(id *)(a1 + 32), "setAccessDataRecord:", v17);
            }
            else
            {
              objc_msgSend(v17, "recordID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "share");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "recordID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v24, "isEqual:", v26);

              if (v27)
              {
                objc_msgSend(*(id *)(a1 + 32), "setShare:", v17);
                objc_msgSend(*(id *)(a1 + 32), "share");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "participants");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v43[0] = MEMORY[0x1E0C809B0];
                v43[1] = 3221225472;
                v43[2] = __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke_35;
                v43[3] = &unk_1E92A25D8;
                v30 = *(_QWORD *)(a1 + 64);
                v43[4] = *(_QWORD *)(a1 + 32);
                v48 = v30;
                v44 = *(id *)(a1 + 48);
                v45 = *(id *)(a1 + 40);
                v46 = buf;
                v47 = &v53;
                objc_msgSend(v29, "enumerateObjectsUsingBlock:", v43);

              }
            }
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v14);
    }

    if (*((_BYTE *)v54 + 24))
    {
      v31 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
      objc_msgSend(*(id *)(a1 + 32), "setInvitationTokenMap:", v31);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v32 = *(_QWORD *)(a1 + 56);
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v57 = *MEMORY[0x1E0CB2D50];
      v58 = CFSTR("None of the zone share participants have valid invitation tokens");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 45, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v35);

    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __66__SMSafetyCacheZone_createRecordsWithParticipants_qos_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "zoneName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invitationToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v3, "invitationTokenStatus");
    objc_msgSend(v3, "invitationToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sharingInvitationData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413826;
    v28 = v17;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2112;
    v36 = v22;
    v37 = 2048;
    v38 = v25;
    v39 = 2112;
    v40 = v24;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "#SafetyCache,Initiator,sessionID:%@,%@,%@,share participant ID,%@,invitation token,%@,invitation status,%ld,invitation data,%@", buf, 0x48u);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3))
  {
    v5 = objc_alloc(MEMORY[0x1E0C94CE0]);
    objc_msgSend(v3, "invitationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharingInvitationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "share");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invitationToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "participantID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithSharingInvitationData:shareURL:participantID:", v7, v9, v11);

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v13, "primaryHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v15);

    objc_msgSend(v3, "invitationToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v16 != 0;

  }
}

- (void)updateSafetyCacheWithData:(id)a3 cacheReleaseTime:(id)a4 qos:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, int, void *);
  void *v22;
  SMSafetyCacheZone *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint8_t *v27;
  SEL v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];
  char v36;
  _QWORD v37[3];
  int v38;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: safetyCacheData";
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
    goto LABEL_7;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v18 = "Invalid parameter not satisfying: completion";
    goto LABEL_10;
  }
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 2;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 1;
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__114;
  v33 = __Block_byref_object_dispose__114;
  v34 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __79__SMSafetyCacheZone_updateSafetyCacheWithData_cacheReleaseTime_qos_completion___block_invoke;
  v22 = &unk_1E92A2628;
  v26 = v35;
  v27 = buf;
  v25 = v37;
  v23 = self;
  v28 = a2;
  v24 = v14;
  v16 = (void *)MEMORY[0x1D8232094](&v19);
  -[SMSafetyCacheZone updateSafetyCacheRecordWithData:qos:completion:](self, "updateSafetyCacheRecordWithData:qos:completion:", v11, v13, v16, v19, v20, v21, v22, v23);
  -[SMSafetyCacheZone updateAccessDataRecordWithCacheReleaseTime:qos:completion:](self, "updateAccessDataRecordWithCacheReleaseTime:qos:completion:", v12, v13, v16);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
LABEL_8:

}

void __79__SMSafetyCacheZone_updateSafetyCacheWithData_cacheReleaseTime_qos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = a2;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v18 = 138413826;
    v19 = v12;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 1024;
    v25 = a2;
    v26 = 2112;
    v27 = v7;
    v28 = 1024;
    v29 = v16;
    v30 = 1024;
    v31 = v17;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", (uint8_t *)&v18, 0x3Cu);

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSafetyCacheRecordsWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int, void *);
  void *v15;
  SMSafetyCacheZone *v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  uint8_t *v20;
  SEL v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];
  char v29;
  _QWORD v30[3];
  int v31;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v31 = 2;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v29 = 1;
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__114;
    v26 = __Block_byref_object_dispose__114;
    v27 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __63__SMSafetyCacheZone_fetchSafetyCacheRecordsWithQos_completion___block_invoke;
    v15 = &unk_1E92A2628;
    v19 = v28;
    v20 = buf;
    v18 = v30;
    v16 = self;
    v21 = a2;
    v17 = v8;
    v10 = (void *)MEMORY[0x1D8232094](&v12);
    -[SMSafetyCacheZone fetchSafetyCacheRecordWithQos:completion:](self, "fetchSafetyCacheRecordWithQos:completion:", v7, v10, v12, v13, v14, v15, v16);
    -[SMSafetyCacheZone fetchAccessDataRecordWithQos:completion:](self, "fetchAccessDataRecordWithQos:completion:", v7, v10);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __63__SMSafetyCacheZone_fetchSafetyCacheRecordsWithQos_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  --*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = a2;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v17 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v18 = 138413826;
    v19 = v12;
    v20 = 2112;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    v24 = 1024;
    v25 = a2;
    v26 = 2112;
    v27 = v7;
    v28 = 1024;
    v29 = v16;
    v30 = 1024;
    v31 = v17;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,result returned,%d,error,%@,pending results,%d,combined result,%d", (uint8_t *)&v18, 0x3Cu);

  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (CKRecordID)safetyCacheRecordID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", CFSTR("SafetyCache"), v4);

  return (CKRecordID *)v5;
}

- (void)updateSafetyCacheRecordWithData:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  _QWORD v18[5];
  id v19;
  SEL v20;
  _QWORD v21[4];
  NSObject *v22;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: safetyCacheData";
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_7;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: completion";
    goto LABEL_9;
  }
  -[SMSafetyCacheZone safetyCacheRecordID](self, "safetyCacheRecordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMCloudKitZone privateDatabase](self, "privateDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke;
  v21[3] = &unk_1E92A2650;
  v22 = v9;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke_43;
  v18[3] = &unk_1E929A250;
  v18[4] = self;
  v20 = a2;
  v19 = v12;
  -[SMCloudKitZone updateRecord:inDatabase:qos:usingBlock:withCompletion:](self, "updateRecord:inDatabase:qos:usingBlock:withCompletion:", v13, v14, v10, v21, v18);

  v16 = v22;
LABEL_7:

}

void __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*a2, "encryptedValues");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("PhoneSafetyCacheEncryptedData"));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", buf, 2u);
    }

  }
}

void __68__SMSafetyCacheZone_updateSafetyCacheRecordWithData_qos_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSafetyCacheRecord:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSafetyCacheRecordWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[SMSafetyCacheZone safetyCacheRecordID](self, "safetyCacheRecordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__SMSafetyCacheZone_fetchSafetyCacheRecordWithQos_completion___block_invoke;
    v12[3] = &unk_1E929A250;
    v12[4] = self;
    v14 = a2;
    v13 = v8;
    -[SMCloudKitZone fetchRecord:fromDatabase:qos:withCompletion:](self, "fetchRecord:fromDatabase:qos:withCompletion:", v9, v10, v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __62__SMSafetyCacheZone_fetchSafetyCacheRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setSafetyCacheRecord:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSData)phoneSafetyCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SMSafetyCacheZone safetyCacheRecord](self, "safetyCacheRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSafetyCacheZone safetyCacheRecord](self, "safetyCacheRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PhoneSafetyCacheEncryptedData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSData *)v6;
}

- (NSData)watchSafetyCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SMSafetyCacheZone safetyCacheRecord](self, "safetyCacheRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSafetyCacheZone safetyCacheRecord](self, "safetyCacheRecord");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WatchSafetyCacheEncryptedData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSData *)v6;
}

- (CKRecordID)accessDataRecordID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[SMCloudKitZone zoneID](self, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", CFSTR("AccessData"), v4);

  return (CKRecordID *)v5;
}

- (void)updateAccessDataRecordWithCacheReleaseTime:(id)a3 qos:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    -[SMSafetyCacheZone accessDataRecordID](self, "accessDataRecordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke;
    v19[3] = &unk_1E92A2678;
    v19[4] = self;
    v20 = v9;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke_45;
    v16[3] = &unk_1E929A250;
    v16[4] = self;
    v18 = a2;
    v17 = v11;
    -[SMCloudKitZone updateRecord:inDatabase:qos:usingBlock:withCompletion:](self, "updateRecord:inDatabase:qos:usingBlock:withCompletion:", v12, v13, v10, v19, v16);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateAccessDataRecord:cacheReleaseTime:", a2, *(_QWORD *)(a1 + 40));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: recordPointer", v3, 2u);
    }

  }
}

void __79__SMSafetyCacheZone_updateAccessDataRecordWithCacheReleaseTime_qos_completion___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,saved successfully", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setAccessDataRecord:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchAccessDataRecordWithQos:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    -[SMSafetyCacheZone accessDataRecordID](self, "accessDataRecordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMCloudKitZone privateDatabase](self, "privateDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__SMSafetyCacheZone_fetchAccessDataRecordWithQos_completion___block_invoke;
    v12[3] = &unk_1E929A250;
    v12[4] = self;
    v14 = a2;
    v13 = v8;
    -[SMCloudKitZone fetchRecord:fromDatabase:qos:withCompletion:](self, "fetchRecord:fromDatabase:qos:withCompletion:", v9, v10, v7, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion", buf, 2u);
    }

  }
}

void __61__SMSafetyCacheZone_fetchAccessDataRecordWithQos_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "zoneName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v6;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "#SafetyCache,Initiator,sessionID:%@,%@,%@,failed with error %@", (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "zoneID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "zoneName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetched successfully", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setAccessDataRecord:", v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateAccessDataRecord:(id *)a3 cacheReleaseTime:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[SMSafetyCacheZone token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v6, CFSTR("Token"));

  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v7, CFSTR("CacheReleaseTime"));
}

- (NSData)allowReadToken
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Token"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithBase64EncodedString:options:", v9, 0);

  }
  else
  {
LABEL_4:
    v10 = 0;
  }
  return (NSData *)v10;
}

- (NSDate)releaseTime
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CacheReleaseTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SMSafetyCacheZone accessDataRecord](self, "accessDataRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CacheReleaseTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v8;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (CKRecord)safetyCacheRecord
{
  return self->_safetyCacheRecord;
}

- (void)setSafetyCacheRecord:(id)a3
{
  objc_storeStrong((id *)&self->_safetyCacheRecord, a3);
}

- (CKRecord)accessDataRecord
{
  return self->_accessDataRecord;
}

- (void)setAccessDataRecord:(id)a3
{
  objc_storeStrong((id *)&self->_accessDataRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessDataRecord, 0);
  objc_storeStrong((id *)&self->_safetyCacheRecord, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
