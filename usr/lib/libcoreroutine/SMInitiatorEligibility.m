@implementation SMInitiatorEligibility

+ (void)checkInitiatorEligibilityWithQueue:(id)a3 authorizationManager:(id)a4 effectivePairedDevice:(id)a5 isHandoff:(BOOL)a6 defaultsManager:(id)a7 platform:(id)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  uint8_t buf[16];
  _BYTE v48[24];
  os_signpost_id_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315394;
      *(_QWORD *)&v48[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:handler:]";
      *(_WORD *)&v48[12] = 1024;
      *(_DWORD *)&v48[14] = 61;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", v48, 0x12u);
    }

  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315394;
      *(_QWORD *)&v48[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:handler:]";
      *(_WORD *)&v48[12] = 1024;
      *(_DWORD *)&v48[14] = 62;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager (in %s:%d)", v48, 0x12u);
    }

  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v48 = 136315394;
      *(_QWORD *)&v48[4] = "+[SMInitiatorEligibility checkInitiatorEligibilityWithQueue:authorizationManager:effectivePai"
                           "redDevice:isHandoff:defaultsManager:platform:handler:]";
      *(_WORD *)&v48[12] = 1024;
      *(_DWORD *)&v48[14] = 63;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v48, 0x12u);
    }

  }
  *(_QWORD *)v48 = 0;
  *(_QWORD *)&v48[8] = v48;
  *(_QWORD *)&v48[16] = 0x2020000000;
  v49 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);

  v49 = v24;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = *(_QWORD *)(*(_QWORD *)&v48[8] + 24);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "SMCheckInitiatorEligibility", " enableTelemetry=YES ", buf, 2u);
  }

  v28 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke;
  v44[3] = &unk_1E92A0770;
  v45 = v19;
  v46 = v48;
  v29 = v19;
  block[0] = v28;
  block[1] = 3221225472;
  block[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_26;
  block[3] = &unk_1E92A07E8;
  v37 = v15;
  v38 = v14;
  v43 = a6;
  v39 = v16;
  v40 = v17;
  v41 = v18;
  v42 = (id)MEMORY[0x1D8232094](v44);
  v30 = v18;
  v31 = v17;
  v32 = v16;
  v33 = v14;
  v34 = v15;
  v35 = v42;
  dispatch_async(v33, block);

  _Block_object_dispose(v48, 8);
}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  _BOOL8 v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = 134349312;
    v10 = a2 == 1;
    v11 = 2050;
    v12 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_1D1A22000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMCheckInitiatorEligibility", " enableTelemetry=YES {initiatorEligibility:error:%{public,signpost.telemetry:number1}ld, error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void (*v13)(void);
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[4];
  NSObject *v18;
  id v19;
  _QWORD *v20;
  uint8_t buf[16];
  _QWORD v22[4];
  NSObject *v23;
  NSObject *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;

  if (!+[SMInitiatorEligibility checkDevicePlatformEnabled](SMInitiatorEligibility, "checkDevicePlatformEnabled"))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
LABEL_10:
    v13();
    return;
  }
  if (!+[SMInitiatorEligibility checkLocationServicesEnabledWithAuthorizationManager:](SMInitiatorEligibility, "checkLocationServicesEnabledWithAuthorizationManager:", *(_QWORD *)(a1 + 32)))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_10;
  }
  if (!+[SMInitiatorEligibility checkRegulatoryDomainPassedWithQueue:](SMInitiatorEligibility, "checkRegulatoryDomainPassedWithQueue:", *(_QWORD *)(a1 + 40)))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 72) + 16);
    goto LABEL_10;
  }
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_2;
  v39[3] = &unk_1E92A0798;
  v42 = v43;
  v41 = *(id *)(a1 + 72);
  v5 = v2;
  v40 = v5;
  +[SMInitiatorEligibility checkNetworkReachabilityWithQueue:handler:](SMInitiatorEligibility, "checkNetworkReachabilityWithQueue:handler:", v3, v39);
  dispatch_group_enter(v5);
  v6 = *(_QWORD *)(a1 + 40);
  v35[0] = v4;
  v35[1] = 3221225472;
  v35[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_32;
  v35[3] = &unk_1E92A0798;
  v38 = v43;
  v37 = *(id *)(a1 + 72);
  v7 = v5;
  v36 = v7;
  +[SMInitiatorEligibility checkIMessageAccountEnabledWithQueue:handler:](SMInitiatorEligibility, "checkIMessageAccountEnabledWithQueue:handler:", v6, v35);
  dispatch_group_enter(v7);
  v8 = *(_QWORD *)(a1 + 40);
  v31[0] = v4;
  v31[1] = 3221225472;
  v31[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_33;
  v31[3] = &unk_1E92A0798;
  v34 = v43;
  v33 = *(id *)(a1 + 72);
  v9 = v7;
  v32 = v9;
  +[SMInitiatorEligibility checkLocationAuthorizationWithQueue:handler:](SMInitiatorEligibility, "checkLocationAuthorizationWithQueue:handler:", v8, v31);
  dispatch_group_enter(v9);
  v10 = *(_QWORD *)(a1 + 40);
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_34;
  v27[3] = &unk_1E92A0798;
  v30 = v43;
  v29 = *(id *)(a1 + 72);
  v11 = v9;
  v28 = v11;
  +[SMInitiatorEligibility checkManateeEnabledWithQueue:handler:](SMInitiatorEligibility, "checkManateeEnabledWithQueue:handler:", v10, v27);
  if (+[SMInitiatorEligibility shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:isHandoff:defaultsManager:](SMInitiatorEligibility, "shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:isHandoff:defaultsManager:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56)))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "Initiator Eligibility, skipping cellular eligibility checks", buf, 2u);
    }
  }
  else
  {
    dispatch_group_enter(v11);
    v14 = *(_QWORD *)(a1 + 40);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_35;
    v22[3] = &unk_1E92A07C0;
    v26 = v43;
    v23 = *(id *)(a1 + 64);
    v25 = *(id *)(a1 + 72);
    v24 = v11;
    +[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:](SMInitiatorEligibility, "checkCellularEnabledWithQueue:handler:", v14, v22);

    v12 = v23;
  }

  v15 = *(NSObject **)(a1 + 40);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_36;
  block[3] = &unk_1E9297CA8;
  v18 = v11;
  v20 = v43;
  v19 = *(id *)(a1 + 72);
  v16 = v11;
  dispatch_group_notify(v16, v15, block);

  _Block_object_dispose(v43, 8);
}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check network reachability, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_32(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for iMessages account, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for system service, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_34(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check completed for Manatee, %@, error, %@", (uint8_t *)&v10, 0x16u);
  }

  if (v5)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (!*(_BYTE *)(v9 + 24))
    {
      *(_BYTE *)(v9 + 24) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_35(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  char v8;
  NSObject *v9;
  __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Initiator Eligibility, check cellular eligibility %@, error, %@", (uint8_t *)&v11, 0x16u);
  }

  if (v5)
    v8 = 0;
  else
    v8 = a2;
  if ((v8 & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    +[SMInitiatorEligibility cellularEligibilityFailureStatusForPlatform:](SMInitiatorEligibility, "cellularEligibilityFailureStatusForPlatform:", *(_QWORD *)(a1 + 32));
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      initiatorEligiblityStatusToString();
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Initiator Eligibility, cellular eligbility failure status: %@", (uint8_t *)&v11, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __147__SMInitiatorEligibility_checkInitiatorEligibilityWithQueue_authorizationManager_effectivePairedDevice_isHandoff_defaultsManager_platform_handler___block_invoke_36(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24))
  {
    v1 = result;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "Initiator Eligibility, all checks passed", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

+ (BOOL)shouldSkipCellularEligibilityCheckWithEffectivePairedDevice:(id)a3 isHandoff:(BOOL)a4 defaultsManager:(id)a5
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  uint8_t v11[16];

  v5 = a5;
  if (+[SMInitiatorEligibility checkIsInternalInstall](SMInitiatorEligibility, "checkIsInternalInstall")
    && (objc_msgSend(v5, "objectForKey:value:", CFSTR("SMDefaultsInitiatorEligibilitySkipCellularCheck"), MEMORY[0x1E0C9AAA0]), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "BOOLValue"), v6, v7))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Initiator Eligibility, skipping cellular eligibility check due to defaults", v11, 2u);
    }

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)checkDevicePlatformEnabled
{
  void *v2;
  BOOL v3;

  +[RTPlatform currentPlatform](RTPlatform, "currentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "iPhoneDevice") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D8B958], "zelkovaOnWatchEnabled")
    && (objc_msgSend(v2, "watchPlatform") & 1) != 0;

  return v3;
}

+ (BOOL)checkIsInternalInstall
{
  void *v2;
  char v3;

  +[RTPlatform currentPlatform](RTPlatform, "currentPlatform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "internalInstall");

  return v3;
}

+ (int64_t)cellularEligibilityFailureStatusForPlatform:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "watchPlatform"))
  {
    if (+[SMInitiatorEligibility deviceHasBaseband](SMInitiatorEligibility, "deviceHasBaseband"))
    {
      if (objc_msgSend(v3, "isTinkerPaired"))
        v4 = 5;
      else
        v4 = 12;
    }
    else
    {
      v4 = 11;
    }
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

+ (BOOL)deviceHasBaseband
{
  if (qword_1ED9429E8 != -1)
    dispatch_once(&qword_1ED9429E8, &__block_literal_global_73);
  return _MergedGlobals_102;
}

uint64_t __43__SMInitiatorEligibility_deviceHasBaseband__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _MergedGlobals_102 = result;
  return result;
}

+ (BOOL)checkLocationServicesEnabledWithAuthorizationManager:(id)a3
{
  return objc_msgSend(a3, "isLocationServicesEnabled");
}

+ (void)checkCellularEnabledWithQueue:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:]";
      v15 = 1024;
      v16 = 254;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__SMInitiatorEligibility_checkCellularEnabledWithQueue_handler___block_invoke;
  v10[3] = &unk_1E9297650;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v9, v10);

}

