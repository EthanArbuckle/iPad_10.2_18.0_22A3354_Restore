@implementation Querier

void __Querier_GetDNSServiceManager_block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **block;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;

  v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  switch(a2)
  {
    case 3:
      v20 = *(_QWORD *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1)
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      block = _NSConcreteStackBlock;
      v22 = 0x40000000;
      v23 = __mdns_dns_service_manager_apply_pending_updates_block_invoke;
      v24 = &__block_descriptor_tmp_39;
      v25 = v20;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 188);
      Querier_ProcessDNSServiceChanges(0);
      _Querier_LogDNSServices(*(_QWORD *)(a1 + 32));
      mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"Querier_GetDNSServiceManager_block_invoke", 191);
      break;
    case 2:
      os_release(*(void **)(a1 + 32));
      break;
    case 1:
      v19 = *(_QWORD *)(a1 + 32);
      if (_mdns_dns_service_queue_s_once != -1)
        dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
      block = _NSConcreteStackBlock;
      v22 = 0x40000000;
      v23 = __mdns_dns_service_manager_invalidate_block_invoke;
      v24 = &__block_descriptor_tmp_19_858;
      v25 = v19;
      dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, &block);
      if (Querier_GetDNSServiceManager_sDNSServiceManager
        && Querier_GetDNSServiceManager_sDNSServiceManager == *(_QWORD *)(a1 + 32))
      {
        os_release((void *)Querier_GetDNSServiceManager_sDNSServiceManager);
        Querier_GetDNSServiceManager_sDNSServiceManager = 0;
      }
      break;
  }
  KQueueUnlock((uint64_t)"DNS Service Manager event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_LogDNSServices_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  int v7;
  int v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v8 = *(_DWORD *)(a1 + 40);
      v10[0] = 67109634;
      v10[1] = v7;
      v11 = 1024;
      v12 = v8;
      v13 = 2112;
      v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DNS service (%u/%u) -- %@", (uint8_t *)v10, 0x18u);
    }
  }
  else
  {
    v4 = mDNSLogCategory_Default_redacted;
    if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
  }
  return 1;
}

void ___Querier_GetMyUUID_block_invoke(id a1)
{
  if (_Querier_GetMyPID_sOnce != -1)
    dispatch_once(&_Querier_GetMyPID_sOnce, &__block_literal_global_45);
  mdns_system_pid_to_uuid(_Querier_GetMyPID_sPID, _Querier_GetMyUUID_sUUID);
}

void ___Querier_GetMyPID_block_invoke(id a1)
{
  _Querier_GetMyPID_sPID = getpid();
}

void ___Querier_InternalQueue_block_invoke(id a1)
{
  _Querier_InternalQueue_sQueue = (uint64_t)dispatch_queue_create("com.apple.mDNSResponder.querier-support-queue", 0);
}

void ___Querier_EnsureNEDNSProxyStateWatchHasStarted_block_invoke(id a1)
{
  id v1;
  Block_layout *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[6];

  if (_Querier_InternalQueue_sOnce != -1)
    dispatch_once(&_Querier_InternalQueue_sOnce, &__block_literal_global_38);
  v1 = (id)_Querier_InternalQueue_sQueue;
  v2 = &__block_literal_global_35;
  v3 = objc_autoreleasePoolPush();
  if (objc_opt_class(NEDNSProxyManager))
  {
    v4 = _mdns_ne_dns_proxy_state_watch_queue();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __mdns_ne_dns_proxy_state_watch_start_block_invoke;
    v6[3] = &unk_10013BAE8;
    v6[4] = v1;
    v6[5] = &__block_literal_global_35;
    dispatch_async(v5, v6);

  }
  objc_autoreleasePoolPop(v3);

}

void ___Querier_StartNEDNSProxyStateWatch_block_invoke(id a1, BOOL a2)
{
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  _QWORD *j;
  _QWORD *k;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BOOL4 v27;

  v2 = a2;
  v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if ((((gNEDNSProxyIsRunning == 0) ^ v2) & 1) != 0)
    goto LABEL_23;
  gNEDNSProxyIsRunning = v2;
  v18 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v26 = 67109120;
    v27 = v2;
    goto LABEL_11;
  }
  v18 = mDNSLogCategory_Default_redacted;
  if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 67109120;
    v27 = v2;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "NEDNSProxy state update -- running: %{mdns:yesno}d", (uint8_t *)&v26, 8u);
  }
