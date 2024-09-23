@implementation Libsysdiagnose

+ (id)setupConnection
{
  NSObject *v2;
  _xpc_connection_s *mach_service;
  NSObject *v4;
  uint8_t v6[16];

  dispatch_get_global_queue(33, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v2, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_resume(mach_service);
  if (!mach_service)
  {
    v4 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CB4B7000, v4, OS_LOG_TYPE_DEFAULT, "Connection failed", v6, 2u);
    }
  }

  return mach_service;
}

void __33__Libsysdiagnose_setupConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (MEMORY[0x1D179CEDC](a2) == MEMORY[0x1E0C81310])
  {
    v2 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1CB4B7000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to com.apple.sysdiagnose.service.xpc failed", v3, 2u);
    }
  }
}

+ (id)createSysdiagnoseRequest:(id)a3
{
  id v3;
  xpc_object_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  const char *v21;
  const void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "REQUEST_TYPE", 1uLL);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SDRequestSourceShell"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("verbose"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      xpc_dictionary_set_fd(v4, "stdout", 1);
      xpc_dictionary_set_fd(v4, "stderr", 2);
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v29 = v8;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        objc_msgSend(v3, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          xpc_dictionary_set_BOOL(v4, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), objc_msgSend(v14, "BOOLValue"));
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          xpc_dictionary_set_string(v4, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            v17 = objc_retainAutorelease(v15);
            v18 = objc_msgSend(v17, "bytes");
            v19 = objc_msgSend(v17, "length");
            v20 = v4;
            v21 = (const char *)v16;
            v22 = (const void *)v18;
            v8 = v29;
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v23 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
            v24 = objc_retainAutorelease(v15);
            v25 = objc_msgSend(v24, "bytes");
            v19 = objc_msgSend(v24, "length");
            v20 = v4;
            v21 = (const char *)v23;
            v8 = v29;
            v22 = (const void *)v25;
LABEL_19:
            xpc_dictionary_set_data(v20, v21, v22, v19);
          }
LABEL_20:

          goto LABEL_21;
        }
        v26 = _log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB4B7000, v26, OS_LOG_TYPE_DEFAULT, "Undefined type in the metadata", buf, 2u);
        }
LABEL_21:

        ++v12;
      }
      while (v10 != v12);
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v10 = v27;
    }
    while (v27);
  }

  return v4;
}

+ (int)addErrorString:(id)a3 WithCode:(id)a4 forError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v11 = *MEMORY[0x1E0CB2D50];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("libsysdiagnoseError"), (int)objc_msgSend(v8, "intValue"), v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(a5) = objc_msgSend(v8, "intValue");
  }

  return (int)a5;
}

+ (void)createMetrics:(id *)a3 fromResponse:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD applier[4];
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke;
  applier[3] = &unk_1E8653F88;
  v9 = v7;
  v11 = v9;
  xpc_dictionary_apply(v6, applier);

  v8 = (id)objc_msgSend(v9, "count");
  if (v8)
    v8 = (id)objc_msgSend(v9, "copy");
  *a3 = v8;

}

uint64_t __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (MEMORY[0x1D179CEDC]() == MEMORY[0x1E0C81300])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", xpc_double_get_value(v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

  }
  return 1;
}

+ (BOOL)verifyReply:(id)a3 withExpectedType:(_xpc_type_s *)a4 forError:(id *)a5
{
  id v7;
  void *v8;
  _xpc_type_s *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  uint8_t buf[16];

  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("xpc connection returned a null object"), &unk_1E86548D8, a5);
    goto LABEL_9;
  }
  v9 = (_xpc_type_s *)MEMORY[0x1D179CEDC](v7);
  if (v9 == a4)
  {
    v11 = 1;
  }
  else
  {
    if (v9 == (_xpc_type_s *)MEMORY[0x1E0C81310])
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1E0C81270]));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", v12, &unk_1E86548F0, a5);

      goto LABEL_9;
    }
    v10 = _log_context;
    v11 = 0;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB4B7000, v10, OS_LOG_TYPE_DEFAULT, "unrecognized message event.", buf, 2u);
LABEL_9:
      v11 = 0;
    }
  }

  return v11;
}