uint64_t __64__SMInitiatorEligibility_checkCellularEnabledWithQueue_handler___block_invoke(uint64_t a1)
{
  if (+[SMInitiatorEligibility checkHasSimWithQueue:](SMInitiatorEligibility, "checkHasSimWithQueue:", *(_QWORD *)(a1 + 32)))
  {
    +[SMInitiatorEligibility checkCellularDataEnabledWithQueue:](SMInitiatorEligibility, "checkCellularDataEnabledWithQueue:", *(_QWORD *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)checkHasSimWithQueue:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CA6E38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithQueue:", v4);

  v20 = 0;
  objc_msgSend(v5, "getCurrentDataSubscriptionContextSync:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = v7;
    v10 = 0;
  }
  else
  {
    v19 = 0;
    objc_msgSend(v5, "getSIMStatus:error:", v6, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    v9 = v12;
    v10 = 0;
    if (!v12 && v11)
    {
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CA77F8]) & 1) != 0)
      {
        v10 = 0;
        v9 = 0;
      }
      else
      {
        v18 = 0;
        objc_msgSend(v5, "getSimLabel:error:", v6, &v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v10 = 0;
        if (!v9 && v13)
        {
          objc_msgSend(v13, "unique_id");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v14, "isEqualToString:", CFSTR("00000000-0000-0000-0000-000000000000")) ^ 1;

        }
      }
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = CFSTR("NO");
    if (v10)
      v16 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v22 = v16;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "Initiator Eligibility, checking if SIM enabled, %@, error %@", buf, 0x16u);
  }

  return v10;
}