LABEL_12:
  mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_StartNEDNSProxyStateWatch_block_invoke", 104);
  Querier_ProcessDNSServiceChanges(0);
  for (i = 0; i != 499; ++i)
  {
    for (j = (_QWORD *)mDNSStorage[i + 34]; j; j = (_QWORD *)*j)
    {
      for (k = (_QWORD *)j[2]; k; k = (_QWORD *)*k)
      {
        v24 = k[7];
        if (v24)
        {
          v25 = *(_QWORD *)(v24 + 24);
          if (v25)
          {
            if (*(_BYTE *)(v25 + 281) == 1)
              mDNS_PurgeCacheResourceRecord((unsigned int *)mDNSStorage, (uint64_t)k);
          }
        }
      }
    }
  }
  mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"_Querier_StartNEDNSProxyStateWatch_block_invoke", 131);
LABEL_23:
  KQueueUnlock((uint64_t)"NetworkExtension DNS proxy state update", v11, v12, v13, v14, v15, v16, v17);
}

BOOL __Querier_HandleUnicastQuestion_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;

  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a2 + 32) == *(_QWORD *)(v3 + 80))
  {
    v5 = *(_QWORD *)(a2 + 88);
    if (mdns_querier_match(v5, (unsigned __int8 *)(v3 + 376), *(unsigned __int16 *)(v3 + 342), *(unsigned __int16 *)(v3 + 344)))
    {
      v6 = *(unsigned __int8 *)(v5 + 70);
      v7 = *(unsigned __int8 *)(a1 + 48);
      v8 = (v6 >> 2) & 1;
      v9 = (v6 >> 1) & 1;
      if (v7 == v8 && v7 == v9)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    }
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

void __Querier_HandleUnicastQuestion_block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)(uint64_t, _QWORD, uint64_t);
  uint64_t v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  int v20;
  int v22;
  __int16 v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  int v39;
  int v40;
  unsigned int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFSet *Mutable;
  uint64_t DNSQuestion;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  void *v57;
  _QWORD *v58;
  int v59;
  int v60;
  uint64_t DNSServiceManager;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  unsigned __int8 v65;
  uint8_t buf[8];
  _BYTE v67[24];
  uint64_t v68;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v3, v4, v5, v6, v7, v8, v9, v10);
  if (*(_BYTE *)(v2 + 255))
  {
    v11 = (_QWORD *)(v2 + 16);
    do
    {
      v11 = (_QWORD *)*v11;
      if (!v11)
        goto LABEL_13;
      v12 = (uint64_t (*)(uint64_t, _QWORD, uint64_t))v11[3];
    }
    while (!v12);
    v13 = v12(v2, 0, 1);
    if (!v13)
      goto LABEL_13;
    v14 = (void *)v13;
    v15 = mDNSLogCategory_Default;
    v16 = gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State;
    if (v16)
    {
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        free(v14);
        goto LABEL_25;
      }
    }
    else
    {
      v15 = mDNSLogCategory_Default_redacted;
      if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
    }
    v22 = *(_DWORD *)(v2 + 232);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)v67 = 2082;
    *(_QWORD *)&v67[2] = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Q%u] Handling concluded querier: %{public}s", buf, 0x12u);
    goto LABEL_24;
  }
LABEL_13:
  v17 = mDNSLogCategory_Default;
  if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
  {
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
  }
  else
  {
    v17 = mDNSLogCategory_Default_redacted;
    if (!os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
  }
  v20 = *(_DWORD *)(v2 + 232);
  *(_DWORD *)buf = 67109378;
  *(_DWORD *)&buf[4] = v20;
  *(_WORD *)v67 = 2112;
  *(_QWORD *)&v67[2] = v2;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Q%u] Handling concluded querier: %@", buf, 0x12u);
