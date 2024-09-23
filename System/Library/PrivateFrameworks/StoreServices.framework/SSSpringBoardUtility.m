@implementation SSSpringBoardUtility

+ (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  BOOL v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  int v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__17;
  v46 = __Block_byref_object_dispose__17;
  v47 = 0;
  v9 = dispatch_semaphore_create(0);
  v10 = SSVFrontBoardServicesFramework();
  objc_msgSend(SSVWeakLinkedClassForString(CFSTR("FBSSystemService"), v10), "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __70__SSSpringBoardUtility_launchApplicationWithIdentifier_options_error___block_invoke;
  v39 = &unk_1E47BA6E8;
  v41 = &v42;
  v12 = v9;
  v40 = v12;
  objc_msgSend(v11, "openApplication:options:withResult:", v7, v8, &v36);

  v13 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    v16 = objc_msgSend(v14, "shouldLogToDisk");
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v15 |= 2u;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v19 = (void *)objc_opt_class();
      v48 = 138543618;
      v49 = v19;
      v50 = 2114;
      v51 = v7;
      v20 = v19;
      LODWORD(v35) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v48, v35, v36, v37, v38, v39);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v14, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_12;
  }
LABEL_13:
  v28 = (void *)SSVFrontBoardServicesFramework();
  SSVWeakLinkedStringConstantForString("FBSOpenApplicationErrorDomain", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v43[5], "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", v29);

  v32 = (void *)v43[5];
  if (v31)
    v32 = (void *)objc_msgSend(v32, "code");
  v33 = v32 == 0;
  if (a5 && v32)
    *a5 = objc_retainAutorelease((id)v43[5]);

  _Block_object_dispose(&v42, 8);
  return v33;
}

void __70__SSSpringBoardUtility_launchApplicationWithIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)wakeAppUsingRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_dispatchQueueSpringBoard");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke;
  v7[3] = &unk_1E47BA600;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke(uint64_t a1)
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
  char v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  int v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  dispatch_time_t v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  int v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int *v78;
  uint64_t v79;
  _QWORD block[4];
  id v81;
  id v82;
  uint64_t v83;
  unsigned int v84;
  id v85;
  int v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  double v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "takeKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "appIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldLaunchApp"))
  {
LABEL_6:
    v84 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "_getProcessID:forApplicationIdentifier:", &v84, v3) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "processAssertionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "processAssertionInterval");
      v16 = v15;
      objc_msgSend(*(id *)(a1 + 32), "processAssertionReason");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (!v14 || !v17 || v16 <= 2.22044605e-16)
      {
        +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));
LABEL_66:

        goto LABEL_67;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = objc_msgSend(v19, "shouldLog");
      if (objc_msgSend(v19, "shouldLogToDisk"))
        v21 = v20 | 2;
      else
        v21 = v20;
      objc_msgSend(v19, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        v21 &= 2u;
      if (v21)
      {
        v23 = (void *)objc_opt_class();
        v86 = 138544130;
        v87 = v23;
        v88 = 2114;
        v89 = v14;
        v90 = 2050;
        v91 = v16;
        v92 = 2114;
        v93 = v18;
        v24 = v23;
        LODWORD(v79) = 42;
        v78 = &v86;
        v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v86, v79);
        v22 = objc_claimAutoreleasedReturnValue();
        free(v25);
        SSFileLog(v19, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v22);
      }