+ (BOOL)checkCellularDataEnabledWithQueue:(id)a3
{
  int IsEnabled;
  NSObject *v4;
  uint8_t buf[4];
  const __CFString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _CTServerConnectionCreateWithIdentifier();
  IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v7 = CFSTR("NO");
    v8 = 1024;
    v9 = IsEnabled;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Initiator Eligibility, checking if cellular data enabled, %@, error %d", buf, 0x12u);
  }

  return 0;
}

+ (BOOL)checkAirplaneModeEnabledWithQueue:(id)a3
{
  int CellularDataSettings;
  NSObject *v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _CTServerConnectionCreateWithIdentifier();
  CellularDataSettings = _CTServerConnectionGetCellularDataSettings();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v7 = "+[SMInitiatorEligibility checkAirplaneModeEnabledWithQueue:]";
    v8 = 1024;
    v9 = 0;
    v10 = 1024;
    v11 = CellularDataSettings;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s,Checking if Airplane Mode is enabled, %{Bool}d, error %d", buf, 0x18u);
  }

  return 0;
}

+ (BOOL)checkCellularWatchToggleEnabledWithQueue:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CFA9B8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithQueue:", v4);

  if (v5)
  {
    v10 = 0;
    v6 = objc_msgSend(v5, "telephonyStateWithBundleIdentifierOut:", &v10);
    v7 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, " radioPreferences: %@ isCellularEnabled toggle: %{BOOL}d", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)checkRegulatoryDomainPassedWithQueue:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  objc_class *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *context;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D842B0], "currentEstimates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v7;
      v56 = 2112;
      v57 = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, no current estimates found, falling back to last known estimates", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D842B0], "lastKnownEstimates");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v10 = objc_claimAutoreleasedReturnValue();
      v29 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v55 = v36;
        v56 = 2112;
        v57 = v37;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, no last known estimates found, returning success as default fallback behaviour", buf, 0x16u);

      }
      goto LABEL_29;
    }
    v4 = v9;
  }
  objc_msgSend((id)objc_opt_class(), "_getRegulatoryDomainCountryCodes");
  v10 = objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = v4;
  v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v39)
  {
    v11 = *(_QWORD *)v50;
    v41 = v9;
    v42 = v3;
    v40 = v10;
    v38 = *(_QWORD *)v50;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1D8231EA8]();
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v17 = v10;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "countryCode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v55 = v16;
          v56 = 2112;
          v57 = v18;
          v58 = 2112;
          v59 = v19;
          _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%@, %@, estimate's country code, %@", buf, 0x20u);

          v10 = v17;
        }

        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v20 = v10;
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v46;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v46 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v13, "countryCode");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isEqualToString:", v25);

              if (v28)
              {
                _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  v31 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v55 = v32;
                  v56 = 2112;
                  v57 = v33;
                  v58 = 2112;
                  v59 = v25;
                  _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, estimate's country code is equal to regulated country code, %@", buf, 0x20u);

                }
                objc_autoreleasePoolPop(v26);

                objc_autoreleasePoolPop(context);
                v29 = 0;
                v9 = v41;
                v3 = v42;
                v10 = v40;
                goto LABEL_28;
              }
              objc_autoreleasePoolPop(v26);
            }
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
            if (v22)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(context);
        ++v12;
        v11 = v38;
        v9 = v41;
        v3 = v42;
        v10 = v40;
      }
      while (v12 != v39);
      v29 = 1;
      v39 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v39);
  }
  else
  {
    v29 = 1;
  }
