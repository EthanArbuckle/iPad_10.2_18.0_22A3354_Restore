@implementation RTLaunchServices

+ (void)launchClientWithBundleIdentifier:(id)a3 restorationIdentifier:(id)a4 eventAgentManager:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  id v35;
  void (**v36)(_QWORD, _QWORD);
  _QWORD v37[4];
  id v38;
  id v39;
  void (**v40)(_QWORD, _QWORD);
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  _QWORD v44[3];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if (v10)
  {
    if (v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v10;
        v47 = 2112;
        v48 = v11;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "launch client with bundle identifier, %@, restoration identifier, %@", buf, 0x16u);
      }

      v16 = objc_msgSend(a1, "canOpenApplication:", v10);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v16)
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          v46 = v10;
          v47 = 2112;
          v48 = v11;
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "launch application for client with bundleIdentifier, %@, restorationIdentifier, %@", buf, 0x16u);
        }

        v19 = *MEMORY[0x1E0D22D00];
        v44[0] = MEMORY[0x1E0C9AAB0];
        v20 = *MEMORY[0x1E0D22CF0];
        v43[0] = v19;
        v43[1] = v20;
        v41 = *MEMORY[0x1E0D22BB0];
        v42 = MEMORY[0x1E0C9AA70];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v43[2] = CFSTR("RTLaunchServicesRestorationIdentifier");
        v44[1] = v21;
        v44[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke;
        v37[3] = &unk_1E92A2AD8;
        v38 = v10;
        v39 = v11;
        v40 = v14;
        objc_msgSend(v24, "openApplication:withOptions:completion:", v38, v23, v37);

      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138412546;
          v46 = v10;
          v47 = 2112;
          v48 = v11;
          _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "launched daemon for client with bundle id, %@, restorationIdentifier, %@", buf, 0x16u);
        }

        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke_15;
        v33[3] = &unk_1E92A2B00;
        v34 = v10;
        v35 = v11;
        v36 = v14;
        objc_msgSend(v12, "launchDaemonWithRestorationIdentifier:withReply:", v35, v33);

        v22 = v34;
      }
      goto LABEL_17;
    }
    if (v13)
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0D18598];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Launching an application requires a restoration identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v31;
      v29 = v32;
      v30 = 1;
      goto LABEL_13;
    }
  }
  else if (v13)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("Launching an application requires an bundle identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v25;
    v29 = v26;
    v30 = 0;
LABEL_13:
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, v30, v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *))v14)[2](v14, v22);
LABEL_17:

  }
}

void __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = CFSTR("NO");
    if (!v4)
      v8 = CFSTR("YES");
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "launched application for client with bundle id, %@, restorationIdentifier, %@, success, %@", (uint8_t *)&v10, 0x20u);
  }

  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);

}

void __101__RTLaunchServices_launchClientWithBundleIdentifier_restorationIdentifier_eventAgentManager_handler___block_invoke_15(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = CFSTR("NO");
    if (a2)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412802;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "launched daemon for client with bundle id, %@, restorationIdentifier, %@, success, %@", buf, 0x20u);
  }

  v8 = a1[6];
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to launch daemon for client with bundle identifier, %@, restoration identifier, %@"), a1[4], a1[5], *MEMORY[0x1E0CB2D50]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 2, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = a1[6];
    }
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

+ (BOOL)canOpenApplication:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v8;

  v8 = 0;
  v3 = (void *)MEMORY[0x1E0D23170];
  v4 = a3;
  objc_msgSend(v3, "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenApplication:reason:", v4, &v8);

  return v6;
}

+ (void)createProcessAssertionForPid:(int)a3 timeout:(double)a4 queue:(id)a5 timeoutHandler:(id)a6
{
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  _QWORD v19[4];
  void (**v20)(_QWORD);
  uint8_t *v21;
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v8 = *(_QWORD *)&a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = (void (**)(_QWORD))a6;
  if (a4 >= 0.0)
  {
    if (v9)
    {
      v12 = v9;
    }
    else
    {
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
    }
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__122;
    v26 = __Block_byref_object_dispose__122;
    v14 = objc_alloc(MEMORY[0x1E0D87C98]);
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v14, "initWithExplanation:target:attributes:", CFSTR("com.apple.routined"), v15, v17);

    v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __78__RTLaunchServices_createProcessAssertionForPid_timeout_queue_timeoutHandler___block_invoke;
    v19[3] = &unk_1E929FA80;
    v21 = buf;
    v20 = v10;
    dispatch_after(v18, v12, v19);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "requested assertion timeout was less than 0, returning", buf, 2u);
    }

    if (v10)
      v10[2](v10);
  }

}

uint64_t __78__RTLaunchServices_createProcessAssertionForPid_timeout_queue_timeoutHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "invalidate");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