LABEL_21:
      if ((objc_msgSend(v18, "isEqualToString:", CFSTR("ProcessAssertionReasonBackgroundDownload")) & 1) != 0)
      {
        v32 = 10;
      }
      else if (objc_msgSend(v18, "isEqualToString:", CFSTR("ProcessAssertionReasonTaskCompletion")))
      {
        v32 = 4;
      }
      else
      {
        v32 = 0;
      }
      v61 = objc_alloc(MEMORY[0x1E0CFE308]);
      v60 = (void *)objc_msgSend(v61, "initWithPID:flags:reason:name:", v84, 1, v32, v14);
      if ((objc_msgSend(v60, "valid") & 1) != 0)
      {
        v62 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
        objc_msgSend(*(id *)(a1 + 40), "_dispatchQueue");
        v63 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke_15;
        block[3] = &unk_1E47B9F28;
        v83 = *(_QWORD *)(a1 + 40);
        v81 = v14;
        v82 = v60;
        dispatch_after(v62, v63, block);

        v64 = v81;
LABEL_65:

        goto LABEL_66;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v65)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v66 = objc_msgSend(v65, "shouldLog", v78);
      if (objc_msgSend(v65, "shouldLogToDisk"))
        v67 = v66 | 2;
      else
        v67 = v66;
      objc_msgSend(v65, "OSLogObject");
      v68 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        v67 &= 2u;
      if (v67)
      {
        v69 = (void *)objc_opt_class();
        v86 = 138543618;
        v87 = v69;
        v88 = 2114;
        v89 = v14;
        v70 = v69;
        LODWORD(v79) = 22;
        v71 = (void *)_os_log_send_and_compose_impl();

        if (!v71)
        {
LABEL_64:

          +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));
          goto LABEL_65;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v71, 4, &v86, v79);
        v68 = objc_claimAutoreleasedReturnValue();
        free(v71);
        SSFileLog(v65, CFSTR("%@"), v72, v73, v74, v75, v76, v77, (uint64_t)v68);
      }

      goto LABEL_64;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = objc_msgSend(v33, "shouldLog");
    if (objc_msgSend(v33, "shouldLogToDisk"))
      v35 = v34 | 2;
    else
      v35 = v34;
    objc_msgSend(v33, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      v35 &= 2u;
    if (v35)
    {
      v37 = (void *)objc_opt_class();
      v86 = 138543618;
      v87 = v37;
      v88 = 2114;
      v89 = v3;
      v38 = v37;
      LODWORD(v79) = 22;
      v39 = (void *)_os_log_send_and_compose_impl();

      if (!v39)
      {
LABEL_34:

        +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));
LABEL_67:

        goto LABEL_68;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v39, 4, &v86, v79);
      v36 = objc_claimAutoreleasedReturnValue();
      free(v39);
      SSFileLog(v33, CFSTR("%@"), v40, v41, v42, v43, v44, v45, (uint64_t)v36);
    }

    goto LABEL_34;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)SSVFrontBoardServicesFramework();
  SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyActivateSuspended", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v6);

  objc_msgSend(*(id *)(a1 + 32), "launchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)SSVFrontBoardServicesFramework();
    SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyPayloadOptions", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v9);

  }
  v10 = *(void **)(a1 + 40);
  v85 = 0;
  v11 = objc_msgSend(v10, "launchApplicationWithIdentifier:options:error:", v3, v4, &v85);
  v12 = v85;
  v13 = v12;
  if ((v11 & 1) != 0)
  {

    goto LABEL_6;
  }
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47 = objc_msgSend(v46, "shouldLog");
  if (objc_msgSend(v46, "shouldLogToDisk"))
    v48 = v47 | 2;
  else
    v48 = v47;
  objc_msgSend(v46, "OSLogObject");
  v49 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    v48 &= 2u;
  if (!v48)
    goto LABEL_45;
  v50 = (void *)objc_opt_class();
  v86 = 138543874;
  v87 = v50;
  v88 = 2114;
  v89 = v3;
  v90 = 2114;
  v91 = *(double *)&v13;
  v51 = v50;
  LODWORD(v79) = 32;
  v52 = (void *)_os_log_send_and_compose_impl();

  if (v52)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v52, 4, &v86, v79);
    v49 = objc_claimAutoreleasedReturnValue();
    free(v52);
    SSFileLog(v46, CFSTR("%@"), v53, v54, v55, v56, v57, v58, (uint64_t)v49);
LABEL_45:

  }
  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));

LABEL_68:
}

void __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke_15(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedDaemonConfig](SSLogConfig, "sharedDaemonConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  v6 = (void *)objc_opt_class();
  v7 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v18 = 138543618;
  *(_QWORD *)&v18[4] = v6;
  *(_WORD *)&v18[12] = 2112;
  *(_QWORD *)&v18[14] = v7;
  v8 = v6;
  LODWORD(v17) = 22;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, v18, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16]);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v2, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v5);
LABEL_11:

  }
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  +[SSTransactionStore defaultStore](SSTransactionStore, "defaultStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "releaseKeepAliveWithTransactionID:", CFSTR("com.apple.storeservices.wakeAppTransactionIdentifier"));

}

+ (id)_applicationStateMonitor
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "_dispatchQueueSpringBoard");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_applicationStateMonitor_onceToken != -1)
    dispatch_once(&_applicationStateMonitor_onceToken, block);
  return (id)_applicationStateMonitor_sApplicationStateMonitor;
}

void __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  v2 = objc_alloc_init(MEMORY[0x1E0CFE2F0]);
  v3 = (void *)_applicationStateMonitor_sApplicationStateMonitor;
  _applicationStateMonitor_sApplicationStateMonitor = (uint64_t)v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)_applicationStateMonitor_sApplicationStateMonitor;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke_2;
  v5[3] = &unk_1E47BADD0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "setHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setApplicationState:forClientID:", v5, v6);
}