LABEL_28:

LABEL_29:
  return v29;
}

+ (id)_getRegulatoryDomainCountryCodes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D8BBE0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)checkNetworkReachabilityWithQueue:(id)a3 handler:(id)a4
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[SMInitiatorEligibility checkNetworkReachabilityWithQueue:handler:]";
      v13 = 1024;
      v14 = 396;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SMInitiatorEligibility_checkNetworkReachabilityWithQueue_handler___block_invoke;
  block[3] = &unk_1E9297178;
  v10 = v6;
  v8 = v6;
  dispatch_async(v5, block);

}

uint64_t __68__SMInitiatorEligibility_checkNetworkReachabilityWithQueue_handler___block_invoke(uint64_t a1)
{
  void *v2;

  +[SMNetworkReachabilityObserver sharedNetworkReachabilityObserver](SMNetworkReachabilityObserver, "sharedNetworkReachabilityObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isNetworkReachable");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)checkIMessageAccountEnabledWithQueue:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[SMInitiatorEligibility checkIMessageAccountEnabledWithQueue:handler:]";
      v17 = 1024;
      v18 = 408;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multiplexedConnectionWithLabel:capabilities:context:", CFSTR("com.apple.routined.SafetyMonitor.SMInitiatorEligibility.iMessage"), 512, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke;
  v12[3] = &unk_1E9297650;
  v13 = v5;
  v14 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "connectWithCompletion:", v12);

}

void __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke_2;
  block[3] = &unk_1E9297178;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __71__SMInitiatorEligibility_checkIMessageAccountEnabledWithQueue_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35918], "serviceWithName:", CFSTR("iMessage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountsForService:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "isActive", (_QWORD)v9) & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)checkLocationAuthorizationWithQueue:(id)a3 handler:(id)a4
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "+[SMInitiatorEligibility checkLocationAuthorizationWithQueue:handler:]";
      v13 = 1024;
      v14 = 438;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SMInitiatorEligibility_checkLocationAuthorizationWithQueue_handler___block_invoke;
  block[3] = &unk_1E9297178;
  v10 = v6;
  v8 = v6;
  dispatch_async(v5, block);

}

uint64_t __70__SMInitiatorEligibility_checkLocationAuthorizationWithQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundlePath:", *MEMORY[0x1E0D8BBB8]) == 3, 0);
}

+ (void)checkManateeEnabledWithQueue:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "+[SMInitiatorEligibility checkManateeEnabledWithQueue:handler:]";
      v15 = 1024;
      v16 = 449;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke;
  v10[3] = &unk_1E9298398;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[SMCloudKitZone supportsDeviceToDeviceEncryptionWithCompletion:](SMCloudKitZone, "supportsDeviceToDeviceEncryptionWithCompletion:", v10);

}

void __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke_2;
  block[3] = &unk_1E92A0830;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __63__SMInitiatorEligibility_checkManateeEnabledWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