+ (id)sendSysdiagnoseRequest:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  id v10;
  id v11;
  _xpc_connection_s *v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  NSObject *v16;
  id v17;
  uint8_t v19[8];
  _QWORD v20[9];
  _QWORD handler[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  dispatch_semaphore_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  dispatch_semaphore_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v10 = a3;
  v11 = a6;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__64;
  v49[4] = __Block_byref_object_dispose__65;
  v50 = (id)objc_msgSend(v11, "copy");
  objc_msgSend(a1, "setupConnection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    v48 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy_;
    v41 = __Block_byref_object_dispose_;
    v42 = dispatch_semaphore_create(0);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v36 = dispatch_semaphore_create(0);
    v27 = 0;
    v28 = (double *)&v27;
    v29 = 0x2020000000;
    v30 = 0;
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke;
    handler[3] = &unk_1E8653FB0;
    v23 = &v43;
    v24 = &v27;
    v22 = v11;
    v25 = v49;
    v26 = &v31;
    xpc_connection_set_event_handler(v12, handler);
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_70;
    v20[3] = &unk_1E8653FD8;
    v20[4] = &v43;
    v20[5] = &v51;
    v20[7] = &v37;
    v20[8] = a4;
    v20[6] = &v57;
    xpc_connection_send_message_with_reply(v12, v10, 0, v20);
    dispatch_semaphore_wait((dispatch_semaphore_t)v38[5], 0xFFFFFFFFFFFFFFFFLL);
    v14 = v32[5];
    v15 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000);
    dispatch_semaphore_wait(v14, v15);
    if (v52[5])
    {
      if (v28[3] < 100.0)
      {
        v16 = _log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1CB4B7000, v16, OS_LOG_TYPE_DEFAULT, "Timed out waiting for progress updates.", v19, 2u);
        }
      }
    }
    if (a5)
      *a5 = objc_retainAutorelease((id)v44[5]);
    if (a4)
      *a4 = (id)objc_msgSend((id)v58[5], "copy");
    v17 = (id)v52[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

  }
  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Failed to create the xpc_connection"), &unk_1E86548D8, a5);
    v17 = 0;
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v17;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t uint64;
  const char *string;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;

  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v4 + 40);
  v5 = +[Libsysdiagnose verifyReply:withExpectedType:forError:](Libsysdiagnose, "verifyReply:withExpectedType:forError:", v3, MEMORY[0x1E0C812F8], &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = xpc_dictionary_get_double(v3, (const char *)objc_msgSend(CFSTR("percentage"), "UTF8String"));
    uint64 = xpc_dictionary_get_uint64(v3, (const char *)objc_msgSend(CFSTR("phase"), "UTF8String"));
    string = xpc_dictionary_get_string(v3, (const char *)objc_msgSend(CFSTR("diagnosticID"), "UTF8String"));
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(double *)(v8 + 24);
    if (v9 >= 0.0)
    {
      if (a1[4])
      {
        v12 = string;
        if (v9 > 100.0)
        {
          *(_QWORD *)(v8 + 24) = 0x4059000000000000;
          v13 = _log_context;
          if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_ERROR))
            __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1(v13);
        }
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1[6] + 8) + 24));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("percentage"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", uint64);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("phase"));

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("diagnosticID"));

        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
        v19 = (void *)objc_msgSend(v14, "copy");
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

        v9 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
      }
      if (v9 >= 100.0)
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[8] + 8) + 40));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v3, "error"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1[5] + 8);
      v20 = *(id *)(v11 + 40);
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", v10, &unk_1E8654908, &v20);
      objc_storeStrong((id *)(v11 + 40), v20);

    }
  }

}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_70(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  const char *string;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id obj;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1[4] + 8);
  obj = *(id *)(v4 + 40);
  v5 = +[Libsysdiagnose verifyReply:withExpectedType:forError:](Libsysdiagnose, "verifyReply:withExpectedType:forError:", v3, MEMORY[0x1E0C812F8], &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    sleep(2u);
    +[Libsysdiagnose getSysdiagnoseCrashLog](Libsysdiagnose, "getSysdiagnoseCrashLog");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v14);
      v15 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_retainAutorelease(v14);
      objc_msgSend(v15, "stringWithFormat:", CFSTR("XPC reply failed, found a latest sysdiagnose crash log in last 10 minutes at %s"), objc_msgSend(v14, "UTF8String"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1[4] + 8);
      v19 = *(id *)(v17 + 40);
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", v16, &unk_1E8654908, &v19);
      objc_storeStrong((id *)(v17 + 40), v19);

    }
    goto LABEL_10;
  }
  string = xpc_dictionary_get_string(v3, "path");
  if (!string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v3, "error"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1[4] + 8);
    v20 = *(id *)(v18 + 40);
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", v14, &unk_1E8654908, &v20);
    objc_storeStrong((id *)(v18 + 40), v20);
    goto LABEL_10;
  }
  v7 = string;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = _log_context;
  if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v24 = v7;
    _os_log_impl(&dword_1CB4B7000, v11, OS_LOG_TYPE_DEFAULT, "xpc response: %{public}s\n", buf, 0xCu);
  }
  if (a1[8])
  {
    v12 = *(_QWORD *)(a1[6] + 8);
    v21 = *(id *)(v12 + 40);
    +[Libsysdiagnose createMetrics:fromResponse:](Libsysdiagnose, "createMetrics:fromResponse:", &v21, v3);
    v13 = v21;
    v14 = *(id *)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
LABEL_10:

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[7] + 8) + 40));

}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressCallback:(id)a6
{
  id v10;
  id v11;
  os_log_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (!_log_context)
  {
    v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke;
  v20[3] = &unk_1E8654000;
  v25 = a1;
  v14 = v10;
  v21 = v14;
  v23 = &v33;
  v24 = &v27;
  v26 = a4;
  v15 = v11;
  v22 = v15;
  _os_activity_initiate(&dword_1CB4B7000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = objc_retainAutorelease((id)v28[5]);
  }
  else
  {
    v16 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_log_impl(&dword_1CB4B7000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }
  v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

void __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  id v11;
  id obj;

  objc_msgSend(*(id *)(a1 + 64), "createSysdiagnoseRequest:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  +[Libsysdiagnose sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:", v2, v3, &obj, *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(_QWORD *)(v8 + 40);
    v9 = (id *)(v8 + 40);
    if (!v10)
    {
      v11 = 0;
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Unknown error"), &unk_1E8654920, &v11);
      objc_storeStrong(v9, v11);
    }
  }

}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  id v10;
  id v11;
  os_log_t v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25;
  id *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (!_log_context)
  {
    v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke;
  v20[3] = &unk_1E8654050;
  v25 = a1;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v23 = &v33;
  v26 = a4;
  v24 = &v27;
  _os_activity_initiate(&dword_1CB4B7000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = objc_retainAutorelease((id)v28[5]);
  }
  else
  {
    v16 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_log_impl(&dword_1CB4B7000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }
  v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v18;
}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  id obj;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_msgSend(*(id *)(a1 + 64), "createSysdiagnoseRequest:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__64;
  v19 = __Block_byref_object_dispose__65;
  v20 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  if (v16[5])
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2;
    v14[3] = &unk_1E8654028;
    v14[4] = &v15;
    v3 = (void *)MEMORY[0x1D179CCFC](v14);
  }
  else
  {
    v3 = 0;
  }
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  +[Libsysdiagnose sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sendSysdiagnoseRequest:withMetrics:withError:withProgressHandler:", v2, v4, &obj, v3);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
    {
      v12 = 0;
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Unknown error"), &unk_1E8654920, &v12);
      objc_storeStrong(v10, v12);
    }
  }
  _Block_object_dispose(&v15, 8);

}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("percentage"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:", a3, a4, a5, 0);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:", a3, 0, a4, 0);
}

+ (void)sysdiagnoseWithMetadata:(id)a3 onCompletion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke;
  v10[3] = &unk_1E8654078;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:", v2, 0, &v6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 andProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:](Libsysdiagnose, "sysdiagnoseWithMetadata:withMetrics:withError:withProgressHandler:", a3, 0, a4, a5);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 withProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:withMetrics:withError:withProgressCallback:](Libsysdiagnose, "sysdiagnoseWithMetadata:withMetrics:withError:withProgressCallback:", a3, 0, a4, a5);
}