+ (id)_dispatchQueue
{
  if (_dispatchQueue_onceToken != -1)
    dispatch_once(&_dispatchQueue_onceToken, &__block_literal_global_6);
  return (id)_dispatchQueue_sDispatchQueue;
}

void __38__SSSpringBoardUtility__dispatchQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility", 0);
  v1 = (void *)_dispatchQueue_sDispatchQueue;
  _dispatchQueue_sDispatchQueue = (uint64_t)v0;

}

+ (id)_dispatchQueueNotifications
{
  if (_dispatchQueueNotifications_onceToken != -1)
    dispatch_once(&_dispatchQueueNotifications_onceToken, &__block_literal_global_20);
  return (id)_dispatchQueueNotifications_sDispatchQueue;
}

void __51__SSSpringBoardUtility__dispatchQueueNotifications__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility.Notifications", 0);
  v1 = (void *)_dispatchQueueNotifications_sDispatchQueue;
  _dispatchQueueNotifications_sDispatchQueue = (uint64_t)v0;

}

+ (id)_dispatchQueueSpringBoard
{
  if (_dispatchQueueSpringBoard_onceToken != -1)
    dispatch_once(&_dispatchQueueSpringBoard_onceToken, &__block_literal_global_22);
  return (id)_dispatchQueueSpringBoard_sDispatchQueueSpringBoard;
}

void __49__SSSpringBoardUtility__dispatchQueueSpringBoard__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility.SpringBoard", 0);
  v1 = (void *)_dispatchQueueSpringBoard_sDispatchQueueSpringBoard;
  _dispatchQueueSpringBoard_sDispatchQueueSpringBoard = (uint64_t)v0;

}

+ (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  NSObject *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  int v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_dispatchQueueSpringBoard");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__17;
  v39 = __Block_byref_object_dispose__17;
  v40 = 0;
  objc_msgSend(a1, "_applicationStateMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_semaphore_create(0);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__SSSpringBoardUtility__getApplicationInfoForIdentifier_key___block_invoke;
  v31[3] = &unk_1E47BAE18;
  v34 = &v35;
  v11 = v7;
  v32 = v11;
  v12 = v10;
  v33 = v12;
  objc_msgSend(v9, "applicationInfoForApplication:completion:", v6, v31);
  v13 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    v16 = objc_msgSend(v14, "shouldLogToDisk");
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
      v15 |= 2u;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v15 &= 2u;
    if (v15)
    {
      v19 = (void *)objc_opt_class();
      v41 = 138412802;
      v42 = v19;
      v43 = 2114;
      v44 = v6;
      v45 = 2114;
      v46 = v11;
      v20 = v19;
      LODWORD(v30) = 32;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v41, v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v14, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_12;
  }
LABEL_13:
  v28 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
  return v28;
}

void __61__SSSpringBoardUtility__getApplicationInfoForIdentifier_key___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  char v10;

  v6 = a4;
  objc_msgSend(a1, "_dispatchQueueSpringBoard");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(a1, "_getApplicationInfoForIdentifier:key:", v6, *MEMORY[0x1E0CFE2C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_respondsToSelector();
  v10 = v9;
  if (a3 && (v9 & 1) != 0)
    *a3 = objc_msgSend(v8, "intValue");

  return v10 & 1;
}

+ (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  unsigned int v13;

  v6 = a4;
  objc_msgSend(a1, "_dispatchQueueSpringBoard");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(a1, "_dispatchQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke;
  block[3] = &unk_1E47BAE40;
  v13 = a3;
  v11 = v6;
  v12 = a1;
  v9 = v6;
  dispatch_async(v8, block);

}

void __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_stateCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_dispatchQueueNotifications");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke_2;
  block[3] = &unk_1E47B9F28;
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v9 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  dispatch_async(v4, block);

}

void __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE2C0];
  v6[0] = *MEMORY[0x1E0CFE2A8];
  v6[1] = v2;
  v3 = a1[5];
  v7[0] = a1[4];
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SSSpringBoardUtilityApplicationStateChangeNotification"), a1[6], v4);

}

+ (id)_stateCache
{
  if (_stateCache_onceToken != -1)
    dispatch_once(&_stateCache_onceToken, &__block_literal_global_27);
  return (id)_stateCache_sStateCache;
}

void __35__SSSpringBoardUtility__stateCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_stateCache_sStateCache;
  _stateCache_sStateCache = (uint64_t)v0;

}

@end