LABEL_25:
  v23 = *(_WORD *)(*(_QWORD *)(v2 + 32) + 276);
  v24 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 16) + 144);
  if (v24 >= 5)
    v25 = 0;
  else
    v25 = 0x203010100uLL >> (8 * v24);
  v26 = atomic_load((unsigned int *)(v2 + 208));
  if (v26 && *(_DWORD *)(*(_QWORD *)(v2 + 88) + 40) && v25)
  {
    v27 = 3;
    if (v25 == 1)
      v27 = 1;
    v28 = 2 * (v25 != 1);
    if ((v23 & 8) != 0)
      v28 = v27;
    if ((__int128 *)((char *)&s_dns_analytics + 104 * v28))
      *((_QWORD *)&s_dns_analytics + 13 * v28 + 2) += *(unsigned int *)(*(_QWORD *)(v2 + 88) + 40);
  }
  v29 = *(unsigned __int8 *)(v2 + 248);
  v30 = v29 - 1;
  if (v29 != 1)
  {
    v31 = *(_QWORD *)(v2 + 32);
    goto LABEL_69;
  }
  if (!*(_BYTE *)(v2 + 253))
  {
    v36 = *(_QWORD *)(v2 + 136);
    if (v36)
    {
      v37 = *(unsigned int *)(v36 + 40);
      if (v37)
      {
        if (v25)
        {
          v16 = v25 == 1;
          v38 = v25 != 1;
          v39 = 3;
          if (v16)
            v39 = 1;
          v40 = 2 * v38;
          if ((v23 & 8) != 0)
            v41 = v39;
          else
            v41 = v40;
          if ((__int128 *)((char *)&s_dns_analytics + 104 * v41))
            *((_QWORD *)&s_dns_analytics + 13 * v41 + 3) += v37;
        }
      }
    }
  }
  v31 = *(_QWORD *)(v2 + 32);
  if ((*(_WORD *)(v31 + 276) & 1) == 0)
  {
    v32 = *(_QWORD *)(v2 + 136);
    if (!v32)
    {
      v34 = 0;
      goto LABEL_64;
    }
    v33 = *(_QWORD *)(v32 + 40);
    v34 = v33;
    if (v33 >= 0x22F9)
    {
      v35 = mDNSLogCategory_Default;
      if (gSensitiveLoggingEnabled != 1 || mDNSLogCategory_Default == mDNSLogCategory_State)
      {
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_60:
          v42 = *(_DWORD *)(v2 + 232);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v42;
          *(_WORD *)v67 = 2048;
          *(_QWORD *)&v67[2] = v34;
          *(_WORD *)&v67[10] = 2048;
          v34 = 8952;
          *(_QWORD *)&v67[12] = 8952;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[Q%u] Large %lu-byte response will be truncated to fit mDNSCore's %lu-byte message buffer", buf, 0x1Cu);
          goto LABEL_62;
        }
      }
      else
      {
        v35 = mDNSLogCategory_Default_redacted;
        if (os_log_type_enabled((os_log_t)mDNSLogCategory_Default_redacted, OS_LOG_TYPE_DEFAULT))
          goto LABEL_60;
      }
      v34 = &unk_1000022F8;
    }
LABEL_62:
    v43 = *(_QWORD *)(v2 + 136);
    if (v43)
    {
      v44 = *(_QWORD *)(v43 + 32);
LABEL_65:
      __memcpy_chk(byte_10015DBF0, v44, v34, 27536);
      if ((*(_WORD *)(v31 + 276) & 0x2000) != 0)
        v45 = *(unsigned int *)(v31 + 256);
      else
        v45 = 0;
      mDNSCoreReceiveForQuerier((unint64_t)&byte_10015DBF0[v34], v2, (_QWORD *)v31, v45);
      goto LABEL_69;
    }
LABEL_64:
    v44 = 0;
    goto LABEL_65;
  }