+ (BOOL)isSysdiagnoseInProgressWithError:(id *)a3
{
  char *v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  BOOL v12;
  BOOL v14;
  _xpc_connection_s *v16;
  xpc_object_t v17;
  xpc_object_t v18;
  const char *string;
  const char *v20;
  size_t v21;
  int v22;
  _QWORD buffer[3];
  __int16 v24;
  int v25[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v21 = 4;
  *(_QWORD *)v25 = 0x600000001;
  if (sysctl(v25, 2u, &v22, &v21, 0, 0) == -1)
  {
    v20 = "sysctl(... kern.maxproc ...)";
LABEL_31:
    perror(v20);
    return 0;
  }
  v5 = (char *)malloc_type_malloc(4 * v22, 0x100004052888210uLL);
  if (!v5)
  {
    v20 = "malloc";
    goto LABEL_31;
  }
  v6 = v5;
  v7 = proc_listallpids(v5, 4 * v22);
  if (v7 == -1)
  {
    perror("proc_listallpids");
    goto LABEL_17;
  }
  if (v7 < 1)
  {
LABEL_17:
    free(v6);
    return 0;
  }
  v8 = 0;
  v9 = 4 * v7;
  while (1)
  {
    bzero(buffer, 0x400uLL);
    v10 = *(_DWORD *)&v6[v8];
    proc_pidpath(v10, buffer, 0x400u);
    v11 = buffer[0] == 0x62696C2F7273752FLL && buffer[1] == 0x7379732F63657865;
    v12 = v11 && buffer[2] == 0x65736F6E67616964;
    if (v12 && v24 == 100)
      break;
    v8 += 4;
    if (v9 == v8)
      goto LABEL_17;
  }
  free(v6);
  if (v10 < 1)
    return 0;
  objc_msgSend(a1, "setupConnection");
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v17, "REQUEST_TYPE", 7uLL);
    v18 = xpc_connection_send_message_with_reply_sync(v16, v17);
    if (objc_msgSend(a1, "verifyReply:withExpectedType:forError:", v18, MEMORY[0x1E0C812F8], a3)
      && xpc_dictionary_get_uint64(v18, "RESPONSE_TYPE") == 1)
    {
      string = xpc_dictionary_get_string(v18, "status");
      v14 = strcmp(string, "Running") == 0;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Failed to create the xpc_connection to sysdiagnose"), &unk_1E86548D8, a3);
    v14 = 0;
  }

  return v14;
}

