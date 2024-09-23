@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(id *a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  uint64_t *v35;
  _QWORD block[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__19;
  v59 = __Block_byref_object_dispose__19;
  v60 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__19;
  v53[4] = __Block_byref_object_dispose__19;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__19;
  v51[4] = __Block_byref_object_dispose__19;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__19;
  v49 = __Block_byref_object_dispose__19;
  v50 = 0;
  _ScheduledActivityQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___RegisterXPCActivity_block_invoke_2;
  block[3] = &unk_1E2AC7AD0;
  v37 = a1[4];
  v40 = &v61;
  v38 = a1[5];
  v41 = &v55;
  v42 = v53;
  v43 = v51;
  v44 = &v45;
  v39 = a1[6];
  dispatch_sync(v5, block);

  if (*((_BYTE *)v62 + 24))
  {
    if (state == 2)
    {
      PKLogFacilityTypeGetObject(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = a1[4];
        v17 = a1[5];
        *(_DWORD *)buf = 138412546;
        v66 = v17;
        v67 = 2112;
        v68 = v18;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Beginning Scheduled Activity: %@ for Client: %@", buf, 0x16u);
      }

      _ScheduledActivityQueue();
      v19 = objc_claimAutoreleasedReturnValue();
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = ___RegisterXPCActivity_block_invoke_200;
      v31[3] = &unk_1E2AC7AF8;
      v35 = &v45;
      v32 = a1[5];
      v33 = a1[4];
      v34 = a1[6];
      dispatch_async(v19, v31);

      v20 = v56[5];
      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = ___RegisterXPCActivity_block_invoke_201;
      v26[3] = &unk_1E2AC7B20;
      v28 = v51;
      v29 = v53;
      v27 = a1[5];
      v30 = &v45;
      dispatch_sync(v20, v26);
      if (!xpc_activity_set_state(v3, 5))
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v22 = a1[4];
          v21 = a1[5];
          *(_DWORD *)buf = 138412546;
          v66 = v21;
          v67 = 2112;
          v68 = v22;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to set Scheduled Activity: %@ for Client: %@ to DONE", buf, 0x16u);
        }

      }
      v7 = v32;
      goto LABEL_24;
    }
    if (!state)
    {
      v7 = xpc_activity_copy_criteria(v3);
      v8 = (void *)v46[5];
      if (v7)
      {
        objc_msgSend(v8, "xpcActivityCriteria");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = PDXPCDictionaryUpdateWithDictionary(v7, v9);

        if (!v10)
        {
          PKLogFacilityTypeGetObject(0);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v13 = a1[4];
            v12 = a1[5];
            *(_DWORD *)buf = 138412546;
            v66 = v12;
            v67 = 2112;
            v68 = v13;
            _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Preserving prior, identical XPC criteria for Scheduled Activity: %@ for Client: %@", buf, 0x16u);
          }

LABEL_24:
          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend(v8, "xpcActivityCriteria");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      PKLogFacilityTypeGetObject(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v25 = a1[4];
        v24 = a1[5];
        *(_DWORD *)buf = 138412546;
        v66 = v24;
        v67 = 2112;
        v68 = v25;
        _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Setting XPC criteria for Scheduled Activity: %@ for Client: %@", buf, 0x16u);
      }

      xpc_activity_set_criteria(v3, v7);
      goto LABEL_24;
    }
  }
  else if (state == 2 && !xpc_activity_set_state(v3, 5))
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[4];
      v14 = a1[5];
      *(_DWORD *)buf = 138412546;
      v66 = v14;
      v67 = 2112;
      v68 = v15;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Failed to set Scheduled Activity: %@ for Client: %@ to DONE", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_25:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
}

void ___RegisterXPCActivity_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _RegisteredClients();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "activityRegistrations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v3, "isValid");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activityQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(v3, "clientInstance");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(v5, "activityContext");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(v5, "activityCriteria");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v19)
  {
    objc_msgSend(v19, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceNow");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21 >= 0.0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
LABEL_6:
    PKLogFacilityTypeGetObject(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      v25 = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Removing invalid/expired Scheduled Activity: %@ for Client: %@", (uint8_t *)&v25, 0x16u);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
    _ArchiveRegisteredClients();
  }

}

void ___RegisterXPCActivity_block_invoke_200(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isRepeating")
    || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "endDate"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "timeIntervalSinceNow"),
        v4 = v3,
        v2,
        v4 < 0.0))
  {
    PKLogFacilityTypeGetObject(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Removing finished Scheduled Activity: %@ for Client: %@", (uint8_t *)&v11, 0x16u);
    }

    _RegisteredClients();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "activityRegistrations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

    xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"));
    _ArchiveRegisteredClients();

  }
  if (_TrimUnregisteredClients_onceToken != -1)
    dispatch_once(&_TrimUnregisteredClients_onceToken, &__block_literal_global_205);
}

uint64_t ___RegisterXPCActivity_block_invoke_201(_QWORD *a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "performScheduledActivityWithIdentifier:activityCriteria:activityContext:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  else
    return objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "performScheduledActivityWithIdentifier:activityCriteria:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

@end