LABEL_69:
  Mutable = (__CFSet *)_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet;
  if (_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet
    || (Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, (const CFSetCallBacks *)&gMDNSObjectSetCallbacks),
        (_Querier_GetOrphanedQuerierSet_sOrphanedQuerierSet = (uint64_t)Mutable) != 0))
  {
    CFSetRemoveValue(Mutable, (const void *)v2);
  }
  v65 = 0;
  DNSQuestion = Querier_GetDNSQuestion(v2, &v65);
  if (DNSQuestion)
  {
    v55 = DNSQuestion;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 64) + 16) + 144))
    {
      v56 = atomic_load((unsigned int *)(v2 + 208));
      *(_DWORD *)(DNSQuestion + 260) += v56;
    }
    v58 = (_QWORD *)(DNSQuestion + 96);
    v57 = *(void **)(DNSQuestion + 96);
    if (v57)
    {
      os_release(v57);
      *v58 = 0;
    }
    v59 = *(unsigned __int8 *)(v55 + 648);
    *(_BYTE *)(v55 + 648) = 0;
    if (!(*(unsigned __int8 *)(v55 + 354) | v65))
    {
      switch(v30)
      {
        case 0:
          if (v59)
            goto LABEL_80;
          goto LABEL_96;
        case 1:
LABEL_80:
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 969);
          Querier_HandleUnicastQuestion(v55);
          v60 = 971;
          goto LABEL_95;
        case 4:
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 916);
          *(_DWORD *)(v55 + 208) = dword_100158E08;
          *(_DWORD *)(v55 + 212) = 5000;
          SetNextQueryTime((uint64_t)mDNSStorage, v55);
          v60 = 920;
          goto LABEL_95;
        case 5:
          if ((*(_WORD *)(v31 + 276) & 0x800) == 0)
          {
            DNSServiceManager = Querier_GetDNSServiceManager();
            if (DNSServiceManager)
            {
              v62 = DNSServiceManager;
              if (_mdns_dns_service_queue_s_once != -1)
                dispatch_once(&_mdns_dns_service_queue_s_once, &__block_literal_global_237);
              *(_QWORD *)buf = _NSConcreteStackBlock;
              *(_QWORD *)v67 = 0x40000000;
              *(_QWORD *)&v67[8] = __mdns_dns_service_manager_apply_pending_connection_problem_updates_block_invoke;
              *(_QWORD *)&v67[16] = &__block_descriptor_tmp_40;
              v68 = v62;
              dispatch_sync((dispatch_queue_t)_mdns_dns_service_queue_s_queue, buf);
            }
          }
          mDNS_Lock_((unsigned int *)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", 937);
          mdns_client_replace((void **)(v55 + 96), (void *)v2);
          break;
        default:
          goto LABEL_96;
      }
      while (1)
      {
        mDNS_StopQuery_internal((uint64_t)mDNSStorage, v55);
        *(_BYTE *)(v55 + 649) = 1;
        mDNS_StartQuery_internal((uint64_t)mDNSStorage, v55);
        v63 = Querier_GetDNSQuestion(v2, &v65);
        v55 = v63;
        if (v63)
        {
          if (v65)
            break;
        }
        if (!v63)
          goto LABEL_94;
      }
      v64 = *(void **)(v63 + 96);
      if (v64)
      {
        os_release(v64);
        *(_QWORD *)(v55 + 96) = 0;
      }
LABEL_94:
      v60 = 958;
LABEL_95:
      mDNS_Unlock_((uint64_t)mDNSStorage, (uint64_t)"_Querier_HandleQuerierResponse", v60);
    }
  }
LABEL_96:
  KQueueUnlock((uint64_t)"_Querier_HandleQuerierResponse", v48, v49, v50, v51, v52, v53, v54);
  os_release(*(void **)(a1 + 32));
}

void __Querier_HandleUnicastQuestion_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage[0] + 616));
  *(_DWORD *)(mDNSStorage[0] + 680) = mDNSPlatformRawTime(v4, v5, v6, v7, v8, v9, v10, v11);
  if (a2 == 1)
  {
    _Querier_HandleSubscriberInvalidation(*(_QWORD *)(a1 + 32));
    os_release(*(void **)(a1 + 32));
  }
  else if (a2 == 2)
  {
    _Querier_ApplyUpdate(*(_QWORD **)(a1 + 32));
  }
  KQueueUnlock((uint64_t)"Subscriber event handler", v12, v13, v14, v15, v16, v17, v18);
}