+ (BOOL)cancelActiveSysdiagnoseWithError:(id *)a3
{
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  BOOL v8;

  objc_msgSend(a1, "setupConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 4uLL);
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (objc_msgSend(a1, "verifyReply:withExpectedType:forError:", v7, MEMORY[0x1E0C812F8], a3))
      v8 = xpc_dictionary_get_uint64(v7, "RESPONSE_TYPE") == 1;
    else
      v8 = 0;

  }
  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Failed to create the xpc_connection for cancellation"), &unk_1E86548D8, a3);
    v8 = 0;
  }

  return v8;
}

+ (id)fetchDiagnosticIDFromDeviceSource:(unint64_t)a3 WithMaxCount:(unint64_t)a4 withError:(id *)a5
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  id v45;
  void *v47;
  void *v48;
  char v49;
  id *v50;
  unint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v7 = a3;
  v65 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 & 1) == 0)
    goto LABEL_22;
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathSubmission");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("DiagnosticLogs/sysdiagnose"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C999D0], *MEMORY[0x1E0C99A90], *MEMORY[0x1E0C99AA8], 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, v15, 7, &__block_literal_global_97);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_20;
  v48 = v13;
  v49 = v7;
  v50 = a5;
  v51 = a4;
  v52 = v8;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v47 = v16;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  if (!v18)
  {
    v20 = 0;
    goto LABEL_19;
  }
  v19 = v18;
  v20 = 0;
  v21 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v58 != v21)
        objc_enumerationMutation(v17);
      v23 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "containsString:", CFSTR(".tar")))
      {

      }
      else
      {
        objc_msgSend(v23, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "containsString:", CFSTR(".tar.gz"));

        if (!v26)
          continue;
      }
      objc_msgSend(v23, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      extractDiagnosticID(v27);
      v28 = objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v52, "addObject:", v28);
        v20 = (void *)v28;
      }
      else
      {
        v20 = 0;
      }
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
  }
  while (v19);
LABEL_19:

  a4 = v51;
  v8 = v52;
  v7 = v49;
  a5 = v50;
  v16 = v47;
  v13 = v48;
LABEL_20:

LABEL_21:
LABEL_22:
  if ((v7 & 2) != 0)
  {
    +[Libsysdiagnose fetchRemoteDiagnosticIDsWithError:](Libsysdiagnose, "fetchRemoteDiagnosticIDsWithError:", a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29 && objc_msgSend(v29, "count"))
    {
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
      if (v32)
      {
        v33 = v32;
        v34 = 0;
        v35 = *(_QWORD *)v54;
        do
        {
          v36 = 0;
          v37 = v34;
          do
          {
            if (*(_QWORD *)v54 != v35)
              objc_enumerationMutation(v31);
            extractDiagnosticID(*(void **)(*((_QWORD *)&v53 + 1) + 8 * v36));
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
              objc_msgSend(v8, "addObject:", v34);
            ++v36;
            v37 = v34;
          }
          while (v33 != v36);
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        }
        while (v33);

      }
    }

  }
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "reverseObjectEnumerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allObjects");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v40;
      _os_log_impl(&dword_1CB4B7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Considering the following diagnosticIDs %@", buf, 0xCu);
    }
    v41 = objc_msgSend(v40, "count");
    if (v41 >= a4)
      v42 = a4;
    else
      v42 = v41;
    if (a4)
      v43 = v42;
    else
      v43 = v41;
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectsAtIndexes:", v44);
    v45 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB4B7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Did not match any diagnosticIDs.", buf, 2u);
    }
    v45 = v8;
  }

  return v45;
}

uint64_t __75__Libsysdiagnose_fetchDiagnosticIDFromDeviceSource_WithMaxCount_withError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CB4B7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);

  }
  return 1;
}

+ (id)fetchRemoteDiagnosticIDsWithError:(id *)a3
{
  _xpc_connection_s *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  void *v9;
  size_t count;
  size_t v11;
  size_t i;
  const char *string;
  void *v14;
  id v15;

  objc_msgSend(a1, "setupConnection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "REQUEST_TYPE", 9uLL);
    v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    v7 = v6;
    if (v6 && MEMORY[0x1D179CEDC](v6) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_uint64(v7, "RESPONSE_TYPE") == 1)
    {
      xpc_dictionary_get_value(v7, "archive_list");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        count = xpc_array_get_count(v8);
        if (count)
        {
          v11 = count;
          for (i = 0; i != v11; ++i)
          {
            string = xpc_array_get_string(v8, i);
            if (string)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v14);

            }
          }
        }
        v15 = v9;
      }
      else
      {
        +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("sysdiagnose server returned malformed response"), &unk_1E86548D8, a3);
        v15 = 0;
      }

    }
    else
    {
      +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Couldn't get valid reply from sysdiagnose server"), &unk_1E86548D8, a3);
      v15 = 0;
    }

  }
  else
  {
    +[Libsysdiagnose addErrorString:WithCode:forError:](Libsysdiagnose, "addErrorString:WithCode:forError:", CFSTR("Failed to create the xpc_connection for fetching diagnosticIDs from remote device"), &unk_1E86548D8, a3);
    v15 = 0;
  }

  return v15;
}

+ (id)getSysdiagnoseCrashLog
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/"));
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0C99A90], *MEMORY[0x1E0C99AA8], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v2;
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v4, 5, &__block_literal_global_112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -600.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v7)
  {
    v29 = 0;
    v33 = 0;
    v31 = 0;
    goto LABEL_25;
  }
  v8 = v7;
  v29 = 0;
  v33 = 0;
  v31 = 0;
  v9 = *(_QWORD *)v37;
  v28 = *MEMORY[0x1E0C998E8];
  v10 = CFSTR("sysdiagnose");
  v32 = *(_QWORD *)v37;
  do
  {
    v11 = 0;
    v34 = v8;
    do
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "containsString:", v10) & 1) == 0)
        goto LABEL_9;
      objc_msgSend(v12, "absoluteString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "containsString:", CFSTR("sysdiagnose_helper")) & 1) != 0)
      {

LABEL_9:
LABEL_10:

        goto LABEL_19;
      }
      v17 = v10;
      v18 = v6;
      objc_msgSend(v12, "absoluteString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasSuffix:", CFSTR(".ips"));

      if (!v20)
        goto LABEL_17;
      v35 = 0;
      objc_msgSend(v12, "getResourceValue:forKey:error:", &v35, v28, 0);
      v21 = v35;

      if (objc_msgSend(v21, "compare:", v30) != 1)
      {
        v33 = v21;
LABEL_17:
        v6 = v18;
        v9 = v32;
        v10 = v17;
        goto LABEL_18;
      }
      v6 = v18;
      v10 = v17;
      if (!v31 || objc_msgSend(v29, "compare:", v21) != 1)
      {
        v22 = v12;

        v23 = v21;
        v13 = v29;
        v33 = v23;
        v29 = v23;
        v31 = v22;
        v9 = v32;
        v8 = v34;
        goto LABEL_10;
      }
      v33 = v21;
      v9 = v32;
LABEL_18:
      v8 = v34;
LABEL_19:
      ++v11;
    }
    while (v8 != v11);
    v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    v8 = v24;
  }
  while (v24);
LABEL_25:

  objc_msgSend(v31, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __40__Libsysdiagnose_getSysdiagnoseCrashLog__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1CB4B7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);

  }
  return 1;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB4B7000, log, OS_LOG_TYPE_ERROR, "More than 100 progress reported", v1, 2u);
}

@end