uint64_t ___Querier_ApplyUpdate_block_invoke(uint64_t *a1, _DWORD *a2)
{
  int v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void (*v9)(_QWORD *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  __int16 v14;
  void *v15;
  __CFArray *v16;
  CFMutableArrayRef Mutable;
  uint64_t v18;
  __int16 v19;
  __int16 v20;
  const __CFArray *v21;
  unint64_t v22;
  int Count;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  const __CFArray *v27;
  CFIndex v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  const __CFArray *v32;
  CFIndex v33;
  uint64_t v34;
  CFIndex v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  size_t v39;
  uint64_t v40;
  __int16 v41;
  __int16 v42;
  size_t v43;
  uint64_t v44;
  const __CFArray *v45;
  const __CFArray *v46;
  const __CFArray *v47;
  unint64_t v48;
  _QWORD v50[5];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  __int128 v55;
  uint64_t v56;

  v4 = a2[10];
  if (v4 != -2)
  {
    if (v4 == -1)
    {
      _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 0);
      return 1;
    }
    v6 = (_QWORD *)gMessageBuilder;
    if (!gMessageBuilder)
    {
      v7 = _os_object_alloc(OS_mdns_message_builder, 64);
      if (!v7)
      {
        v5 = 0;
        gMessageBuilder = 0;
        return v5;
      }
      v6 = (_QWORD *)v7;
      v8 = &_mdns_message_builder_kind;
      *(_QWORD *)(v7 + 16) = &_mdns_message_builder_kind;
      do
      {
        v9 = (void (*)(_QWORD *))v8[2];
        if (v9)
          v9(v6);
        v8 = (_UNKNOWN **)*v8;
      }
      while (v8);
      gMessageBuilder = (uint64_t)v6;
    }
    _mdns_message_builder_forget_resources(v6);
    v6[7] = 0;
    v10 = gMessageBuilder;
    *(_WORD *)(gMessageBuilder + 56) = 0;
    *(_WORD *)(v10 + 58) |= 0x8400u;
    v11 = a1[4];
    if (v11 && (*(_WORD *)(v11 + 276) & 0x4000) == 0)
    {
      v12 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1[6] + 16) + 80))();
      v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1[6] + 16) + 88))();
      v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1[6] + 16) + 96))();
      if (v12)
        os_retain(v12);
      v15 = *(void **)(v10 + 24);
      if (v15)
        os_release(v15);
      *(_QWORD *)(v10 + 24) = v12;
      *(_WORD *)(v10 + 60) = v13;
      *(_WORD *)(v10 + 62) = v14;
      v10 = gMessageBuilder;
    }
    v16 = *(__CFArray **)(v10 + 32);
    if (v16)
    {
      if (CFArrayGetCount(*(CFArrayRef *)(v10 + 32)) >= 0xFFFF)
        goto LABEL_25;
    }
    else
    {
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, (const CFArrayCallBacks *)&mdns_cfarray_callbacks);
      if (!Mutable)
      {
LABEL_25:
        v18 = gMessageBuilder;
        v19 = *(_WORD *)(gMessageBuilder + 56);
        v20 = *(_WORD *)(gMessageBuilder + 58);
        v21 = *(const __CFArray **)(gMessageBuilder + 32);
        v22 = (unint64_t)(*(_QWORD *)(gMessageBuilder + 24) != 0) << 8;
        if (v21)
        {
          Count = CFArrayGetCount(v21);
          v24 = (Count << 8) & 0xFF0000;
          v25 = (Count << 24);
        }
        else
        {
          v25 = 0;
          v24 = 0;
        }
        v26 = v22 | v24 | v25;
        v27 = *(const __CFArray **)(v18 + 40);
        if (v27)
        {
          v28 = CFArrayGetCount(v27);
          v29 = (v28 << 24) & 0xFF00000000;
          v30 = (unint64_t)v28 << 40;
        }
        else
        {
          v30 = 0;
          v29 = 0;
        }
        v31 = v26 | v29;
        v32 = *(const __CFArray **)(v18 + 48);
        if (v32)
        {
          v33 = CFArrayGetCount(v32);
          v34 = (v33 << 40) & 0xFF000000000000;
          v35 = v33 << 56;
        }
        else
        {
          v35 = 0;
          v34 = 0;
        }
        v51 = 0;
        v52 = &v51;
        v53 = 0x3800000000;
        v54 = byte_10015DBF0;
        byte_10015DBF0[0] = HIBYTE(v19);
        byte_10015DBF1 = v19;
        byte_10015DBF2 = HIBYTE(v20);
        byte_10015DBF3 = v20;
        *(_QWORD *)&word_10015DBF4 = v31 | v30 | v34 | v35;
        v56 = 12;
        v55 = xmmword_100100970;
        v36 = *(_QWORD *)(v18 + 24);
        if (v36)
        {
          v37 = *(_QWORD *)(v36 + 32);
          v38 = 8940;
          if (v37 >= 0x22EC)
            v39 = 8940;
          else
            v39 = *(_QWORD *)(v36 + 32);
          if (v39)
          {
            memcpy(&unk_10015DBFC, *(const void **)(v36 + 24), v39);
            v40 = v39 + 12;
            *((_QWORD *)&v55 + 1) = v39 + 12;
            v38 = 8940 - v39;
          }
          else
          {
            v40 = 12;
          }
          v41 = *(_WORD *)(v18 + 60);
          v42 = *(_WORD *)(v18 + 62);
          LOBYTE(v50[0]) = HIBYTE(v41);
          BYTE1(v50[0]) = v41;
          BYTE2(v50[0]) = HIBYTE(v42);
          BYTE3(v50[0]) = v42;
          if (v38 >= 4)
            v43 = 4;
          else
            v43 = v38;
          if (v43)
          {
            memcpy((char *)&mDNSStorage[2501] + v40, v50, v43);
            *((_QWORD *)&v55 + 1) = v40 + v43;
          }
          v44 = v37 + 16;
          if (v37 >= 0xFFFFFFFFFFFFFFF0)
            v44 = -1;
          v56 = v44;
        }
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 0x40000000;
        v50[2] = __mdns_message_builder_write_message_block_invoke;
        v50[3] = &unk_100139A40;
        v50[4] = &v51;
        v45 = *(const __CFArray **)(v18 + 32);
        if (v45)
          mdns_cfarray_enumerate(v45, (uint64_t)v50);
        v46 = *(const __CFArray **)(v18 + 40);
        if (v46)
          mdns_cfarray_enumerate(v46, (uint64_t)v50);
        v47 = *(const __CFArray **)(v18 + 48);
        if (v47)
          mdns_cfarray_enumerate(v47, (uint64_t)v50);
        v48 = v52[6];
        _Block_object_dispose(&v51, 8);
        if (v48 <= 0x22F8)
          mDNSCoreReceiveForQuerier((unint64_t)mDNSStorage + &loc_100004E28 + v48, a1[6], (_QWORD *)a1[4], a1[5]);
        return 1;
      }
      v16 = Mutable;
      *(_QWORD *)(v10 + 32) = Mutable;
    }
    CFArrayAppendValue(v16, a2);
    goto LABEL_25;
  }
  v5 = 1;
  _Querier_RemoveRecord((uint64_t)a2, a1[4], a1[5], 1);
  return v5;
}

void __Querier_ProcessDNSServiceChangesAsync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = pthread_mutex_lock((pthread_mutex_t *)(mDNSStorage + 616));
  *(_DWORD *)(mDNSStorage + 680) = mDNSPlatformRawTime(v2, v3, v4, v5, v6, v7, v8, v9);
  mDNS_Lock_((unsigned int *)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1390);
  Querier_ProcessDNSServiceChanges(*(unsigned __int8 *)(a1 + 32));
  mDNS_Unlock_((uint64_t)&mDNSStorage, (uint64_t)"Querier_ProcessDNSServiceChangesAsync_block_invoke", 1392);
  KQueueUnlock((uint64_t)"Querier_ProcessDNSServiceChangesAsync", v10, v11, v12, v13, v14, v15, v16);
}

@end
