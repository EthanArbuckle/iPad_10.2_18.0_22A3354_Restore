uint64_t CSSearchAgentFieldNameCallback()
{
  return CSFriendlyFieldName();
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_213CF33E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CF3464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CF454C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t SDTraceAdd(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  if (SDTraceAdd_onceToken != -1)
    dispatch_once(&SDTraceAdd_onceToken, &__block_literal_global_105);
  if (a1 > 3)
    v14 = 0;
  else
    v14 = objc_msgSend(sSDTraceTypes[a1], "addLabel:identifier:duration:string:data:", v11, a3, v12, v13, a6);

  return v14;
}

void sub_213CF4DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213CF5410(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CF599C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id logForCSLogCategoryQuery()
{
  if (logForCSLogCategoryQuery_onceToken != -1)
    dispatch_once(&logForCSLogCategoryQuery_onceToken, &__block_literal_global_5);
  return (id)logForCSLogCategoryQuery_sQueryLog;
}

void wakeupTrigger(void *a1, int a2)
{
  void *v3;
  void *v4;

  +[SPQueryResultsQueue findResultsQueueWithIdentifier:](SPQueryResultsQueue, "findResultsQueueWithIdentifier:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
    objc_msgSend(v3, "_stopTracking");
  else
    objc_msgSend(v3, "_processResults");

}

void sub_213CF5BFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id logForCSLogCategoryDefault()
{
  if (logForCSLogCategoryDefault_onceToken != -1)
    dispatch_once(&logForCSLogCategoryDefault_onceToken, &__block_literal_global);
  return (id)logForCSLogCategoryDefault_log;
}

void sub_213CF5EAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CF6078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SDTransactionDone(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (v1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    v2 = (void *)os_transaction_copy_description();
    if (v2)
    {
      logForCSLogCategoryDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        SDTransactionDone_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

    }
    free(v2);
  }

}

void sub_213CF6694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_213CF6C50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CF6D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_213CF74C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_213CF8184(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 256);
  _Unwind_Resume(a1);
}

id SDTransactionCreate(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") > 1)
    objc_msgSend(v1, "componentsJoinedByString:", CFSTR("."));
  else
    objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.spotlight.%@"), v2);

  }
  else
  {
    v3 = CFSTR("com.apple.spotlight");
  }
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    SDTransactionCreate_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = objc_retainAutorelease(v3);
  -[__CFString UTF8String](v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  return v12;
}

void sub_213CFB20C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CFB9DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void SISynchedOpWithBlockPropagatingPriority(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = v6;
  *v5 = a1;
  v5[1] = v7;
  SISynchedOpPropagatingPriority();

}

void sub_213CFBDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213CFC55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213CFC640(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213CFC8D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void delayedOpBlockCompleteCallback(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  v4 = (void *)MEMORY[0x2199C2D78]();
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))a1[1];
  v5[2](v5, *a1, a2);
  free(a1);

  objc_autoreleasePoolPop(v4);
}

void sub_213CFDE10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213CFE1B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

id logForCSLogCategoryIndex()
{
  if (logForCSLogCategoryIndex_onceToken != -1)
    dispatch_once(&logForCSLogCategoryIndex_onceToken, &__block_literal_global_3);
  return (id)logForCSLogCategoryIndex_sIndexLog;
}

uint64_t _checkUnlock()
{
  double Current;
  uint64_t result;

  if (!deviceUnlocked)
  {
    pthread_mutex_lock(&_checkUnlock_sLastTimeLock);
    Current = CFAbsoluteTimeGetCurrent();
    if (*(double *)&_checkUnlock_sLastTime + 5.0 >= Current)
    {
      return pthread_mutex_unlock(&_checkUnlock_sLastTimeLock);
    }
    else
    {
      _checkUnlock_sLastTime = *(_QWORD *)&Current;
      pthread_mutex_unlock(&_checkUnlock_sLastTimeLock);
      return SIResumeForUnlock();
    }
  }
  return result;
}

void SIBackgroundOpBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = v6;
  *v5 = a1;
  v5[1] = v7;
  _SIScheduleBackgroundOperation();

}

void sub_213CFFBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  si_tracing_restore_current_span((uint64_t)&a31);
  si_tracing_restore_current_span(v31 - 176);
  _Unwind_Resume(a1);
}

BOOL checkBooleanEntitlement(__SecTask *a1, const __CFString *a2)
{
  void *v2;
  _BOOL8 v3;

  v2 = (void *)SecTaskCopyValueForEntitlement(a1, a2, 0);
  v3 = v2 == (void *)*MEMORY[0x24BDBD270];

  return v3;
}

void sub_213D00634(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D00F3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 176);
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D012B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  si_tracing_restore_current_span(v26 - 144);
  _Unwind_Resume(a1);
}

void sub_213D014FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D017C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D019EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

_QWORD *syncContextCreate(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD *v5;

  v3 = a1;
  v4 = a2;
  v5 = malloc_type_malloc(0x10uLL, 0xC0040D1025EB5uLL);
  *v5 = v3;
  v5[1] = v4;
  dispatch_group_enter(v3);
  return v5;
}

void sub_213D02834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D0348C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;
  uint64_t v32;
  __int128 v34;

  si_tracing_restore_current_span((uint64_t)&a31);
  v34 = *(_OWORD *)(v32 - 192);
  *(_OWORD *)v31 = *(_OWORD *)(v32 - 208);
  *(_OWORD *)(v31 + 16) = v34;
  *(_QWORD *)(v31 + 32) = *(_QWORD *)(v32 - 176);
  _Unwind_Resume(a1);
}

void _indexCrossedWorkBoundary(void *a1, double a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a1;
  v4 = v3;
  if (a2 > 1.0)
    objc_msgSend(v3, "dirty:", 0);
  if (a2 > 60.0)
  {
    v5 = sIndexQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___indexCrossedWorkBoundary_block_invoke;
    v7[3] = &unk_24D0EA758;
    v8 = v4;
    _setup_block(v7, 0, 3653);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, v6);

  }
}

void syncFinished(uint64_t a1)
{
  void *v2;
  dispatch_group_t v3;

  v3 = *(dispatch_group_t *)a1;
  dispatch_group_leave(*(dispatch_group_t *)a1);
  v2 = *(void **)(a1 + 8);
  SDTransactionDone(v2);
  free((void *)a1);

}

void sub_213D03D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  si_tracing_restore_current_span((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_213D04478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D04C3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void blockRoutine(const void *a1, int a2)
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))MEMORY[0x2199C2F34]();
  if (v5)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1000, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    v5[2](v5, v4);

  }
  if (a1)
    CFRelease(a1);

}

void sub_213D051E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D0531C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D05454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D05880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D06530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 a15, __int128 a16, uint64_t a17)
{
  uint64_t v17;

  *(_OWORD *)v17 = a15;
  *(_OWORD *)(v17 + 16) = a16;
  *(_QWORD *)(v17 + 32) = a17;
  _Unwind_Resume(exception_object);
}

void sub_213D0667C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D06DAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void duet_log_activity_stop()
{
  unint64_t v0;

  do
    v0 = __ldaxr(&sDASOutstanding);
  while (__stlxr(v0 - 1, &sDASOutstanding));
}

void duet_log_activity_start(int a1)
{
  if (a1 == 2)
    duet_log_activity_start_for_processes(&unk_24D0FCE80);
  else
    duet_log_activity_start_for_processes(&unk_24D0FCE98);
}

void duet_log_activity_start_for_processes(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  do
    v3 = __ldaxr(&sDASOutstanding);
  while (__stlxr(v3 + 1, &sDASOutstanding));
  if (!v3)
  {
    do
      v4 = __ldaxr(sDASStarted);
    while (__stlxr(1u, sDASStarted));
    if ((v4 & 1) == 0)
    {
      v8 = MEMORY[0x24BDAC760];
      v9 = 3221225472;
      v10 = __duet_log_activity_start_for_processes_block_invoke;
      v11 = &unk_24D0EA758;
      v5 = v1;
      v12 = v5;
      if (duet_log_activity_start_for_processes_onceToken != -1)
        dispatch_once(&duet_log_activity_start_for_processes_onceToken, &v8);
      dispatch_resume((dispatch_object_t)duet_log_activity_start_for_processes_timer);
      v13 = *MEMORY[0x24BE2E2C8];
      v14[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v8, v9, v10, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE2E228], "sharedScheduler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activityStartedWithParameters:", v6);

    }
  }

}

void __duet_log_activity_start_for_processes_block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;

  dispatch_get_global_queue(5, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v2);
  v4 = (void *)duet_log_activity_start_for_processes_timer;
  duet_log_activity_start_for_processes_timer = (uint64_t)v3;

  v5 = duet_log_activity_start_for_processes_timer;
  v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0x2540BE400uLL, 0x2540BE400uLL);
  v7 = duet_log_activity_start_for_processes_timer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __duet_log_activity_start_for_processes_block_invoke_2;
  handler[3] = &unk_24D0EA758;
  v9 = *(id *)(a1 + 32);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_suspend((dispatch_object_t)duet_log_activity_start_for_processes_timer);
  dispatch_activate((dispatch_object_t)duet_log_activity_start_for_processes_timer);

}

void __duet_log_activity_start_for_processes_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (!atomic_load(&sDASOutstanding))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v5 = *MEMORY[0x24BE2E2C8];
    v6[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2E228], "sharedScheduler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityStoppedWithParameters:", v3);

    dispatch_suspend((dispatch_object_t)duet_log_activity_start_for_processes_timer);
    atomic_store(0, sDASStarted);

  }
}

void __logForCSLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "default");
  v1 = (void *)logForCSLogCategoryDefault_log;
  logForCSLogCategoryDefault_log = (uint64_t)v0;

}

void __logForCSLogCategoryIndex_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "index");
  v1 = (void *)logForCSLogCategoryIndex_sIndexLog;
  logForCSLogCategoryIndex_sIndexLog = (uint64_t)v0;

}

void __logForCSLogCategoryQuery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "query");
  v1 = (void *)logForCSLogCategoryQuery_sQueryLog;
  logForCSLogCategoryQuery_sQueryLog = (uint64_t)v0;

}

id logForCSLogCategoryRecs()
{
  if (logForCSLogCategoryRecs_onceToken != -1)
    dispatch_once(&logForCSLogCategoryRecs_onceToken, &__block_literal_global_7);
  return (id)logForCSLogCategoryRecs_sRecsLog;
}

void __logForCSLogCategoryRecs_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "recs");
  v1 = (void *)logForCSLogCategoryRecs_sRecsLog;
  logForCSLogCategoryRecs_sRecsLog = (uint64_t)v0;

}

id logForCSLogCategoryUA()
{
  if (logForCSLogCategoryUA_onceToken != -1)
    dispatch_once(&logForCSLogCategoryUA_onceToken, &__block_literal_global_9);
  return (id)logForCSLogCategoryUA_sUALog;
}

void __logForCSLogCategoryUA_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "ua");
  v1 = (void *)logForCSLogCategoryUA_sUALog;
  logForCSLogCategoryUA_sUALog = (uint64_t)v0;

}

id logForCSLogCategoryPersonalization()
{
  if (logForCSLogCategoryPersonalization_onceToken != -1)
    dispatch_once(&logForCSLogCategoryPersonalization_onceToken, &__block_literal_global_11);
  return (id)logForCSLogCategoryPersonalization_sPersonalizationLog;
}

void __logForCSLogCategoryPersonalization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "personalization");
  v1 = (void *)logForCSLogCategoryPersonalization_sPersonalizationLog;
  logForCSLogCategoryPersonalization_sPersonalizationLog = (uint64_t)v0;

}

id logForCSLogCategoryPhotosQU()
{
  if (logForCSLogCategoryPhotosQU_onceToken != -1)
    dispatch_once(&logForCSLogCategoryPhotosQU_onceToken, &__block_literal_global_13);
  return (id)logForCSLogCategoryPhotosQU_queryUnderstandingLog;
}

void __logForCSLogCategoryPhotosQU_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "PhotosQueryUnderstanding");
  v1 = (void *)logForCSLogCategoryPhotosQU_queryUnderstandingLog;
  logForCSLogCategoryPhotosQU_queryUnderstandingLog = (uint64_t)v0;

}

id logForCSLogCategoryDaemonClient()
{
  if (logForCSLogCategoryDaemonClient_onceToken != -1)
    dispatch_once(&logForCSLogCategoryDaemonClient_onceToken, &__block_literal_global_15);
  return (id)logForCSLogCategoryDaemonClient_sDaemonClientLog;
}

void __logForCSLogCategoryDaemonClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.corespotlight", "SpotlightDaemonClient");
  v1 = (void *)logForCSLogCategoryDaemonClient_sDaemonClientLog;
  logForCSLogCategoryDaemonClient_sDaemonClientLog = (uint64_t)v0;

}

id CSRedactString(void *a1, int a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1)
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_22);
  if (CSShouldRedactForPrivacy_shouldObfuscate && (v4 = objc_msgSend(v3, "length"), v4 > 4))
  {
    v6 = v4;
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "substringToIndex:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (a2)
    {
      objc_msgSend(v3, "substringFromIndex:", v6 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...%@<%lu chars>"), v9, v10, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@...<%lu chars>"), v8, v6);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

id CSRedactStringArray(void *a1, int a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1)
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_22);
  if (CSShouldRedactForPrivacy_shouldObfuscate)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
        v5 = v3;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v15;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v15 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
              if (v10)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  CSRedactString(v10, a2);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "addObject:", v11, (_QWORD)v14);

                }
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          }
          while (v7);
        }

      }
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4, (_QWORD)v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

void sub_213D07EE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D08B64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D08C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_213D08C58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void startAgents(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a1;
  v3 = +[MDAgent sharedAgent](MDAgent, "sharedAgent");
  +[SpotlightSender setup](SpotlightSender, "setup");
  if (a2)
  {
    objc_msgSend(v10, "searchServiceName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSSearchAgent searchAgent:serviceName:](CSSearchAgent, "searchAgent:serviceName:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIndexer:", v10);
    objc_msgSend(v5, "startListener");

  }
  objc_msgSend(v10, "indexServiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSIndexAgent indexAgent:serviceName:](CSIndexAgent, "indexAgent:serviceName:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIndexer:", v10);
  objc_msgSend(v7, "startListener");
  objc_msgSend(v10, "delegateServiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSIndexAgent indexDelegateAgent:](CSIndexAgent, "indexDelegateAgent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIndexer:", v10);
  objc_msgSend(v9, "startListener");

}

void startAllAgents(void *a1)
{
  startAgents(a1, 1);
}

void startIndexAgent(void *a1)
{
  startAgents(a1, 0);
}

void suspendAllAgents()
{
  void *v0;
  id v1;

  +[CSIndexAgent indexAgent](CSIndexAgent, "indexAgent");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "suspend");

  +[CSSearchAgent searchAgent](CSSearchAgent, "searchAgent");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "suspend");

}

void resumeAllAgents()
{
  void *v0;
  id v1;

  +[CSIndexAgent indexAgent](CSIndexAgent, "indexAgent");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resume");

  +[CSSearchAgent searchAgent](CSSearchAgent, "searchAgent");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resume");

}

void sub_213D0A0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id SDTraceDescription(uint64_t a1)
{
  void *v2;

  if (a1 > 3)
  {
    v2 = 0;
  }
  else if (objc_msgSend(sSDTraceTypes[a1], "current") == -1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(sSDTraceTypes[a1], "description");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t _getDeviceMigrationComplete()
{
  void *v0;
  char v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2B620], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isDeviceUsingEphemeralStorage");

  if ((v1 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x24BE2B620], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2B620], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastBuildVersionPref");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(MEMORY[0x24BE2B620], "isBuildVersion:equalToBuildVersion:", v4, v6);
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_213CF1000, v7, OS_LOG_TYPE_DEFAULT, "[LOCK] MD current:%@ last: %@", (uint8_t *)&v9, 0x16u);
  }

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id _setup_block(void *a1, char a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  qos_class_t v8;
  char v9;
  dispatch_block_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  int v19;

  v5 = a1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = ___setup_block_block_invoke;
  v17[3] = &unk_24D0ED950;
  v18 = v5;
  v19 = a3;
  v6 = v5;
  v7 = (void *)MEMORY[0x2199C2F34](v17);
  v8 = qos_class_self();
  if (v8 > QOS_CLASS_BACKGROUND)
    v9 = a2;
  else
    v9 = 0;
  if ((v9 & 1) != 0 || v8 >= 0x1A)
    v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v7);
  else
    v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  v14 = v10;
  v15 = (void *)MEMORY[0x2199C2F34](v10, v11, v12, v13);

  return v15;
}

uint64_t BulkDeleteAttributes(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  if (a3 >= 1)
  {
    v3 = a3;
    v5 = result;
    do
    {
      v6 = *a2++;
      result = MEMORY[0x2199C22A4](v5, v6);
      --v3;
    }
    while (v3);
  }
  return result;
}

void unpauseCallback(void *a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 134217984;
    v4 = a1;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Resume queue:%p", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(a1, "resumeResults");
}

void sub_213D11A64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_213D12E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D131CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void unpauseIfSystemInGoodStateCallback(void *a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 134217984;
    v4 = a1;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Resume queue:%p", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(a1, "resumeResultsIfSystemInGoodState");
}

void SISynchedOpWithBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  v6 = (void *)objc_msgSend(v4, "copy");

  v7 = v6;
  *v5 = a1;
  v5[1] = v7;
  SISynchedOp();

}

void sub_213D13E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D14284(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void queryPowerState()
{
  CFTypeRef v0;
  const void *v1;
  CFStringRef v2;
  int v3;
  int v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v0 = IOPSCopyPowerSourcesInfo();
  if (v0)
  {
    v1 = v0;
    v2 = IOPSGetProvidingPowerSourceType(v0);
    v3 = gIsSystemOnBattery;
    if (v2)
      v4 = CFEqual(v2, CFSTR("Battery Power")) != 0;
    else
      v4 = 0;
    gIsSystemOnBattery = v4;
    if (v3 != v4)
    {
      logForCSLogCategoryIndex();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = "on battery";
        if (v3)
          v7 = "on battery";
        else
          v7 = "not on battery";
        if (!gIsSystemOnBattery)
          v6 = "not on battery";
        v8 = 136315394;
        v9 = v7;
        v10 = 2080;
        v11 = v6;
        _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_INFO, "System power state change was %s is %s", (uint8_t *)&v8, 0x16u);
      }

    }
    CFRelease(v1);
  }
}

void relatedItemCallback(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  SPUAProgressItem *v11;

  if (a2 && a3)
  {
    if (a4)
    {
      v8 = a4;
      v9 = a3;
      v10 = a2;
      v11 = -[SPUAProgressItem initWithBundleID:uaID:relatedID:]([SPUAProgressItem alloc], "initWithBundleID:uaID:relatedID:", v10, v8, v9);

      -[SPUAProgressItem update:](v11, "update:", a5);
    }
  }
}

uint64_t copyBundleRemapCallback(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)sIndexer, "fileProviderExtensionToAppBundleMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_213D150C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D15404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D15F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D167AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D16C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D16D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D17118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D17630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  uint64_t v16;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 168));
  _Unwind_Resume(a1);
}

void sub_213D17A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_213D180F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D18700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak((id *)(v28 - 120));
  _Unwind_Resume(a1);
}

void sub_213D18C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;

  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 160), 8);
  _Unwind_Resume(a1);
}

id indexOpenRecordPath()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)sDelegate, "indexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/indexOpenRecord.plist"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id newIndexOpensDict()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, CFSTR("pcA_lastOpen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("pcB_lastOpen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v3, CFSTR("pcC_lastOpen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("pcCX_lastOpen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, CFSTR("pcPriority_lastOpen"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, CFSTR("pcA_lastAnalytics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v7, CFSTR("pcB_lastAnalytics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v8, CFSTR("pcC_lastAnalytics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, CFSTR("pcCX_lastAnalytics"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v10, CFSTR("pcPriority_lastAnalytics"));

  return v0;
}

id indexHeartbeatPath()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)sDelegate, "indexDirectory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/heartbeat.plist"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id newHeartbeatDict()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  int v32;
  NSObject *v33;
  __darwin_time_t tv_sec;
  void *v35;
  void *v36;
  stat v38;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, CFSTR("pcA_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("pcB_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v3, CFSTR("pcC_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v4, CFSTR("pcCX_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, CFSTR("pcPriority_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, CFSTR("pcA_wipes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v7, CFSTR("pcB_wipes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v8, CFSTR("pcC_wipes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, CFSTR("pcCX_wipes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v10, CFSTR("pcPriority_wipes"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v11, CFSTR("pcA_wipes_aggregate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v12, CFSTR("pcB_wipes_aggregate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v13, CFSTR("pcC_wipes_aggregate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v14, CFSTR("pcCX_wipes_aggregate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v15, CFSTR("pcPriority_wipes_aggregate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v16, CFSTR("pcA_obj_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v17, CFSTR("pcB_obj_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v18, CFSTR("pcC_obj_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v19, CFSTR("pcCX_obj_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v20, CFSTR("pcPriority_obj_count"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v21, CFSTR("rootsinstalled"));

  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("spotlightversion"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("previousspotlightversion"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v22, CFSTR("vectorindexon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v23, CFSTR("timesinceboot"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v24, CFSTR("timesinceupdate"));

  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("build"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", CFSTR("unknown"), CFSTR("previousbuild"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v25, CFSTR("textsemanticsearchon"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v26, CFSTR("embeddingdonationon"));

  v27 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSince1970");
  objc_msgSend(v27, "numberWithLong:", (uint64_t)v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v30, CFSTR("heartbeat_age"));

  memset(&v38.st_birthtimespec, 0, 64);
  objc_msgSend((id)sDelegate, "indexDirectory", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(v28) = stat((const char *)objc_msgSend(v31, "UTF8String"), &v38);

  v32 = *__error();
  if ((_DWORD)v28)
  {
    logForCSLogCategoryDefault();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      newHeartbeatDict_cold_1();

    tv_sec = -1;
  }
  else
  {
    tv_sec = v38.st_birthtimespec.tv_sec;
  }
  *__error() = v32;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", tv_sec);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v35, CFSTR("parentDirectory_age"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v36, CFSTR("lastSent"));

  return v0;
}

uint64_t protectionClassForAnalytics(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CE8]) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CE0]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Priority")) & 1) != 0)
  {
    v2 = 5;
  }
  else
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      protectionClassForAnalytics_cold_1(v1, v3);

    v2 = 0;
  }

  return v2;
}

void sub_213D1C000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D1C474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D1DA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t protectionClassIntValue(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDD0CE8]))
  {
    v2 = 7;
  }
  else
  {
    v2 = 3;
  }

  return v2;
}

void sub_213D1F488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x218]);
  _Unwind_Resume(a1);
}

void sub_213D20F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D21DE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D22FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void processReverseInfo(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE *v14;
  size_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a2 <= 510)
  {
    *(_QWORD *)(a1 + 8 * (511 - a2)) = objc_msgSend(v11, "integerValue");
    MEMORY[0x24BDAC7A8]();
    v14 = (char *)&v32 - v13;
    bzero((char *)&v32 - v13, v15);
    *v14 = 0;
    v16 = v14;
    if ((a2 & 0x80000000) == 0)
    {
      v17 = a2;
      v16 = v14;
      do
      {
        v18 = *(_QWORD *)(a1 + 8 * ~a2 + 4096 + 8 * v17);
        *v16 = 47;
        v19 = -1;
        v20 = 1;
        v21 = v18;
        do
        {
          v22 = v20;
          v23 = v21 + 9;
          v21 /= 10;
          ++v19;
          ++v20;
        }
        while (v23 > 0x12);
        do
        {
          v16[v22--] = v18 % 10 + 48;
          v18 /= 10;
        }
        while (v22 > 0);
        v16 += v19 + 2;
      }
      while (v17-- > 0);
    }
    *v16 = 0;
    objc_msgSend(v9, "appendFormat:", CFSTR("%s\n"), v14);
    objc_msgSend(v10, "objectForKeyedSubscript:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (a2 + 1);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v33 = 0u;
        v32 = 0u;
        v27 = v25;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v33;
          do
          {
            v31 = 0;
            do
            {
              if (*(_QWORD *)v33 != v30)
                objc_enumerationMutation(v27);
              processReverseInfo(a1, v26, v9, v10, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v31++));
            }
            while (v29 != v31);
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          }
          while (v29);
        }

      }
      else
      {
        processReverseInfo(a1, v26, v9, v10, v25);
      }
    }

  }
}

void sub_213D25834(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Unwind_Resume(a1);
}

id SPLogDirectory()
{
  if (SPLogDirectory_onceToken != -1)
    dispatch_once(&SPLogDirectory_onceToken, &__block_literal_global_2565);
  return (id)SPLogDirectory_sSPLogDirectory;
}

void sub_213D271D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D2739C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void processItemsForImport(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_group_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  __CFString *v35;
  NSObject *v36;
  dispatch_group_t v37;
  char v38;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v18;
  if (v18)
    dispatch_group_enter(v18);
  v20 = dispatch_group_create();
  v21 = gImportQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __processItemsForImport_block_invoke;
  block[3] = &unk_24D0ED998;
  v30 = v14;
  v31 = v16;
  v32 = v17;
  v33 = v13;
  v34 = v15;
  v35 = CFSTR("com.apple.CoreSpotlight.ImportExtension");
  v36 = v19;
  v37 = v20;
  v38 = a7;
  v22 = v20;
  v23 = v19;
  v24 = v15;
  v25 = v13;
  v26 = v17;
  v27 = v16;
  v28 = v14;
  dispatch_async(v21, block);

}

void sub_213D28B90(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_213D2AE24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x498], 8);
  _Block_object_dispose(&STACK[0x4B8], 8);
  _Unwind_Resume(a1);
}

void setClientStateForIndexing(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  const void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __setClientStateForIndexing_block_invoke;
  v39[3] = &unk_24D0ED848;
  v17 = v16;
  v40 = v17;
  v18 = v15;
  v41 = v18;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199C2F34](v39);
  if (objc_msgSend(v12, "length"))
  {
    if (v13)
    {
      v38 = v11;
      v20 = v11;
      v21 = v12;
      v35 = v13;
      v22 = v13;
      v33 = v19;
      v37 = v14;
      v23 = v14;
      objc_msgSend((id)objc_opt_class(), "_stateInfoAttributeNameWithClientStateName:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v45[0] = CFSTR("_kMDItemBundleID");
      v45[1] = CFSTR("_kMDItemExternalID");
      v46[0] = CFSTR("com.apple.searchd");
      v46[1] = v21;
      v36 = v21;
      v45[2] = v24;
      v46[2] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = ___setClientStateInner_block_invoke;
      v42[3] = &unk_24D0ED848;
      v27 = v20;
      v43 = v27;
      v28 = v33;
      v44 = v28;
      v29 = (const void *)objc_msgSend(v42, "copy");
      if (!SISetCSAttributes())
      {
        v34 = v24;
        if (v28)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v28 + 2))(v28, v30);

        }
        CFRelease(v29);
        v24 = v34;
      }

      v14 = v37;
      v11 = v38;
      v13 = v35;
    }
    else
    {
      logForCSLogCategoryIndex();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        setClientStateForIndexing_cold_1();

      if (v19)
        v19[2](v19, 0);
    }
  }
  else if (v19)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC1950], -1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v19)[2](v19, v31);

  }
}

void sub_213D2DBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_213D2FFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_213D30D08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213D31078(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213D311B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213D33374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D33E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;

  objc_destroyWeak(v30);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void si_dispatch_leave_routine(dispatch_group_t group)
{
  if (group)
    dispatch_group_leave(group);
}

void sub_213D3573C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_213D36B14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_213D3927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_213D39448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D39580(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *uuidBytesToString(unsigned __int8 *result, _BYTE *a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  char v5;
  char v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  char v10;
  char v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  char v15;
  char v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  char v20;
  char v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  char v25;
  char v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  char v30;
  char v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  char v35;
  char v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  char v40;
  char v41;
  unsigned int v42;
  int v43;
  unsigned int v44;
  char v45;
  char v46;
  unsigned int v47;
  int v48;
  unsigned int v49;
  char v50;
  char v51;
  unsigned int v52;
  int v53;
  unsigned int v54;
  char v55;
  char v56;
  unsigned int v57;
  int v58;
  unsigned int v59;
  char v60;
  char v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  char v65;
  char v66;
  unsigned int v67;
  int v68;
  unsigned int v69;
  char v70;
  char v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  char v75;
  char v76;
  unsigned int v77;
  int v78;
  unsigned int v79;
  char v80;
  char v81;

  v2 = *result;
  v3 = (v2 >> 4) + 55;
  if (v2 < 0xA0)
    LOBYTE(v3) = (*result >> 4) | 0x30;
  *a2 = v3;
  v4 = v2 & 0xF;
  v5 = v2 & 0xF | 0x30;
  v6 = (v2 & 0xF) + 55;
  if (v4 < 0xA)
    v6 = v5;
  a2[1] = v6;
  v7 = result[1];
  v8 = (v7 >> 4) + 55;
  if (v7 < 0xA0)
    LOBYTE(v8) = (result[1] >> 4) | 0x30;
  a2[2] = v8;
  v9 = v7 & 0xF;
  v10 = v7 & 0xF | 0x30;
  v11 = (v7 & 0xF) + 55;
  if (v9 < 0xA)
    v11 = v10;
  a2[3] = v11;
  v12 = result[2];
  v13 = (v12 >> 4) + 55;
  if (v12 < 0xA0)
    LOBYTE(v13) = (result[2] >> 4) | 0x30;
  a2[4] = v13;
  v14 = v12 & 0xF;
  v15 = v12 & 0xF | 0x30;
  v16 = (v12 & 0xF) + 55;
  if (v14 < 0xA)
    v16 = v15;
  a2[5] = v16;
  v17 = result[3];
  v18 = (v17 >> 4) + 55;
  if (v17 < 0xA0)
    LOBYTE(v18) = (result[3] >> 4) | 0x30;
  a2[6] = v18;
  v19 = v17 & 0xF;
  v20 = v17 & 0xF | 0x30;
  v21 = (v17 & 0xF) + 55;
  if (v19 < 0xA)
    v21 = v20;
  a2[7] = v21;
  a2[8] = 45;
  v22 = result[4];
  v23 = (v22 >> 4) + 55;
  if (v22 < 0xA0)
    LOBYTE(v23) = (result[4] >> 4) | 0x30;
  a2[9] = v23;
  v24 = v22 & 0xF;
  v25 = v22 & 0xF | 0x30;
  v26 = (v22 & 0xF) + 55;
  if (v24 < 0xA)
    v26 = v25;
  a2[10] = v26;
  v27 = result[5];
  v28 = (v27 >> 4) + 55;
  if (v27 < 0xA0)
    LOBYTE(v28) = (result[5] >> 4) | 0x30;
  a2[11] = v28;
  v29 = v27 & 0xF;
  v30 = v27 & 0xF | 0x30;
  v31 = (v27 & 0xF) + 55;
  if (v29 < 0xA)
    v31 = v30;
  a2[12] = v31;
  a2[13] = 45;
  v32 = result[6];
  v33 = (v32 >> 4) + 55;
  if (v32 < 0xA0)
    LOBYTE(v33) = (result[6] >> 4) | 0x30;
  a2[14] = v33;
  v34 = v32 & 0xF;
  v35 = v32 & 0xF | 0x30;
  v36 = (v32 & 0xF) + 55;
  if (v34 < 0xA)
    v36 = v35;
  a2[15] = v36;
  v37 = result[7];
  v38 = (v37 >> 4) + 55;
  if (v37 < 0xA0)
    LOBYTE(v38) = (result[7] >> 4) | 0x30;
  a2[16] = v38;
  v39 = v37 & 0xF;
  v40 = v37 & 0xF | 0x30;
  v41 = (v37 & 0xF) + 55;
  if (v39 < 0xA)
    v41 = v40;
  a2[17] = v41;
  a2[18] = 45;
  v42 = result[8];
  v43 = (v42 >> 4) + 55;
  if (v42 < 0xA0)
    LOBYTE(v43) = (result[8] >> 4) | 0x30;
  a2[19] = v43;
  v44 = v42 & 0xF;
  v45 = v42 & 0xF | 0x30;
  v46 = (v42 & 0xF) + 55;
  if (v44 < 0xA)
    v46 = v45;
  a2[20] = v46;
  v47 = result[9];
  v48 = (v47 >> 4) + 55;
  if (v47 < 0xA0)
    LOBYTE(v48) = (result[9] >> 4) | 0x30;
  a2[21] = v48;
  v49 = v47 & 0xF;
  v50 = v47 & 0xF | 0x30;
  v51 = (v47 & 0xF) + 55;
  if (v49 < 0xA)
    v51 = v50;
  a2[22] = v51;
  a2[23] = 45;
  v52 = result[10];
  v53 = (v52 >> 4) + 55;
  if (v52 < 0xA0)
    LOBYTE(v53) = (result[10] >> 4) | 0x30;
  a2[24] = v53;
  v54 = v52 & 0xF;
  v55 = v52 & 0xF | 0x30;
  v56 = (v52 & 0xF) + 55;
  if (v54 < 0xA)
    v56 = v55;
  a2[25] = v56;
  v57 = result[11];
  v58 = (v57 >> 4) + 55;
  if (v57 < 0xA0)
    LOBYTE(v58) = (result[11] >> 4) | 0x30;
  a2[26] = v58;
  v59 = v57 & 0xF;
  v60 = v57 & 0xF | 0x30;
  v61 = (v57 & 0xF) + 55;
  if (v59 < 0xA)
    v61 = v60;
  a2[27] = v61;
  v62 = result[12];
  v63 = (v62 >> 4) + 55;
  if (v62 < 0xA0)
    LOBYTE(v63) = (result[12] >> 4) | 0x30;
  a2[28] = v63;
  v64 = v62 & 0xF;
  v65 = v62 & 0xF | 0x30;
  v66 = (v62 & 0xF) + 55;
  if (v64 < 0xA)
    v66 = v65;
  a2[29] = v66;
  v67 = result[13];
  v68 = (v67 >> 4) + 55;
  if (v67 < 0xA0)
    LOBYTE(v68) = (result[13] >> 4) | 0x30;
  a2[30] = v68;
  v69 = v67 & 0xF;
  v70 = v67 & 0xF | 0x30;
  v71 = (v67 & 0xF) + 55;
  if (v69 < 0xA)
    v71 = v70;
  a2[31] = v71;
  v72 = result[14];
  v73 = (v72 >> 4) + 55;
  if (v72 < 0xA0)
    LOBYTE(v73) = (result[14] >> 4) | 0x30;
  a2[32] = v73;
  v74 = v72 & 0xF;
  v75 = v72 & 0xF | 0x30;
  v76 = (v72 & 0xF) + 55;
  if (v74 < 0xA)
    v76 = v75;
  a2[33] = v76;
  v77 = result[15];
  v78 = (v77 >> 4) + 55;
  if (v77 < 0xA0)
    LOBYTE(v78) = (result[15] >> 4) | 0x30;
  a2[34] = v78;
  v79 = v77 & 0xF;
  v80 = v77 & 0xF | 0x30;
  v81 = (v77 & 0xF) + 55;
  if (v79 >= 0xA)
    v80 = v81;
  a2[35] = v80;
  a2[36] = 0;
  return result;
}

void sub_213D3D5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, uint64_t a14, id *a15)
{
  id *v15;
  id *v16;
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)&STACK[0x290]);
  _Unwind_Resume(a1);
}

void sub_213D3FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _upgradeIndexerCommitSynchronous(void *a1)
{
  dispatch_group_t v1;

  if (objc_msgSend(a1, "index"))
  {
    if (SISyncIndex())
    {
      v1 = dispatch_group_create();
      syncContextCreate(v1, 0);
      SISynchedOp();

    }
  }
}

void sub_213D40424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D40920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_213D4149C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D41604(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D41B30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D43338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_213D4792C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D47E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_213D480D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D48B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_213D48B9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D48D44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D48DF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D49D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_213D4A0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_213D4A7FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_213D4ADB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D4B1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D4B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D4BDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D51508(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void setTurboMode(uint64_t a1)
{
  const char *v2;
  const char *v3;
  int v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = "Disable";
    if ((_DWORD)a1)
      v2 = "Enable";
    *(_DWORD *)buf = 136315138;
    v7 = v2;
    _os_log_impl(&dword_213CF1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s turbo mode", buf, 0xCu);
  }
  sTurboMode = a1;
  v3 = (const char *)turboFilePath();
  if ((_DWORD)a1)
  {
    v4 = open(v3, 514, 384);
    if (v4 != -1)
      close(v4);
  }
  else
  {
    unlink(v3);
  }
  _SISetTurboMode();
  objc_msgSend(MEMORY[0x24BEB00D8], "sharedProcessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTurboMode:", a1);

}

void wait_for_apfs_kb_state(const char *a1, int a2)
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  _OWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
      v4 = 5;
    else
      v4 = 4;
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    LODWORD(v13[0]) = v4;
    logForCSLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109378;
      v10 = a2;
      v11 = 2080;
      v12 = a1;
      _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "### wait_for_apfs_kb_state %d enter %s", (uint8_t *)&v9, 0x12u);
    }

    if (fsctl(a1, 0x80284A5AuLL, v13, 0) == -1)
    {
      v7 = *__error();
      if (v7 != 19 && v7 != 45)
      {
        logForCSLogCategoryDefault();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          wait_for_apfs_kb_state_cold_1();

      }
    }
    logForCSLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 67109378;
      v10 = a2;
      v11 = 2080;
      v12 = a1;
      _os_log_impl(&dword_213CF1000, v6, OS_LOG_TYPE_DEFAULT, "### wait_for_apfs_kb_state %d exit %s", (uint8_t *)&v9, 0x12u);
    }

  }
}

void extractBundlesAndProtectionClasses(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;

  v21 = a1;
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v21, "count");
  if (v7 >= 2)
  {
    v8 = v7;
    v20 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 1;
    v17 = *MEMORY[0x24BDD0CD8];
    v18 = *MEMORY[0x24BDD0CD0];
    v19 = *MEMORY[0x24BDD0CE0];
    v16 = *MEMORY[0x24BDD0CE8];
    do
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", v13, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.")))
        {
          objc_msgSend(v5, "addObject:", v14);
        }
        else
        {
          v15 = objc_msgSend(v14, "characterAtIndex:", 0);
          if (v15 <= 87)
          {
            if (v15 <= 66)
            {
              if (v15 == 65)
                goto LABEL_27;
              if (v15 == 66)
                goto LABEL_31;
            }
            else
            {
              if ((v15 - 67) < 2)
                goto LABEL_35;
              if (v15 == 78)
              {
                if ((objc_msgSend(v14, "isEqualToString:", v18) & 1) != 0)
                {
LABEL_27:
                  if ((v11 & 1) == 0)
                    objc_msgSend(v6, "addObject:", v18);
                  v11 = 1;
                  goto LABEL_42;
                }
                if ((objc_msgSend(v14, "isEqualToString:", v17) & 1) != 0)
                {
LABEL_31:
                  if ((v10 & 1) == 0)
                    objc_msgSend(v6, "addObject:", v17);
                  v10 = 1;
                  goto LABEL_42;
                }
                if ((objc_msgSend(v14, "isEqualToString:", v19) & 1) != 0)
                {
LABEL_35:
                  if ((v12 & 1) == 0)
                    objc_msgSend(v6, "addObject:", v19);
                  v12 = 1;
                  goto LABEL_42;
                }
                if ((objc_msgSend(v14, "isEqualToString:", v16) & 1) != 0)
                  goto LABEL_39;
              }
              else if (v15 == 80)
              {
                goto LABEL_16;
              }
            }
          }
          else if (v15 <= 98)
          {
            switch(v15)
            {
              case 'X':
                goto LABEL_39;
              case 'a':
                goto LABEL_27;
              case 'b':
                goto LABEL_31;
            }
          }
          else
          {
            if ((v15 - 99) < 2)
              goto LABEL_35;
            if (v15 == 112)
            {
LABEL_16:
              if ((v20 & 1) == 0)
                objc_msgSend(v6, "addObject:", CFSTR("Priority"));
              v20 = 1;
              goto LABEL_42;
            }
            if (v15 == 120)
            {
LABEL_39:
              if ((v9 & 1) == 0)
                objc_msgSend(v6, "addObject:", v16);
              v9 = 1;
            }
          }
        }
      }
LABEL_42:

      ++v13;
    }
    while (v8 != v13);
  }

}

void sub_213D52D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D52F54(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_213D53788(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D561AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D567B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _queueRelatedDelete(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  logForCSLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_213CF1000, v5, OS_LOG_TYPE_DEFAULT, "queue related delete %@:%@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend((id)sDeleteBatches, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend((id)sDeleteBatches, "setObject:forKeyedSubscript:", v6, v3);
  }
  objc_msgSend(v6, "addObject:", v4);
  v7 = sTotalOutstandingDeletes;
  v8 = ++sTotalOutstandingDeletes;
  if (v7)
  {
    if (v8 >= 0x64)
      _flushDeleteQueue();
  }
  else
  {
    if (!sDeletesTransaction)
    {
      SDTransactionCreate(&unk_24D0FD0C0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)sDeletesTransaction;
      sDeletesTransaction = v9;

    }
    v11 = dispatch_time(0, 5000000000);
    dispatch_after(v11, (dispatch_queue_t)sBatchDeleteQueue, &__block_literal_global_2560);
  }

}

void ___setup_block_block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  if (sShuttingDown == 1)
  {
    logForCSLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ___setup_block_block_invoke_cold_1();

  }
  else
  {
    v3 = (void *)MEMORY[0x2199C2D78]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_autoreleasePoolPop(v3);
  }
}

uint64_t MDBootTime()
{
  int v0;
  BOOL v1;
  _QWORD v3[2];
  size_t v4;
  int v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v5 = 0x1500000001;
  v3[0] = 0;
  v3[1] = 0;
  v4 = 16;
  v0 = sysctl(v5, 2u, v3, &v4, 0, 0);
  if (v3[0])
    v1 = v0 == -1;
  else
    v1 = 1;
  if (v1)
    return 0;
  else
    return v3[0];
}

void __updatedFrom2024Seed_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  char v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  indexHeartbeatPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "fileExistsAtPath:", v0);

  if ((v2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_rwlock_unlock(&sIndexHeartbeatLock);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("previousbuild"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = isAppleInternalInstall();
      v6 = is2024Seed(v4);
      v7 = v5 | v6;
      if (v5 && !v6)
      {
        v8 = v4;
        v18 = 0;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("22[AB]\\d{1,3}($|\\D)"), 0, &v18);
        v10 = v18;
        v11 = v10;
        if (!v9 || v10)
        {
          logForCSLogCategoryIndex();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __updatedFrom2024Seed_block_invoke_cold_2();

        }
        v13 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
        logForCSLogCategoryIndex();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = &stru_24D0EF078;
          if (!v13)
            v15 = CFSTR(" not");
          *(_DWORD *)buf = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEFAULT, "%@ is%@ a 2024 release build", buf, 0x16u);
        }

        v7 = v13 != 0;
      }
    }
    else
    {
      logForCSLogCategoryIndex();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __updatedFrom2024Seed_block_invoke_cold_1();

      v7 = 0;
    }
    updatedFrom2024Seed_updatedFromSeed = v7;

  }
  else
  {
    logForCSLogCategoryIndex();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_DEFAULT, "Did not find heartbeat file", buf, 2u);
    }

    pthread_rwlock_unlock(&sIndexHeartbeatLock);
    updatedFrom2024Seed_updatedFromSeed = 0;
  }

}

BOOL is2024Seed(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v11 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("22[AB][45]\\d{3}($|\\D)"), 0, &v11);
  v3 = v11;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    logForCSLogCategoryIndex();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      is2024Seed_cold_1();

  }
  v7 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  logForCSLogCategoryIndex();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = &stru_24D0EF078;
    if (!v7)
      v9 = CFSTR(" not");
    *(_DWORD *)buf = 138412546;
    v13 = v1;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "%@ is%@ a 2024 seed build", buf, 0x16u);
  }

  return v7 != 0;
}

void ___indexCrossedWorkBoundary_block_invoke(uint64_t a1)
{
  dispatch_group_t v2;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "commitUpdates:", v2);

}

intptr_t __processItemsForImport_block_invoke(uint64_t a1)
{
  double v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  char v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  char v38;

  if (gIsSystemOnBattery)
    v2 = 20.0;
  else
    v2 = 0.5;
  usleep((v2 * 1000000.0));
  v3 = lastTimeOnPower_block_invoke_5_counter++;
  if ((v3 & 0xF) == 0)
  {
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __processItemsForImport_block_invoke_cold_1(a1, v4, v2);

  }
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v9 = *(void **)(a1 + 48);
  v11 = *(void **)(a1 + 80);
  v10 = *(void **)(a1 + 88);
  v28 = *(_BYTE *)(a1 + 96);
  v12 = *(id *)(a1 + 56);
  v13 = v5;
  v29 = v7;
  v14 = v6;
  v15 = v8;
  v16 = v9;
  v17 = v11;
  v18 = v10;
  v19 = v18;
  if (v18)
    dispatch_group_enter(v18);
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __processItemsForImportInner_block_invoke;
  v30[3] = &unk_24D0EDA10;
  v31 = v16;
  v32 = v12;
  v33 = v17;
  v34 = v19;
  v35 = v15;
  v36 = v13;
  v38 = v28;
  v37 = v14;
  v20 = v16;
  v21 = v12;
  v22 = v17;
  v23 = v19;
  v24 = v15;
  v25 = v13;
  v26 = v14;
  objc_msgSend(v29, "indexRequestsPerformDataJob:forBundle:completionHandler:", v26, v24, v30);

  return dispatch_group_wait(*(dispatch_group_t *)(a1 + 88), 0xFFFFFFFFFFFFFFFFLL);
}

void __processItemsForImportInner_block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;
  char v26;
  char v27;
  _BYTE buf[12];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend((id)v6, "code") == 4099)
  {
    objc_msgSend((id)v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NSCocoaErrorDomain"));

  }
  else
  {
    v8 = 0;
  }
  logForCSLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend((id)v5, "length");
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v5;
    v29 = 2048;
    v30 = v10;
    v31 = 1024;
    v32 = v8;
    v33 = 2112;
    v34 = v6;
    v35 = 2112;
    v36 = v11;
    _os_log_impl(&dword_213CF1000, v9, OS_LOG_TYPE_INFO, "==== CALLBACK data:%p length:%ld crash:%d error:%@ unique:%@", buf, 0x30u);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
  if (v12)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __processItemsForImportInner_block_invoke_2520;
    v16[3] = &unk_24D0ED9E8;
    objc_copyWeak(&v24, (id *)buf);
    v17 = *(id *)(a1 + 64);
    v18 = *(id *)(a1 + 32);
    v25 = (v5 | v6) == 0;
    v26 = v8;
    v19 = (id)v5;
    v20 = *(id *)(a1 + 72);
    v27 = *(_BYTE *)(a1 + 88);
    v21 = *(id *)(a1 + 80);
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 56);
    SIBackgroundOpBlock(v12, 9, v16);

    objc_destroyWeak(&v24);
  }
  else
  {
    logForCSLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __processItemsForImportInner_block_invoke_cold_1();

    v14 = *(NSObject **)(a1 + 48);
    if (v14)
      dispatch_group_leave(v14);
    v15 = *(NSObject **)(a1 + 56);
    if (v15)
      dispatch_group_leave(v15);
  }
  objc_destroyWeak((id *)buf);

}

void sub_213D59048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __processItemsForImportInner_block_invoke_2520(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  CFAbsoluteTime Current;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  id *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  id obj;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72[2];
  char v73;
  char v74;
  char v75;
  char v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  char v81;
  __int16 v82;
  __int16 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = *(NSObject **)(a1 + 72);
    if (v4)
      dispatch_group_leave(v4);
    v5 = *(NSObject **)(a1 + 80);
    if (v5)
      dispatch_group_leave(v5);
    return;
  }
  v50 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v83 = 0;
  v82 = 0;
  v81 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  v51 = a1;
  objc_msgSend(WeakRetained, "checkAdmission:background:didBeginThrottle:didEndThrottle:live:slow:memoryPressure:", *(_QWORD *)(a1 + 32), 1, (char *)&v83 + 1, &v83, (char *)&v82 + 1, &v82, &v81);
  v8 = objc_msgSend(*(id *)(a1 + 40), "count");
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= 1)
    {
      v10 = *MEMORY[0x24BDC1E00];
      v11 = MEMORY[0x24BDBD1C8];
      do
      {
        v91 = v10;
        v92 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        --v8;
      }
      while (v8);
    }
LABEL_10:
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (*(_BYTE *)(a1 + 97))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 >= 1)
    {
      v14 = *MEMORY[0x24BDC1DF8];
      v15 = MEMORY[0x24BDBD1C8];
      do
      {
        v89 = v14;
        v90 = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        --v8;
      }
      while (v8);
    }
    goto LABEL_10;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC23D0]), "initWithData:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "decode");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v17 = (void *)v13;

  v18 = objc_alloc_init(MEMORY[0x24BDC23B8]);
  objc_msgSend(v18, "beginArray");
  v19 = *(void **)(v51 + 56);
  v20 = *(void **)(v51 + 40);
  v56 = *(unsigned __int8 *)(v51 + 98);
  v58 = WeakRetained;
  v52 = v19;
  v21 = v20;
  v61 = v17;
  v22 = v18;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v21;
  v66 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
  if (!v66)
    goto LABEL_41;
  v23 = 0;
  v59 = 0;
  v60 = *(_QWORD *)v85;
  v55 = *MEMORY[0x24BDC1DF0];
  v64 = *MEMORY[0x24BDBD430];
  v54 = *MEMORY[0x24BDC1E10];
  v53 = *MEMORY[0x24BDC1E08];
  v62 = *MEMORY[0x24BDC2290];
  do
  {
    for (i = 0; i != v66; ++i)
    {
      if (*(_QWORD *)v85 != v60)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
      objc_msgSend(v61, "objectAtIndexedSubscript:", v23 + i);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("_kMDItemExternalID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27
        || (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && objc_msgSend(v25, "isEqualToString:", v27))
      {
        if (v26)
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v26);
        else
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24D0FD210, v55);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, CFSTR("_kMDItemExternalID"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v64, v54);
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v64, v53);
        objc_msgSend(v28, "objectForKeyedSubscript:", v62);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v30 = v59;
          if (!v59)
          {
            v31 = objc_alloc_init(MEMORY[0x24BDC23B8]);
            objc_msgSend(v31, "beginArray");
            objc_msgSend(v31, "encodeString:", "contentText");
            objc_msgSend(v31, "beginDictionary");
            v30 = v31;
          }
          v59 = v30;
          objc_msgSend(v30, "encodeObject:withKey:", v29, v25);
        }
        if (v56)
        {
          objc_msgSend(MEMORY[0x24BEB00D8], "sharedProcessor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "dataclass");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "processorAttributesForRecord:bundleID:protectionClass:", v28, v52, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
            objc_msgSend(v28, "addEntriesFromDictionary:", v34);

        }
        objc_msgSend(v28, "removeObjectForKey:", v62);
        objc_msgSend(v22, "beginArray");
        objc_msgSend(v22, "encodeString:", "__class:CSSearchableItemAttributeSet");
        objc_msgSend(v22, "encodeInt64:", 8);
        objc_msgSend(v22, "encodeObject:", v28);
        objc_msgSend(v22, "endArray");

      }
    }
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
    v23 += i;
  }
  while (v66);
  if (v59)
  {
    objc_msgSend(v59, "endDictionary");
    objc_msgSend(v59, "endArray");
  }
  else
  {
LABEL_41:
    v59 = 0;
  }

  objc_msgSend(v22, "endArray");
  objc_msgSend(v22, "data");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "data");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    if ((objc_msgSend(*(id *)(v51 + 64), "jobOptions") & 0x100) != 0)
    {
      v35 = objc_msgSend(v58, "_interestedAttributesMaskForBundleID:", *(_QWORD *)(v51 + 56));
      if (v35)
      {
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC23D0]), "initWithData:", v67);
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2488]), "initWithItems:itemsContent:", v63, 0);
        v37 = 0;
        v38 = 0;
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v39; ++j)
            {
              if (*(_QWORD *)v78 != v40)
                objc_enumerationMutation(v36);
              v42 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
              v43 = objc_msgSend((id)objc_opt_class(), "checkItemOfInterest:mask:", v42, v35);
              v44 = objc_msgSend(v42, "isUpdate");
              if (v43)
                v45 = v44;
              else
                v45 = 0;
              if (v45 == 1)
              {
                if (!v37)
                  v37 = (void *)objc_opt_new();
                objc_msgSend(v37, "addObject:", v42);
                v38 |= v43;
              }
            }
            v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v88, 16);
          }
          while (v39);
        }

        objc_msgSend(v58, "notifyClientForItemUpdates:updatedItems:batchMask:", *(_QWORD *)(v51 + 56), v37, v38);
      }
    }
  }
  if (v65)
    objc_msgSend(*(id *)(v51 + 64), "jobOptions");
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 3221225472;
  v68[2] = __processItemsForImportInner_block_invoke_2;
  v68[3] = &unk_24D0ED9C0;
  objc_copyWeak(v72, v50);
  v69 = *(id *)(v51 + 32);
  v73 = HIBYTE(v83);
  v74 = v83;
  v75 = HIBYTE(v82);
  v76 = v82;
  v72[1] = *(id *)&Current;
  v70 = *(id *)(v51 + 72);
  v71 = *(id *)(v51 + 80);
  v49 = (id)objc_msgSend(v68, "copy");
  v46 = SISetCodedAttributes();

  if (!v46)
  {
    v47 = *(NSObject **)(v51 + 72);
    if (v47)
      dispatch_group_leave(v47);
    v48 = *(NSObject **)(v51 + 80);
    if (v48)
      dispatch_group_leave(v48);
  }

  objc_destroyWeak(v72);
}

void sub_213D59954(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __processItemsForImportInner_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 72);
    v10 = *(unsigned __int8 *)(a1 + 73);
    v11 = *(unsigned __int8 *)(a1 + 74);
    objc_msgSend(v5, "indexQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_BYTE *)(a1 + 75);
    v14 = *(double *)(a1 + 64);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __processItemsForImportInner_block_invoke_3;
    v18[3] = &unk_24D0EBD30;
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    LOBYTE(v17) = v13;
    objc_msgSend(v5, "completeIndexingItemFor:delegate:didBeginThrottle:didEndThrottle:error:live:queue:slow:startTime:completionHandler:", v8, v7, v9, v10, v3, v11, v14, v12, v17, v18);

  }
  else
  {
    v15 = *(NSObject **)(a1 + 40);
    if (v15)
      dispatch_group_leave(v15);
    v16 = *(NSObject **)(a1 + 48);
    if (v16)
      dispatch_group_leave(v16);
  }

}

void __processItemsForImportInner_block_invoke_3(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  id v5;

  v5 = a2;
  v3 = *(NSObject **)(a1 + 32);
  if (v3)
    dispatch_group_leave(v3);
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_group_leave(v4);

}

void __setClientStateForIndexing_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  SDTransactionDone(*(void **)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void ___setClientStateInner_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dirty:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __initializeDiskSpaceNotificationListener_block_invoke(uint64_t a1)
{
  uintptr_t data;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  char v6;
  void *v7;
  NSObject *v8;
  char v9;
  __int16 v11;
  uint8_t buf[16];
  __int16 v13;

  pthread_mutex_lock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (data == 256)
  {
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v13 = 0;
    v4 = "Received empty update vfsevent; assuming not in low disk space state";
    v5 = (uint8_t *)&v13;
LABEL_8:
    _os_log_impl(&dword_213CF1000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
LABEL_9:

    v6 = sVeryLowDiskSpace;
    sVeryLowDiskSpace = 0;
    if ((v6 & 1) != 0)
    {
      +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "restoreIndexAndClearPurgeable");
LABEL_15:

      return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
    }
    return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
  }
  if ((data & 0x200) == 0)
  {
    if ((data & 4) == 0)
      return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
    logForCSLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v11 = 0;
    v4 = "Received low disk space vfsevent; assuming very low disk ended";
    v5 = (uint8_t *)&v11;
    goto LABEL_8;
  }
  logForCSLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "Received very low disk space vfsevent", buf, 2u);
  }

  v9 = sVeryLowDiskSpace;
  sVeryLowDiskSpace = 1;
  if ((v9 & 1) == 0)
  {
    +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recycleAndPurgeIndex");
    goto LABEL_15;
  }
  return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
}

void handleLowDiskSpace()
{
  NSObject *v0;

  if ((sVeryLowDiskSpace & 1) == 0)
  {
    sVeryLowDiskSpace = 1;
    dispatch_get_global_queue(21, 0);
    v0 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v0, &__block_literal_global_2542);

  }
}

void __handleLowDiskSpace_block_invoke()
{
  id v0;

  +[SPCoreSpotlightIndexer sharedInstance](SPCoreSpotlightIndexer, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "recycleAndPurgeIndex");

}

uint64_t turboFilePath()
{
  void *v0;
  id v1;
  uint64_t v2;

  objc_msgSend((id)sDelegate, "indexDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR(".turbo"));
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "fileSystemRepresentation");

  return v2;
}

void _flushDeleteQueue()
{
  void *v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (sTotalOutstandingDeletes)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend((id)sDeleteBatches, "allKeys");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v1)
    {
      v3 = v1;
      v4 = *(_QWORD *)v13;
      *(_QWORD *)&v2 = 67109378;
      v11 = v2;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v13 != v4)
            objc_enumerationMutation(v0);
          v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend((id)sDeleteBatches, "objectForKeyedSubscript:", v6, v11);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "count"))
          {
            logForCSLogCategoryDefault();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              v9 = objc_msgSend(v7, "count");
              *(_DWORD *)buf = v11;
              v17 = v9;
              v18 = 2112;
              v19 = v6;
              _os_log_impl(&dword_213CF1000, v8, OS_LOG_TYPE_DEFAULT, "flushing %d related deletes for %@", buf, 0x12u);
            }

            +[SpotlightSender deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:](SpotlightSender, "deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:", v7, v6, 0, 1);
            +[SpotlightSender deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:](SpotlightSender, "deleteSearchableItemsWithIdentifiers:bundleID:contentType:client:", v7, v6, 0, 2);
          }
          objc_msgSend((id)sDeleteBatches, "removeAllObjects");
          sTotalOutstandingDeletes = 0;

        }
        v3 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
      }
      while (v3);
    }

  }
  if (sDeletesTransaction)
  {
    SDTransactionDone((void *)sDeletesTransaction);
    v10 = (void *)sDeletesTransaction;
    sDeletesTransaction = 0;

  }
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_21(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

uint64_t OUTLINED_FUNCTION_31@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return objc_msgSend(a1, "canceled");
}

uint64_t OUTLINED_FUNCTION_32()
{
  return qos_class_self();
}

uint64_t OUTLINED_FUNCTION_36@<X0>(uint64_t a1@<X8>)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 8) + 40), "count");
}

void OUTLINED_FUNCTION_37(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_38(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_39(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x2Au);
}

void OUTLINED_FUNCTION_43(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_45(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_52(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

int *OUTLINED_FUNCTION_53()
{
  return __error();
}

float weightedDistance(char *a1, char *a2, float a3, float a4)
{
  size_t v8;
  size_t v9;

  v8 = strlen(a1);
  v9 = strlen(a2);
  return _weightedDistance((unsigned __int8 *)a1, v8, (unsigned __int8 *)a2, v9, a3, a4);
}

float _weightedDistance(unsigned __int8 *a1, size_t a2, unsigned __int8 *a3, size_t a4, float a5, float a6)
{
  float v6;
  size_t v7;
  unsigned __int8 *v8;
  size_t v9;
  char *v10;
  unint64_t v11;
  float v12;
  size_t v16;
  char *v17;
  int v18;
  float v19;
  size_t v20;
  size_t v21;
  float v22;
  float v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _DWORD *v27;
  unint64_t v28;
  float *v29;
  size_t v30;
  float v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  float v36;
  float *v37;
  float v38;
  size_t v39;
  float v40;
  float v41;
  int v42;
  float v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  BOOL v48;
  int v49;
  float *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  float v56;
  float v57;
  float v58;
  float v59;
  int v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v67;
  unint64_t v70;
  float *v71;
  float *v72;
  unint64_t v73;
  float v74;
  char *v76;
  unint64_t v77;
  int v78;
  void *__p;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;

  v6 = a5;
  if (a2 > a4)
    v7 = a4;
  else
    v7 = a2;
  if (a2 > a4)
    v8 = a3;
  else
    v8 = a1;
  if (a2 > a4)
    v9 = a2;
  else
    v9 = a4;
  if (a2 > a4)
    v10 = (char *)a1;
  else
    v10 = (char *)a3;
  v11 = v9 - v7;
  v12 = (float)(v9 - v7);
  if (v12 > a5)
    return v6;
  if (v9 == v7 && !memcmp(v8, v10, v7))
    return 0.0;
  if (!v7)
  {
LABEL_20:
    v6 = 0.0;
    if (v9 == v7)
      return v6;
    v19 = flt_213D7E350[a2 <= a4];
    return v19 * v12;
  }
  v16 = v7 - 1;
  v17 = &v10[v9 - 1];
  while (1)
  {
    v18 = *v17--;
    if (v8[v16] != v18)
      break;
    if (--v16 == -1)
      goto LABEL_20;
  }
  v20 = 0;
  while (v8[v20] == v10[v20])
  {
    if (v7 == ++v20)
    {
      v20 = v7;
      goto LABEL_29;
    }
  }
  v11 = v9 - v20;
LABEL_29:
  v21 = v7 - v20;
  if (v7 == v20)
  {
    v6 = 0.0;
    if (v9 == v7)
      return v6;
    v19 = 0.1;
    if (v7 <= 2)
      v19 = 0.25;
    if (a2 > a4)
      v19 = 0.21;
    return v19 * v12;
  }
  v22 = (float)v11;
  v23 = (float)(v11 - v21);
  if (v6 >= 0.0 && v22 >= v6)
  {
    v22 = v6;
    if (v23 > v6)
      return v6;
  }
  v82 = 0;
  v83 = 0;
  v84 = 0;
  LODWORD(__p) = 0;
  std::vector<float>::vector(&v82, v11, &__p);
  __p = 0;
  v80 = 0;
  v81 = 0;
  v78 = 0;
  std::vector<float>::vector(&__p, v11, &v78);
  v24 = (unint64_t)v22;
  if (v9 != v20)
  {
    v25 = 0;
    v26 = v11 - 1;
    v27 = v82;
    v28 = v11 - 2;
    v29 = (float *)v82;
    do
    {
      v30 = v25 | v20;
      if (a2 > a4)
      {
        if (!v30)
        {
          *v27 = 1053609164;
          goto LABEL_60;
        }
        if (v26 != v25 || !v25)
        {
          if (!v25)
          {
            *v27 = 1049582632;
            goto LABEL_60;
          }
          v32 = *(v29 - 1) + 0.28;
LABEL_57:
          *v29 = v32;
          goto LABEL_60;
        }
        v31 = *(float *)&v27[v28] + 0.21;
      }
      else
      {
        if (!v30)
        {
          *v27 = 1055286886;
          goto LABEL_60;
        }
        if (v26 != v25 || !v25)
        {
          if (!v25)
          {
            *v27 = 1043878380;
            goto LABEL_60;
          }
          v32 = *(v29 - 1) + 0.18;
          goto LABEL_57;
        }
        v31 = *(float *)&v27[v28] + 0.25;
      }
      *(float *)&v27[v26] = v31;
LABEL_60:
      ++v25;
      ++v29;
    }
    while (v11 != v25);
  }
  v33 = 0;
  v34 = 0;
  v77 = (unint64_t)(float)(v22 - v23);
  v35 = *v8;
  v36 = flt_213D7E348[a2 <= a4];
  v76 = (char *)v82;
  v37 = (float *)((char *)&unk_213D7E340 + 4 * (v20 == 0));
  if (a2 > a4)
    v37 = (float *)((char *)&unk_213D7E338 + 4 * (v20 == 0));
  v38 = *v37;
  v39 = v21 - 1;
  v40 = 0.0;
  v41 = 0.0;
  do
  {
    v42 = v8[v33 + v20];
    v43 = v41 + v36;
    if (!v33)
      v43 = v38;
    if (v33 <= v77)
      v44 = v34;
    else
      v44 = v34 + 1;
    if (v24 >= v11)
      v45 = v24;
    else
      v45 = v24 + 1;
    if (v44 < v45)
    {
      v46 = 0;
      v47 = 0;
      v48 = v33 == 0;
      if (!v33)
        v41 = 0.0;
      v49 = v10[v20];
      v50 = (float *)__p;
      if (v33 == v39)
        v48 = 1;
      v51 = v44 - 1;
      v52 = ~v44 + v24 + (v24 < v11);
      v53 = (__PAIR128__(-(uint64_t)v34, v77) - v33) >> 64;
      v54 = (char *)__p + 4 * v44;
      v55 = &v76[4 * v44];
      v56 = v43;
      while (1)
      {
        v57 = v41;
        if (v46 || !v53)
        {
          v59 = *(float *)&v54[4 * v46];
          *(float *)&v54[4 * v46] = v57;
          v58 = v40;
        }
        else
        {
          v58 = v50[v51];
          v59 = v50[v44];
          v50[v44] = v57;
          v49 = v10[v51];
        }
        v40 = v59;
        v41 = *(float *)&v55[4 * v46];
        v60 = v10[v20 + v44 + v46];
        if (v42 != v60)
          break;
        v47 |= v48;
LABEL_137:
        *(float *)&v55[4 * v46++] = v57;
        v49 = v60;
        v56 = v57;
        if (v44 + v46 >= v45)
          goto LABEL_140;
      }
      if (a2 > a4)
      {
        if (v20 | v46)
        {
          if (v52 == v46)
            v61 = v57 + 0.19;
          else
            v61 = v57 + 0.2;
        }
        else
        {
          v61 = v57 + 0.27;
          if ((v47 & 1) == 0)
          {
            if ((float)(v41 + 0.45) < v61)
              v61 = v41 + 0.45;
            v62 = v56 + 0.4;
            goto LABEL_115;
          }
        }
        if (v52 == v46)
        {
          if ((float)(v41 + 0.25) < v61)
            v61 = v41 + 0.25;
          v62 = v56 + 0.21;
        }
        else
        {
          if ((float)(v41 + 0.18) < v61)
            v61 = v41 + 0.18;
          v62 = v56 + 0.28;
        }
        goto LABEL_115;
      }
      if (v33 | v20)
      {
        if (v33 == v39)
        {
          v61 = v57 + 0.19;
LABEL_97:
          v63 = v56 + 0.25;
          if (v63 < v61)
            v61 = v63;
          v62 = v41 + 0.21;
LABEL_115:
          if (v62 < v61)
            v61 = v62;
          if (!v33 || v53 == v46 || v42 != v49 || v35 != v60)
            goto LABEL_136;
          if (v52 == v46 && v33 == v39)
            v67 = 0.38;
          else
            v67 = 0.275;
          if (v44 + v46 == 1 && v33 == 1 && v20 == 0)
            v67 = 0.39;
          v57 = v58 + v67;
          if ((float)(v58 + v67) >= v61)
LABEL_136:
            v57 = v61;
          goto LABEL_137;
        }
        v61 = v57 + 0.2;
      }
      else
      {
        v61 = v57 + 0.27;
        if ((v47 & 1) == 0)
        {
          v65 = v56 + 0.45;
          if (v65 < v61)
            v61 = v65;
          v62 = v41 + 0.4;
          goto LABEL_115;
        }
        if (v33 == v39)
          goto LABEL_97;
      }
      v64 = v56 + 0.18;
      if (v64 < v61)
        v61 = v64;
      v62 = v41 + 0.28;
      goto LABEL_115;
    }
    v57 = v43;
LABEL_140:
    ++v33;
    v35 = v42;
    v24 = v45;
    v34 = v44;
    v41 = v43;
  }
  while (v33 != v21);
  if (a2 <= a4 && v7 >= 3)
  {
    v70 = (unint64_t)(float)((float)(v11 - 1) - v22);
    if (v11 > v70)
    {
      v71 = (float *)v82;
      v72 = (float *)__p;
      v73 = ~v70 + v11;
      do
      {
        v74 = v71[v70] + (float)((float)v73 * 0.1);
        v72[v70] = v74;
        if (v74 < v57)
          v57 = v74;
        ++v70;
        --v73;
      }
      while (v70 < v11);
    }
  }
  if (__p)
  {
    v80 = __p;
    operator delete(__p);
  }
  if (v57 <= a6)
    v6 = v57;
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  return v6;
}

void sub_213D5A9C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL verifyCandidateLength(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 0x12;
}

BOOL isCandidate(char *a1, void *a2)
{
  id v3;
  char *v4;
  size_t v5;
  size_t v6;
  float v7;
  unint64_t v8;
  _BOOL8 v9;

  v3 = objc_retainAutorelease(a2);
  v4 = (char *)objc_msgSend(v3, "UTF8String");
  v5 = strlen(v4);
  v6 = strlen(a1);
  v7 = _weightedDistance((unsigned __int8 *)v4, v5, (unsigned __int8 *)a1, v6, 4.0, 1.2);
  if (v5 <= v6)
    v8 = v6;
  else
    v8 = v5;
  v9 = 0;
  if (v7 < fmaxf((float)v8, 4.0) && v8 && v7 >= 0.0)
    v9 = (float)(1.0 - (float)(v7 / (float)v8)) >= 0.945;

  return v9;
}

void sub_213D5AAB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id SDPommesCorrectionsWithTopKAndToken(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id *j;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  char *v34;
  size_t v35;
  unsigned __int8 *v36;
  void *v37;
  float v38;
  unint64_t v39;
  float v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  uint64_t *k;
  void *v46;
  void **v47;
  void *v48;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void **v57;
  id v58;
  void *__p[2];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  _BYTE v66[128];
  std::string v67;
  float v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v50 = a2;
  v6 = a3;
  v55 = 0u;
  v56 = 0u;
  v7 = v5;
  v8 = v6;
  v9 = v8;
  if (!v7
    || !v8
    || (objc_msgSend(v7, "allKeys"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v12 = objc_msgSend(v9, "intValue"),
        v10,
        v11 <= v12))
  {
    v26 = v7;
    goto LABEL_22;
  }
  v63 = 0u;
  v64 = 0u;
  *(_OWORD *)__p = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __p, &v67, 16);
  if (!v14)
    goto LABEL_18;
  v15 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v60 != v15)
        objc_enumerationMutation(v13);
      v17 = (void *)*((_QWORD *)__p[1] + i);
      objc_msgSend(v13, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v63;
      if ((int)objc_msgSend(v9, "intValue") <= (unint64_t)((uint64_t)(*((_QWORD *)&v19 + 1) - v19) >> 4))
      {
        if (objc_msgSend(*(id *)(v63 + 8), "compare:", v18) > 0)
          goto LABEL_16;
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, *((uint64_t *)&v63 + 1), (uint64_t)&v65, (uint64_t)(*((_QWORD *)&v63 + 1) - v63) >> 4);
        std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v63, *((_QWORD *)&v63 + 1) - 16);
      }
      v57 = v17;
      v58 = v18;
      v20 = (_QWORD *)*((_QWORD *)&v63 + 1);
      if (*((_QWORD *)&v63 + 1) >= (unint64_t)v64)
      {
        v21 = std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__push_back_slow_path<std::pair<NSString * {__strong},NSNumber * {__strong}> const&>((uint64_t *)&v63, (id *)&v57);
      }
      else
      {
        *v20 = v57;
        v20[1] = v58;
        v21 = (uint64_t)(v20 + 2);
      }
      *((_QWORD *)&v63 + 1) = v21;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, v21, (uint64_t)&v65, (v21 - (uint64_t)v63) >> 4);

LABEL_16:
    }
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __p, &v67, 16);
  }
  while (v14);
LABEL_18:

  v22 = (void *)objc_opt_new();
  for (j = (id *)v63; (_QWORD)v63 != *((_QWORD *)&v63 + 1); j = (id *)v63)
  {
    v24 = *j;
    v25 = *(id *)(v63 + 8);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, v24);
    std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, *((uint64_t *)&v63 + 1), (uint64_t)&v65, (uint64_t)(*((_QWORD *)&v63 + 1) - v63) >> 4);
    std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v63, *((_QWORD *)&v63 + 1) - 16);

  }
  v26 = (id)objc_msgSend(v22, "copy");

  v57 = (void **)&v63;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v57);
LABEL_22:

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v27 = v26;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
  if (!v28)
    goto LABEL_65;
  v29 = *(_QWORD *)v52;
  while (2)
  {
    v30 = 0;
    while (2)
    {
      if (*(_QWORD *)v52 != v29)
        objc_enumerationMutation(v27);
      v31 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v30);
      v32 = (void *)MEMORY[0x2199C2D78]();
      __p[0] = 0;
      __p[1] = 0;
      *(_QWORD *)&v60 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v31), "UTF8String"));
      if (SBYTE7(v60) < 0)
      {
        v33 = (unint64_t)__p[1];
        if (__p[1] < (void *)3)
        {
LABEL_62:
          operator delete(__p[0]);
          goto LABEL_63;
        }
LABEL_31:
        if (v33 <= 0x14)
        {
          v34 = (char *)objc_msgSend(objc_retainAutorelease(v50), "UTF8String");
          v35 = strlen(v34);
          v36 = (SBYTE7(v60) & 0x80u) == 0 ? (unsigned __int8 *)__p : (unsigned __int8 *)__p[0];
          v37 = (SBYTE7(v60) & 0x80u) == 0 ? (void *)BYTE7(v60) : __p[1];
          v38 = _weightedDistance((unsigned __int8 *)v34, v35, v36, (size_t)v37, 4.0, 1.2);
          v39 = v35 <= (unint64_t)v37 ? (unint64_t)v37 : v35;
          if (v38 < fmaxf((float)v39, 4.0) && v38 >= 0.0)
          {
            if (v39)
            {
              v40 = 1.0 - (float)(v38 / (float)v39);
              if (v40 >= 0.945)
              {
                v41 = *((_QWORD *)&v55 + 1);
                if (*((_QWORD *)&v55 + 1) - (_QWORD)v55 == 160)
                {
                  if (*(float *)(v55 + 24) > v40)
                    goto LABEL_61;
                  std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v55, *((uint64_t *)&v55 + 1), (uint64_t)&v67, 5);
                  v41 = *((_QWORD *)&v55 + 1) - 32;
                  if (*(char *)(*((_QWORD *)&v55 + 1) - 9) < 0)
                    operator delete(*(void **)v41);
                  *((_QWORD *)&v55 + 1) = v41;
                }
                if (SBYTE7(v60) < 0)
                {
                  std::string::__init_copy_ctor_external(&v67, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
                  v41 = *((_QWORD *)&v55 + 1);
                }
                else
                {
                  *(_OWORD *)&v67.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
                  v67.__r_.__value_.__r.__words[2] = v60;
                }
                v68 = v40;
                if (v41 >= (unint64_t)v56)
                {
                  v43 = std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>((uint64_t *)&v55, (__int128 *)&v67);
                }
                else
                {
                  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)v41, v67.__r_.__value_.__l.__data_, v67.__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    v42 = *(_OWORD *)&v67.__r_.__value_.__l.__data_;
                    *(_QWORD *)(v41 + 16) = *((_QWORD *)&v67.__r_.__value_.__l + 2);
                    *(_OWORD *)v41 = v42;
                  }
                  *(float *)(v41 + 24) = v68;
                  v43 = v41 + 32;
                }
                *((_QWORD *)&v55 + 1) = v43;
                std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(v55, v43, (uint64_t)&v57, (v43 - (uint64_t)v55) >> 5);
                if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v67.__r_.__value_.__l.__data_);
              }
            }
          }
        }
LABEL_61:
        if ((SBYTE7(v60) & 0x80000000) == 0)
          goto LABEL_63;
        goto LABEL_62;
      }
      v33 = BYTE7(v60);
      if (BYTE7(v60) >= 3u)
        goto LABEL_31;
LABEL_63:
      objc_autoreleasePoolPop(v32);
      if (v28 != ++v30)
        continue;
      break;
    }
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v66, 16);
    if (v28)
      continue;
    break;
  }
LABEL_65:

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  for (k = (uint64_t *)v55; (_QWORD)v55 != *((_QWORD *)&v55 + 1); k = (uint64_t *)v55)
  {
    if (*((char *)k + 23) < 0)
      k = (uint64_t *)*k;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", k);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "insertObject:atIndex:", v46, 0);
    std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v55, *((uint64_t *)&v55 + 1), (uint64_t)&v67, (uint64_t)(*((_QWORD *)&v55 + 1) - v55) >> 5);
    v47 = (void **)(*((_QWORD *)&v55 + 1) - 32);
    if (*(char *)(*((_QWORD *)&v55 + 1) - 9) < 0)
      operator delete(*v47);
    *((_QWORD *)&v55 + 1) = v47;

  }
  v48 = (void *)objc_msgSend(v44, "copy");

  v67.__r_.__value_.__r.__words[0] = (std::string::size_type)&v55;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v67);

  return v48;
}

void sub_213D5B138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char **a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *__p,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  void *v63;
  void *v64;
  void *v65;

  a23 = &a36;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);

  a36 = &a19;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a36);

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

id getAppTokens(NSString *a1)
{
  NSString *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSString *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  NSString *v11;
  id v12;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NSString length](v1, "length");
  v4 = *MEMORY[0x24BDD0F88];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = ___Z12getAppTokensP8NSString_block_invoke;
  v10[3] = &unk_24D0EDAB8;
  v5 = v1;
  v11 = v5;
  v6 = v2;
  v12 = v6;
  -[NSString enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:](v5, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v3, v4, 6, 0, v10);
  v7 = v12;
  v8 = v6;

  return v8;
}

void sub_213D5B36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void ___Z12getAppTokensP8NSString_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLowercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
}

void sub_213D5B3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

BOOL isAppPrefixMatch(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;

  if (objc_msgSend(a2, "rangeOfString:options:", a1, 9))
    v3 = 1;
  else
    v3 = v2 == 0;
  return !v3;
}

uint64_t isSpellCorrectionReady(NSString *a1, int a2)
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;

  v3 = a1;
  v4 = v3;
  if (!a2)
  {
    if (-[NSString length](v3, "length") < 3)
      goto LABEL_3;
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  if (-[NSString length](v3, "length") >= 2)
    goto LABEL_5;
LABEL_3:
  v5 = 0;
LABEL_6:

  return v5;
}

void sub_213D5B498(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL skipAppSpellCorrection(NSString *a1, NSString *a2, char a3)
{
  NSString *v5;
  NSString *v6;
  _BOOL8 v7;
  unint64_t i;
  unint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a1;
  v6 = a2;
  if ((a3 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    for (i = 0; ; ++i)
    {
      v10 = objc_msgSend(&unk_24D0FD108, "count");
      v7 = i < v10;
      if (i >= v10)
        break;
      if (v6)
      {
        if (-[NSString length](v5, "length") >= 4)
        {
          objc_msgSend(&unk_24D0FD108, "objectAtIndexedSubscript:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSString isEqualToString:](v6, "isEqualToString:", v12);

          if (v13)
          {
            objc_msgSend(&unk_24D0FD108, "objectAtIndexedSubscript:", i);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "rangeOfString:options:", v5, 9);
            v18 = v17;

            if (!v16)
            {
              if (v18)
                break;
            }
          }
        }
      }
    }
  }

  return v7;
}

void sub_213D5B5D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

float appErrorScore(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  float v7;
  unint64_t v8;
  id v9;
  char *v10;
  size_t v11;
  id v12;
  char *v13;
  size_t v14;
  float v15;
  float v16;
  unint64_t v17;
  float v18;

  v5 = a1;
  v6 = a2;
  v7 = 0.0;
  if (isSpellCorrectionReady((NSString *)v5, a3))
  {
    if ((isSpellCorrectionReady((NSString *)v6, a3) & 1) != 0
      && !skipAppSpellCorrection((NSString *)v5, (NSString *)v6, a3))
    {
      v8 = objc_msgSend(v6, "length");
      if (v8 >= objc_msgSend(v5, "length"))
      {
        objc_msgSend(v5, "lowercaseString");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (char *)objc_msgSend(v9, "UTF8String");
        v11 = strlen(v10);
        objc_msgSend(v6, "lowercaseString");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = (char *)objc_msgSend(v12, "UTF8String");
        v14 = strlen(v13);
        v15 = (float)(unint64_t)objc_msgSend(v6, "length");
        v16 = _weightedDistance((unsigned __int8 *)v10, v11, (unsigned __int8 *)v13, v14, v15, 1.2);
        if (v11 <= v14)
          v17 = v14;
        else
          v17 = v11;
        if ((float)v17 <= v15)
          v18 = v15;
        else
          v18 = (float)v17;
        v7 = 0.0;
        if (v16 < v18 && v17 && v16 >= 0.0)
          v7 = 1.0 - (float)(v16 / (float)v17);

      }
    }
  }

  return v7;
}

void sub_213D5B76C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id getAppCorrectionIfAny(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  float v18;
  float v19;
  void *v20;
  void **v21;
  void *v22;
  void *__p[2];
  uint64_t v25;
  float v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  if ((isSpellCorrectionReady((NSString *)v5, a3) & 1) != 0)
  {
    v31 = 0u;
    v32 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v12 = appErrorScore(v5, v11, a3);
          if (v12 > 0.91)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
            v26 = -v12;
            v13 = *((_QWORD *)&v31 + 1);
            if (*((_QWORD *)&v31 + 1) >= (unint64_t)v32)
            {
              v15 = std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>((uint64_t *)&v31, (__int128 *)__p);
            }
            else
            {
              if (SHIBYTE(v25) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)&v31 + 1), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
              }
              else
              {
                v14 = *(_OWORD *)__p;
                *(_QWORD *)(*((_QWORD *)&v31 + 1) + 16) = v25;
                *(_OWORD *)v13 = v14;
              }
              *(float *)(v13 + 24) = v26;
              v15 = v13 + 32;
            }
            *((_QWORD *)&v31 + 1) = v15;
            std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(v31, v15, (uint64_t)&v33, (v15 - (uint64_t)v31) >> 5);
            if (SHIBYTE(v25) < 0)
              operator delete(__p[0]);
          }
          if (objc_msgSend(v11, "rangeOfString:options:", v5, 9))
            v17 = 1;
          else
            v17 = v16 == 0;
          if (!v17)
          {

            v22 = (void *)MEMORY[0x24BDBD1A8];
            goto LABEL_33;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_QWORD)v31 != *((_QWORD *)&v31 + 1))
    {
      v18 = 0.0;
      do
      {
        if ((unint64_t)objc_msgSend(v22, "count") > 2)
          break;
        v19 = *(float *)(v31 + 24);
        if ((unint64_t)objc_msgSend(v22, "count") >= 2 && v19 < v18)
          break;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v20);
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v31, *((uint64_t *)&v31 + 1), (uint64_t)&v33, (uint64_t)(*((_QWORD *)&v31 + 1) - v31) >> 5);
        v21 = (void **)(*((_QWORD *)&v31 + 1) - 32);
        if (*(char *)(*((_QWORD *)&v31 + 1) - 9) < 0)
          operator delete(*v21);
        *((_QWORD *)&v31 + 1) = v21;

        v18 = v19;
      }
      while ((_QWORD)v31 != *((_QWORD *)&v31 + 1));
    }
LABEL_33:
    __p[0] = &v31;
    std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v22;
}

void sub_213D5BAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25)
{
  void *v25;
  void *v26;

  __p = &a24;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_213D5BBA4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24D0E9B20, MEMORY[0x24BEDAAF0]);
}

void sub_213D5BC84(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7;
  id *v8;
  id *v9;
  id *v10;
  __int128 v11;

  if (a4 >= 2)
  {
    v7 = *(_OWORD *)a1;
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    v11 = v7;
    v8 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>((id *)a1, a3, a4);
    v9 = v8;
    v10 = (id *)(a2 - 16);
    if (v10 == v8)
    {
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v8, (id *)&v11);
    }
    else
    {
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v8, v10);
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v10, (id *)&v11);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(a1, (uint64_t)(v9 + 2), a3, ((uint64_t)v9 - a1 + 16) >> 4);
    }

  }
}

void sub_213D5BD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

id *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = &a1[2 * v5 + 2];
    v9 = (2 * v5) | 1;
    v10 = 2 * v5 + 2;
    if (v10 < a3)
    {
      v11 = objc_msgSend(v8[1], "compare:", v8[3]);
      v8 += 2 * (v11 > 0);
      if (v11 > 0)
        v9 = v10;
    }
    std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](a1, v8);
    a1 = v8;
    v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

id *std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](id *a1, id *a2)
{
  objc_storeStrong(a1, *a2);
  objc_storeStrong(a1 + 1, a2[1]);
  return a1;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v7 = v4 >> 1;
    if (objc_msgSend(*(id *)(a1 + 16 * (v4 >> 1) + 8), "compare:", *(_QWORD *)(a2 - 8)) >= 1)
    {
      v10 = *(void **)(a2 - 16);
      v9 = *(void **)(a2 - 8);
      v8 = a2 - 16;
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(v8 + 8) = 0;
      v12 = v10;
      v13 = v9;
      do
      {
        v11 = (id *)v8;
        v8 = a1 + 16 * v7;
        std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v11, (id *)v8);
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
      }
      while (objc_msgSend(*(id *)(a1 + 16 * v7 + 8), "compare:", v9, v12, v13) > 0);
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100]((id *)v8, &v12);

    }
  }
}

void sub_213D5BF48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void *v5;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 16)
  {

    v5 = *(void **)(i - 16);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

uint64_t std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__push_back_slow_path<std::pair<NSString * {__strong},NSNumber * {__strong}> const&>(uint64_t *a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[5];

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 4;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 3 > v5)
    v5 = v8 >> 3;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v9 = 0xFFFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v14[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSString * {__strong},NSNumber * {__strong}>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[16 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[16 * v9];
  *(_QWORD *)v11 = *a2;
  *((_QWORD *)v11 + 1) = a2[1];
  v14[2] = v11 + 16;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_213D5C084(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *((_OWORD *)v2 - 1);
    v2 -= 2;
    *v2 = 0;
    v2[1] = 0;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
  }
  a2[1] = v4;
  v6 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSString * {__strong},NSNumber * {__strong}>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;

  }
}

void std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }
}

void std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,float>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::pair<std::string,float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>(std::string *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v8;
  std::string *v9;
  std::string *v10;
  void *__p[2];
  __int128 v12;

  if (a4 >= 2)
  {
    *(_OWORD *)__p = 0u;
    v12 = 0u;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)__p, this->__r_.__value_.__l.__data_, this->__r_.__value_.__l.__size_);
    }
    else
    {
      v8 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
      *(_QWORD *)&v12 = *((_QWORD *)&this->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v8;
    }
    DWORD2(v12) = this[1].__r_.__value_.__l.__data_;
    v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(this, a3, a4);
    v10 = v9;
    if ((std::string *)(a2 - 32) == v9)
    {
      std::string::operator=(v9, (const std::string *)__p);
      LODWORD(v10[1].__r_.__value_.__l.__data_) = DWORD2(v12);
    }
    else
    {
      std::string::operator=(v9, (const std::string *)(a2 - 32));
      LODWORD(v10[1].__r_.__value_.__l.__data_) = *(_DWORD *)(a2 - 8);
      std::string::operator=((std::string *)(a2 - 32), (const std::string *)__p);
      *(_DWORD *)(a2 - 8) = DWORD2(v12);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>((uint64_t)this, (uint64_t)&v10[1].__r_.__value_.__l.__size_, a3, ((char *)&v10[1].__r_.__value_.__r.__words[1] - (char *)this) >> 5);
    }
    if (SBYTE7(v12) < 0)
      operator delete(__p[0]);
  }
}

void sub_213D5C450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(std::string *this, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  std::string *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = this;
    this = (std::string *)((char *)this + 32 * v5 + 32);
    v9 = 2 * v5;
    v5 = (2 * v5) | 1;
    v10 = v9 + 2;
    if (v10 < a3 && *(float *)&this[1].__r_.__value_.__l.__data_ > *(float *)&this[2].__r_.__value_.__r.__words[1])
    {
      this = (std::string *)((char *)this + 32);
      v5 = v10;
    }
    std::string::operator=(v8, this);
    LODWORD(v8[1].__r_.__value_.__l.__data_) = this[1].__r_.__value_.__l.__data_;
  }
  while (v5 <= v7);
  return this;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v7;
  float v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  void *__p[2];
  __int128 v13;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v7 = v4 >> 1;
    v8 = *(float *)(a2 - 8);
    if (*(float *)(a1 + 32 * (v4 >> 1) + 24) > v8)
    {
      v9 = (std::string *)(a2 - 32);
      *(_OWORD *)__p = 0u;
      v13 = 0u;
      if (*(char *)(a2 - 9) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__p, *(const std::string::value_type **)(a2 - 32), *(_QWORD *)(a2 - 24));
        v8 = *(float *)(a2 - 8);
      }
      else
      {
        v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
        *(_QWORD *)&v13 = *(_QWORD *)(a2 - 16);
        *(_OWORD *)__p = v10;
      }
      *((float *)&v13 + 2) = v8;
      do
      {
        v11 = (std::string *)(a1 + 32 * v7);
        std::string::operator=(v9, v11);
        LODWORD(v9[1].__r_.__value_.__l.__data_) = v11[1].__r_.__value_.__l.__data_;
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v9 = v11;
      }
      while (*(float *)(a1 + 32 * v7 + 24) > *((float *)&v13 + 2));
      std::string::operator=(v11, (const std::string *)__p);
      LODWORD(v11[1].__r_.__value_.__l.__data_) = DWORD2(v13);
      if (SBYTE7(v13) < 0)
        operator delete(__p[0]);
    }
  }
}

void sub_213D5C608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::string *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,float>>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  v16 = (std::string *)((char *)v11 + 32);
  std::vector<std::pair<std::string,float>>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_213D5C7AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,float>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>>((uint64_t)(a1 + 2), a1[1], (__int128 *)a1[1], *a1, (__int128 *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,float>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>>(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const std::string::value_type **v9;
  std::string *v10;
  __int128 *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v7 = a7;
  v15 = a6;
  v16 = a7;
  if (a3 != a5)
  {
    v9 = (const std::string::value_type **)a3;
    do
    {
      v10 = (std::string *)(v7 - 32);
      v11 = (__int128 *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        std::string::__init_copy_ctor_external(v10, *(v9 - 4), (std::string::size_type)*(v9 - 3));
        v13 = v16;
      }
      else
      {
        v12 = *v11;
        *(_QWORD *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v12;
        v13 = v7;
      }
      *(_DWORD *)(v7 - 8) = *((_DWORD *)v9 - 2);
      v7 = v13 - 32;
      v16 = v13 - 32;
      v9 -= 4;
    }
    while (v11 != a5);
    return v15;
  }
  return a6;
}

void sub_213D5C924(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a12)
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>>::operator()[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(exception_object);
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,float>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::pair<std::string,float>>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::pair<std::string,float>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t json_utf8_string(uint64_t result, _BYTE *a2, unint64_t a3)
{
  char *v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  char v13;
  unsigned __int8 *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned __int8 *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t i;
  uint64_t v40;
  _BYTE *v41;
  unint64_t v42;
  char v43;

  if (result)
  {
    v3 = *(char **)(result + 8);
    if (*(_DWORD *)result == 5)
    {
      v4 = *(_QWORD *)(result + 16);
      v5 = (unint64_t)&a2[a3];
      v6 = a2;
      if (v4 >= 1)
      {
        v7 = (unint64_t)&v3[v4];
        v8 = a2;
        do
        {
          v9 = *v3;
          if ((json_char_table[v9] & 0x40) != 0)
          {
            v14 = (unsigned __int8 *)(v3 + 2);
            v15 = v3[1];
            v16 = json_char_table[v15];
            if ((v16 & 0x10000) != 0)
            {
              if ((v16 & 0x40) != 0)
              {
                do
                {
                  if ((unint64_t)v14 >= v7)
                    break;
                  v19 = *v14++;
                }
                while ((json_char_table[v19] & 0x40) != 0);
              }
              if ((unint64_t)v14 <= v7 - 4)
              {
                v20 = 0;
                v21 = 0;
                do
                {
                  v22 = v14[v20];
                  v23 = (char)v22;
                  v24 = json_char_table[v22];
                  v25 = (v23 - 87) | (16 * v21);
                  if ((v24 & 0x10) == 0)
                    v25 = v21;
                  if ((v24 & 8) != 0)
                    v25 = (v23 - 55) | (16 * v21);
                  v21 = (v23 - 48) | (16 * v21);
                  if ((v24 & 2) == 0)
                    v21 = v25;
                  ++v20;
                }
                while ((_DWORD)v20 != 4);
                v26 = (unsigned __int16)v21;
                if ((uint64_t)(v7 - (_QWORD)v14) < 5)
                {
                  v11 = v14;
                }
                else
                {
                  v11 = v14 + 4;
                  if ((unint64_t)(v14 + 5) < v7
                    && (unsigned __int16)((unsigned __int16)v21 >> 11) >= 0x1Bu
                    && (unsigned __int16)((unsigned __int16)v21 >> 10) <= 0x36u
                    && (json_char_table[*v11] & 0x40) != 0
                    && (uint64_t)(v7 - (_QWORD)v11) >= 3
                    && (json_char_table[v14[5]] & 0x10000) != 0)
                  {
                    v27 = 0;
                    v28 = 0;
                    v11 = v14 + 6;
                    do
                    {
                      v29 = v11[v27];
                      v30 = (char)v29;
                      v31 = json_char_table[v29];
                      v32 = (v30 - 87) | (16 * v28);
                      if ((v31 & 0x10) == 0)
                        v32 = v28;
                      if ((v31 & 8) != 0)
                        v32 = (v30 - 55) | (16 * v28);
                      v28 = (v30 - 48) | (16 * v28);
                      if ((v31 & 2) == 0)
                        v28 = v32;
                      ++v27;
                    }
                    while ((_DWORD)v27 != 4);
                    v33 = (unsigned __int16)v28 >> 10;
                    v34 = ((unsigned __int16)v28 + 9216) | ((v26 << 10) - 56623104);
                    v35 = v14 + 12;
                    if ((uint64_t)(v7 - (_QWORD)v11) <= 6)
                      v35 = v11;
                    if (v33 == 55)
                    {
                      v11 = v35;
                      v26 = v34;
                    }
                  }
                }
                if ((int)v26 >= 128)
                {
                  if (v26 >= 0x800)
                  {
                    v37 = 4 * (v26 < 0x110000);
                    if (v26 < 0x10000)
                      v37 = 3;
                    v6 = &v8[v37];
                    if ((unint64_t)&v8[v37] < v5)
                    {
                      if (!HIWORD(v26))
                      {
                        v8[2] = v26 & 0x3F | 0x80;
                        v8[1] = (v26 >> 6) & 0x3F | 0x80;
                        v26 = (v26 >> 12) | 0xFFFFFFE0;
                        v36 = 3;
                        goto LABEL_75;
                      }
                      if (HIWORD(v26) > 0x10u)
                      {
                        v36 = 0;
                      }
                      else
                      {
                        v8[3] = v26 & 0x3F | 0x80;
                        v8[2] = (v26 >> 6) & 0x3F | 0x80;
                        v8[1] = (v26 >> 12) & 0x3F | 0x80;
                        v26 = (v26 >> 18) | 0xFFFFFFF0;
                        v36 = 4;
LABEL_75:
                        *v8 = v26;
                      }
                      v6 = &v8[v36];
                      goto LABEL_77;
                    }
                  }
                  else
                  {
                    v6 = v8 + 2;
                    if ((unint64_t)(v8 + 2) < v5)
                    {
                      v8[1] = v26 & 0x3F | 0x80;
                      v26 = (v26 >> 6) | 0xFFFFFFC0;
                      v36 = 2;
                      goto LABEL_75;
                    }
                  }
                }
                else
                {
                  v6 = v8 + 1;
                  if ((unint64_t)(v8 + 1) < v5)
                  {
                    v36 = 1;
                    goto LABEL_75;
                  }
                }
                if (v8 + 1 == (_BYTE *)v5)
                {
LABEL_72:
                  *v8 = 0;
                  goto LABEL_77;
                }
              }
              else
              {
                v11 = v14;
              }
              v6 = v8;
            }
            else
            {
              if ((v16 & 0x1E0) != 0)
              {
                HIDWORD(v18) = v15;
                LODWORD(v18) = v15 - 98;
                v17 = v18 >> 1;
                if (v17 <= 9 && ((0x345u >> v17) & 1) != 0)
                  LOBYTE(v15) = byte_213D7E3D8[v17];
              }
              v6 = v8 + 1;
              if ((unint64_t)(v8 + 1) >= v5)
              {
                if (v8 + 1 == (_BYTE *)v5)
                {
                  *v8 = 0;
                  v11 = v14;
                  v6 = (_BYTE *)v5;
                  goto LABEL_77;
                }
              }
              else
              {
                *v8 = v15;
              }
              v11 = v14;
            }
          }
          else
          {
            v10 = utf8_byte_length_noerror_utf8_len_table[v9 >> 4];
            v6 = &v8[v10];
            v11 = (unsigned __int8 *)&v3[v10];
            if ((unint64_t)&v8[v10] < v5 && (unint64_t)v11 <= v7)
            {
              do
              {
                v13 = *v3++;
                *v8++ = v13;
                --v10;
              }
              while (v10);
              goto LABEL_77;
            }
            if (v8 + 1 == (_BYTE *)v5)
              goto LABEL_72;
          }
LABEL_77:
          v8 = v6;
          v3 = (char *)v11;
        }
        while ((unint64_t)v11 < v7);
      }
      if ((unint64_t)v6 < v5)
        *v6 = 0;
      v40 = v6 - a2;
      return v40 + 1;
    }
    if (v3)
    {
      v38 = *(_QWORD *)(result + 16);
      if (v38)
      {
        if (v38 >= a3)
        {
          if (!a3)
          {
LABEL_99:
            v40 = *(_QWORD *)(result + 16);
            return v40 + 1;
          }
          v38 = a3 - 1;
          if (a3 != 1)
          {
            v41 = a2;
            v42 = a3 - 1;
            do
            {
              v43 = *v3++;
              *v41++ = v43;
              --v42;
            }
            while (v42);
          }
        }
        else
        {
          for (i = 0; i != v38; ++i)
            a2[i] = v3[i];
        }
        a2[v38] = 0;
        goto LABEL_99;
      }
    }
    result = 0;
    if (!a2)
      return result;
  }
  else if (!a2)
  {
    return result;
  }
  if (a3)
  {
    result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t json_parse()
{
  char *v0;
  size_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  char v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t, uint64_t, uint64_t *, char *);
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  size_t v54;
  char *v55;
  char *v56;
  _DWORD v57[1024];
  uint64_t v58;

  v0 = (char *)MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v0;
  v58 = *MEMORY[0x24BDAC8D0];
  v53 = v0;
  v54 = 0;
  v55 = 0;
  v56 = v0;
  if ((v1 & 0x8000000000000000) != 0)
  {
    if (!v0)
    {
      v9 = 0;
      v55 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v49 = 0;
LABEL_236:
      v11 = v8;
LABEL_237:
      if (v9 == v11)
        goto LABEL_250;
      while (1)
      {
        v47 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v47] & 1) == 0)
          break;
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
      if ((v7 & 1) != 0)
      {
LABEL_250:
        v9 = v11;
      }
      else if (v9 != v11)
      {
        goto LABEL_246;
      }
      if (v5)
        *v5 = v9 - v8;
      return 1;
    }
    v1 = strlen(v0);
  }
  v9 = &v8[v1];
  v54 = v1;
  v55 = &v8[v1];
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  if (!v1)
    goto LABEL_236;
  bzero(v57, 0x1000uLL);
  LODWORD(v10) = 0;
  while (1)
  {
    v11 = v53;
    v12 = v55;
    if (v53 >= v55)
      v13 = 0;
    else
      v13 = *v53;
    v14 = json_char_table[v13];
    if ((v14 & 0x20) != 0)
    {
      if (!jscon_scan_string(&v53, (uint64_t)&v50))
        goto LABEL_248;
      if ((int)v10 >= 1023)
      {
        v11 = v53;
        goto LABEL_246;
      }
      goto LABEL_16;
    }
    if ((v14 & 0x202) != 0)
      break;
    if (v13 == 91)
    {
      if (v55 - v53 >= 1)
        v11 = ++v53;
      if ((int)v10 >= 1023)
        goto LABEL_246;
      v10 = (int)v10 + 1;
      v57[v10] = 2;
      (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, 4, 0, &v49);
      if (v11 >= v12)
        v41 = 0;
      else
        v41 = *v11;
      if ((json_char_table[v41] & 1) != 0)
      {
        v42 = v53;
        while (1)
        {
          if (v11 >= v12)
          {
            if ((json_char_table[0] & 1) == 0)
            {
              v53 = v42;
              goto LABEL_151;
            }
          }
          else
          {
            v41 = *v11;
            if ((json_char_table[v41] & 1) == 0)
            {
              v53 = v42;
              break;
            }
          }
          if (v12 - v11 >= 1)
            v42 = ++v11;
        }
      }
      if (v41 != 93)
        goto LABEL_151;
      if (v12 - v11 >= 1)
        v53 = v11 + 1;
      v57[v10] = 1;
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      v19 = v3;
      v20 = 5;
      goto LABEL_189;
    }
    if (v13 != 123)
    {
      if ((v14 & 0xE000) == 0)
      {
        if ((v14 & 1) == 0)
          goto LABEL_246;
        v44 = v53;
        while (1)
        {
          v45 = v11 >= v55 ? 0 : *v11;
          if ((json_char_table[v45] & 1) == 0)
            break;
          if (v55 - v11 >= 1)
            v44 = ++v11;
        }
        v53 = v44;
        goto LABEL_151;
      }
      v51 = v53;
      if (v55 - v53 < 5)
      {
        if (v55 - v53 != 4)
          goto LABEL_246;
LABEL_200:
        if (*(_DWORD *)v53 == 1702195828)
        {
          LODWORD(v50) = 2;
        }
        else
        {
          if (*(_DWORD *)v53 != 1819047278)
            goto LABEL_246;
          LODWORD(v50) = 1;
        }
        v52 = 4;
        v11 = v53 + 4;
      }
      else
      {
        if (*(_DWORD *)v53 != 1936482662 || v53[4] != 101)
          goto LABEL_200;
        LODWORD(v50) = 3;
        v52 = 5;
        v11 = v53 + 5;
      }
      v53 = v11;
      if ((int)v10 >= 1023)
        goto LABEL_246;
LABEL_16:
      v10 = (int)v10 + 1;
      v57[v10] = 1;
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      v18 = &v50;
      v19 = v3;
      v20 = 6;
LABEL_17:
      v17(v19, v20, v18, &v49);
      goto LABEL_78;
    }
    if (v55 - v53 >= 1)
      v11 = ++v53;
    if ((int)v10 >= 1023)
      goto LABEL_246;
    v10 = (int)v10 + 1;
    v57[v10] = 3;
    (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, 1, 0, &v49);
    if (v11 >= v12)
      v21 = 0;
    else
      v21 = *v11;
    v22 = json_char_table[v21];
    if ((v22 & 1) == 0)
      goto LABEL_179;
    v23 = v53;
    while (v11 < v12)
    {
      v21 = *v11;
      v22 = json_char_table[v21];
      if ((v22 & 1) == 0)
      {
        v53 = v23;
LABEL_179:
        if ((v22 & 0x20) != 0)
          goto LABEL_218;
        if (v21 != 125)
          goto LABEL_246;
        if (v12 - v11 >= 1)
          v53 = v11 + 1;
        v57[v10] = 1;
        v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
        v19 = v3;
        v20 = 3;
LABEL_189:
        v18 = 0;
        goto LABEL_17;
      }
LABEL_29:
      if (v12 - v11 >= 1)
        v23 = ++v11;
    }
    if ((json_char_table[0] & 1) != 0)
      goto LABEL_29;
    v53 = v23;
    if ((json_char_table[0] & 0x20) == 0)
      goto LABEL_246;
LABEL_218:
    if (!jscon_scan_string(&v53, (uint64_t)&v50))
      goto LABEL_248;
    v11 = v53;
    if (v53 >= v55)
      v46 = 0;
    else
      v46 = *v53;
    if ((json_char_table[v46] & 1) != 0)
    {
      v38 = v53;
      while (1)
      {
        if (v11 >= v55)
        {
          if ((json_char_table[0] & 1) == 0)
          {
LABEL_258:
            v53 = v38;
            goto LABEL_246;
          }
        }
        else
        {
          v46 = *v11;
          if ((json_char_table[v46] & 1) == 0)
          {
            v53 = v38;
            break;
          }
        }
        if (v55 - v11 >= 1)
          v38 = ++v11;
      }
    }
    if (v46 != 58)
      goto LABEL_246;
    if (v55 - v11 >= 1)
      v53 = v11 + 1;
LABEL_150:
    v57[v10] = 4;
    (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 2, &v50, &v49);
LABEL_151:
    if (v49)
      return 0;
  }
  v51 = v53;
  LODWORD(v50) = 6;
  if (v53 >= v55)
    v15 = 0;
  else
    v15 = *v53;
  if ((json_char_table[v15] & 0x200) != 0)
  {
    v16 = v53;
    if (v55 - v53 >= 1)
      v16 = ++v53;
    if (v16 >= v55)
      v15 = 0;
    else
      v15 = *v16;
  }
  else
  {
    v16 = v53;
  }
  if ((json_char_table[v15] & 4) != 0)
  {
    if (v55 - v16 >= 1)
      v53 = ++v16;
    if (v16 >= v55)
      v26 = 0;
    else
      v26 = *v16;
    v27 = json_char_table[v26];
    if ((v27 & 0x800) != 0)
    {
      if (v55 - v16 <= 0)
        goto LABEL_61;
      goto LABEL_60;
    }
    if ((v27 & 0x1000) == 0)
    {
      if ((v27 & 2) == 0)
        goto LABEL_74;
      if (v55 - v16 > 0)
        ++v16;
LABEL_256:
      LODWORD(v50) = 0;
      v11 = v16;
      goto LABEL_247;
    }
    if (v55 - v16 <= 0)
      goto LABEL_129;
LABEL_128:
    v53 = ++v16;
    goto LABEL_129;
  }
  LOWORD(v24) = json_char_table[0];
  while (2)
  {
    v25 = v55 - v16;
LABEL_40:
    if (v16 >= v55)
    {
      if ((json_char_table[0] & 2) == 0)
        goto LABEL_55;
LABEL_42:
      if (v25 >= 1)
      {
        v53 = ++v16;
        continue;
      }
      goto LABEL_40;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0)
    goto LABEL_42;
  v24 = json_char_table[*v16];
LABEL_55:
  if ((v24 & 0x1000) != 0)
  {
    if (v25 <= 0)
    {
LABEL_129:
      LODWORD(v50) = 7;
      if (v16 >= v55)
        v39 = 0;
      else
        v39 = *v16;
      if (v55 - v16 >= 1 && (json_char_table[v39] & 0x600) != 0)
LABEL_133:
        v53 = ++v16;
      while (1)
      {
        v40 = v16 >= v55 ? 0 : *v16;
        if ((json_char_table[v40] & 2) == 0)
          goto LABEL_74;
        if (v55 - v16 >= 1)
          goto LABEL_133;
      }
    }
    goto LABEL_128;
  }
  if ((v24 & 0x800) == 0)
    goto LABEL_74;
  if (v25 >= 1)
LABEL_60:
    v53 = ++v16;
LABEL_61:
  LODWORD(v50) = 7;
  if (v16 >= v55)
  {
    v28 = 0;
  }
  else
  {
    v53 = v16 + 1;
    v28 = *v16++;
  }
  if ((json_char_table[v28] & 2) == 0)
    goto LABEL_256;
  LOWORD(v29) = json_char_table[0];
  while (2)
  {
    v30 = v55 - v16;
LABEL_66:
    if (v16 >= v55)
    {
      if ((json_char_table[0] & 2) == 0)
        goto LABEL_73;
LABEL_68:
      if (v30 >= 1)
      {
        v53 = ++v16;
        continue;
      }
      goto LABEL_66;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0)
    goto LABEL_68;
  v29 = json_char_table[*v16];
LABEL_73:
  if ((v29 & 0x1000) != 0)
  {
    if (v30 < 1)
      goto LABEL_129;
    goto LABEL_128;
  }
LABEL_74:
  if (v16 > v55)
  {
    v53 = v55;
    v16 = v55;
  }
  v52 = v16 - v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 6, &v50, &v49);
  if ((int)v10 >= 1023)
    goto LABEL_256;
  v10 = (int)v10 + 1;
  v57[v10] = 1;
LABEL_78:
  v9 = v55;
  v11 = v53;
  while (2)
  {
    if (v11 >= v9)
      v31 = 0;
    else
      v31 = *v11;
    if ((json_char_table[v31] & 1) != 0)
    {
      while (1)
      {
        v32 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v32] & 1) == 0)
          break;
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
      if (v11 < v9)
      {
        v31 = *v11;
        break;
      }
      v31 = 0;
LABEL_91:
      v33 = v57[v10 - 1];
      if (v33 == 2)
      {
        if (v31 != 93)
          goto LABEL_151;
        if (v9 - v11 >= 1)
          v53 = ++v11;
        v34 = 5;
      }
      else
      {
        if (v33 != 4)
        {
          if (v33)
            goto LABEL_151;
          goto LABEL_237;
        }
        if (v31 != 125)
          goto LABEL_151;
        if (v9 - v11 >= 1)
          v53 = ++v11;
        v34 = 3;
      }
      v57[v10 - 1] = 1;
      (*(void (**)(uint64_t, uint64_t, _QWORD, char *))(v3 + 16))(v3, v34, 0, &v49);
      --v10;
      continue;
    }
    break;
  }
  if (v31 != 44)
    goto LABEL_91;
  v10 = (int)v10 - 1;
  v35 = v57[v10];
  if (v35 == 2)
  {
    if (v9 - v11 >= 1)
      v53 = v11 + 1;
    goto LABEL_151;
  }
  if (v35 == 4)
  {
    if (v9 - v11 >= 1)
      v53 = ++v11;
    v57[v10] = 3;
    if (v11 >= v9)
      v36 = 0;
    else
      v36 = *v11;
    if ((json_char_table[v36] & 1) != 0)
    {
      while (1)
      {
        if (v11 >= v9)
        {
          if ((json_char_table[0] & 1) == 0)
          {
            v36 = 0;
            break;
          }
        }
        else
        {
          v36 = *v11;
          if ((json_char_table[v36] & 1) == 0)
            break;
        }
        if (v9 - v11 >= 1)
          v53 = ++v11;
      }
    }
    if ((json_char_table[v36] & 0x20) != 0)
    {
      if (!jscon_scan_string(&v53, (uint64_t)&v50))
        goto LABEL_248;
      v11 = v53;
      if (v53 >= v55)
        v37 = 0;
      else
        v37 = *v53;
      if ((json_char_table[v37] & 1) != 0)
      {
        v38 = v53;
        while (1)
        {
          if (v11 >= v55)
          {
            if ((json_char_table[0] & 1) == 0)
              goto LABEL_258;
          }
          else
          {
            v37 = *v11;
            if ((json_char_table[v37] & 1) == 0)
            {
              v53 = v38;
              break;
            }
          }
          if (v55 - v11 >= 1)
            v38 = ++v11;
        }
      }
      if (v37 == 58)
      {
        if (v55 - v11 >= 1)
          v53 = v11 + 1;
        goto LABEL_150;
      }
    }
  }
LABEL_246:
  LODWORD(v50) = 0;
LABEL_247:
  v51 = v11;
  v52 = 0;
LABEL_248:
  (*(void (**)(uint64_t, _QWORD, uint64_t *, char *))(v3 + 16))(v3, 0, &v50, &v49);
  return 0;
}

uint64_t jscon_scan_string(char **a1, uint64_t a2)
{
  char *v4;
  char *v5;
  void *v6;
  char *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  unsigned __int8 *v12;
  uint64_t i;
  char *v14;
  int v15;

  v4 = a1[2];
  v5 = *a1;
  if (v4 - *a1 >= 1)
    *a1 = ++v5;
  *(_QWORD *)(a2 + 8) = v5;
  *(_DWORD *)a2 = 4;
  v6 = v5;
  while (1)
  {
    v7 = (char *)memchr(v6, 34, v4 - (_BYTE *)v6);
    if (!v7)
    {
      *(_DWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = v6;
      v11 = (_QWORD *)(a2 + 16);
      goto LABEL_29;
    }
    v8 = (unsigned __int8 *)v7;
    v6 = v7 + 1;
    *a1 = v7 + 1;
    if (*(v7 - 1) != 92)
      break;
    *(_DWORD *)a2 = 5;
    if (*(v7 - 2) == 92)
    {
      v9 = 0;
      do
        v10 = v7[v9-- - 3];
      while (v10 == 92);
      if (((1 - (_DWORD)v9) & 1) == 0)
        break;
    }
  }
  *(_QWORD *)(a2 + 16) = v7 - v5;
  v11 = (_QWORD *)(a2 + 16);
  v12 = (unsigned __int8 *)memchr(v5, 92, v7 - v5);
  for (i = 1; v12 && v12 < v8; i = 1)
  {
    *(_DWORD *)a2 = 5;
    v14 = (char *)(v12 + 2);
    v15 = json_char_table[v12[1]];
    if ((v15 & 0x1E0) == 0)
    {
      if ((v15 & 0x10000) == 0 || v8 - (unsigned __int8 *)v14 < 4)
        goto LABEL_28;
      if ((json_char_table[v12[2]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 3);
        goto LABEL_28;
      }
      if ((json_char_table[v12[3]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 4);
        goto LABEL_28;
      }
      if ((json_char_table[v12[4]] & 0x1A) == 0)
      {
        v14 = (char *)(v12 + 5);
LABEL_28:
        *(_DWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v14 - 1;
LABEL_29:
        i = 0;
        *v11 = 0;
        return i;
      }
      v14 = (char *)(v12 + 6);
      if ((json_char_table[v12[5]] & 0x1A) == 0)
        goto LABEL_28;
    }
    v12 = (unsigned __int8 *)memchr(v14, 92, v8 - (unsigned __int8 *)v14);
  }
  return i;
}

id _SDEventMonitorErrorMake(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDD0FC8];
  v7[0] = a1;
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SDEventMonitorErrorDomain"), -1000, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id SDPommesStemWord(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "cStringUsingEncoding:", 4);
  v2 = PRPommesStemWordWithCString();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v2, 4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    free(v3);
  }
  else
  {
    v4 = v1;
  }

  return v4;
}

void sub_213D6097C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D60A28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D60B74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 si_tracing_restore_current_span(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  si_tracing_log_span_end();
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  return result;
}

void sub_213D6143C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D618F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,__int128 a57,__int128 a58,uint64_t a59)
{
  uint64_t v59;
  id *v60;
  __int128 v62;

  objc_destroyWeak(v60);
  si_tracing_restore_current_span((uint64_t)&a51);
  v62 = a58;
  *(_OWORD *)v59 = a57;
  *(_OWORD *)(v59 + 16) = v62;
  *(_QWORD *)(v59 + 32) = a59;
  _Unwind_Resume(a1);
}

void sub_213D61DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__int128 a25,__int128 a26,uint64_t a27)
{
  uint64_t v27;
  __int128 v29;

  si_tracing_restore_current_span((uint64_t)&a19);
  v29 = a26;
  *(_OWORD *)v27 = a25;
  *(_OWORD *)(v27 + 16) = v29;
  *(_QWORD *)(v27 + 32) = a27;
  _Unwind_Resume(a1);
}

void sub_213D61F14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6247C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;
  uint64_t v29;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v29 - 200));
  _Block_object_dispose((const void *)(v29 - 192), 8);
  si_tracing_restore_current_span(v29 - 160);
  _Unwind_Resume(a1);
}

void sub_213D62630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;
  __int128 v21;

  si_tracing_restore_current_span((uint64_t)&a11);
  v21 = a18;
  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = v21;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(a1);
}

void sub_213D627B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_9_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void updateStorageUsageIgnoreLinks(void *a1, void *a2, uint64_t a3, int a4, int a5)
{
  id v9;
  int v10;
  __CFString *v11;
  id v12;

  v12 = a1;
  v9 = a2;
  incrementIndexStorageSize(v12, CFSTR("total"), a3);
  if (a4)
    incrementIndexStorageSize(v12, CFSTR("purgeable"), a3);
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("SpotlightKnowledge"));
  if ((v10 & 1) != 0 || !a5)
  {
    if (v10)
      v11 = CFSTR("knowledgeGraph");
    else
      v11 = CFSTR("other");
    incrementIndexStorageSize(v12, v11, a3);
  }

}

void incrementIndexStorageSize(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a1;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD16E0];
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + a3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v5);

    v5 = v6;
    v6 = (id)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:");
  }

}

uint64_t isTermIndex(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "hasSuffix:", CFSTR(".indexDirectory")) & 1) != 0
    || (objc_msgSend(v1, "hasSuffix:", CFSTR(".indexCompactDirectory")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "hasSuffix:", CFSTR(".indexArrays"));
  }

  return v2;
}

uint64_t isJournal(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("journalAttr."));

  return v2;
}

uint64_t CSGetDiskVersionForContentURL(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  char v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  int8x16_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  if (!v7)
  {
    v15 = 0;
    if (!a4)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = objc_msgSend(v7, "isFileURL");
  if (!a3 || !v8 || (v9 & 1) == 0)
  {
    v30 = *MEMORY[0x24BDD1328];
    v31[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_13;
    goto LABEL_12;
  }
  v29 = 512;
  v27 = 0u;
  v28 = xmmword_213D7E418;
  v26 = 0u;
  v10 = open((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), 2129924);
  if ((v10 & 0x80000000) == 0)
  {
    v11 = v10;
    if (fgetattrlist(v10, &v28, &v26, 0x20uLL, 0x20u) < 0)
      goto LABEL_20;
    v12 = *((_QWORD *)&v27 + 1);
    v14 = DWORD2(v26);
    v13 = HIDWORD(v26);
    *(_QWORD *)a3 = v27;
    *(_QWORD *)(a3 + 8) = v13;
    *(_QWORD *)(a3 + 16) = v12;
    *(_BYTE *)(a3 + 24) = (v14 & 0x40000000) != 0;
    if (objc_msgSend(v8, "conformsToType:", *MEMORY[0x24BDF8500]))
    {
      if (DWORD1(v26) == 2)
      {
        v24 = 0u;
        v25 = 0u;
        v23 = 1;
        if ((ffsctl(v11, 0xC0284A20uLL, &v23, 0) & 0x80000000) == 0)
        {
          *(int8x16_t *)(a3 + 8) = vextq_s8(v25, v25, 8uLL);
LABEL_23:
          close(v11);
          v16 = 1;
          goto LABEL_15;
        }
LABEL_20:
        if (a4)
        {
          v18 = (void *)MEMORY[0x24BDD1540];
          v19 = *MEMORY[0x24BDD1128];
          v20 = *__error();
          v21 = v18;
          v22 = v19;
LABEL_26:
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v20, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        goto LABEL_27;
      }
    }
    else if (DWORD1(v26) == 1)
    {
      goto LABEL_23;
    }
    if (a4)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD1128];
      v20 = 79;
      goto LABEL_26;
    }
LABEL_27:
    close(v11);
    goto LABEL_14;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_14:
  v16 = 0;
LABEL_15:

  return v16;
}

void sub_213D6452C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_213D64B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_213D68304(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D68BD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D68F70(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D690A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D69424(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6955C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D69AD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D69C20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D69FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6A0D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6A490(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D6A5C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6A9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  si_tracing_restore_current_span((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_213D6ACF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6B21C(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D6B370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6B768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_213D6B960(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6BA84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6BCC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_213D6BE20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6C0BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_213D6C1FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6C400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  si_tracing_restore_current_span((uint64_t)&a27);
  _Unwind_Resume(a1);
}

void sub_213D6C524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6C744(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6C868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6CC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  si_tracing_restore_current_span((uint64_t)&a33);
  _Unwind_Resume(a1);
}

void sub_213D6D16C(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6D2A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6D3DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6D770(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6D8B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_213D6DAE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_213D6DC6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, __int128 a18, uint64_t a19)
{
  uint64_t v19;

  *(_OWORD *)v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(_QWORD *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id getSystemVersionString()
{
  if (getSystemVersionString_once != -1)
    dispatch_once(&getSystemVersionString_once, &__block_literal_global_10);
  return (id)getSystemVersionString_systemVersionStr;
}

void __getSystemVersionString_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const __CFString *Value;
  CFStringRef Copy;
  void *v4;

  v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v1 = v0;
    Value = (const __CFString *)CFDictionaryGetValue(v0, (const void *)*MEMORY[0x24BDBD1F0]);
    if (Value)
    {
      Copy = CFStringCreateCopy(0, Value);
      v4 = (void *)getSystemVersionString_systemVersionStr;
      getSystemVersionString_systemVersionStr = (uint64_t)Copy;

    }
    CFRelease(v1);
  }
  if (!getSystemVersionString_systemVersionStr)
  {
    getSystemVersionString_systemVersionStr = (uint64_t)&stru_24D0EF078;

  }
}

uint64_t signalHandler(uint64_t result)
{
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (result == 15)
  {
    if ((signalHandler_didHandleSIGTERM & 1) == 0)
    {
      signalHandler_didHandleSIGTERM = 1;
      logForCSLogCategoryDefault();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_213CF1000, v1, OS_LOG_TYPE_INFO, "Received SIGTERM", (uint8_t *)&v5, 2u);
      }

      objc_msgSend((id)sSignalHandlerDelegate, "didReceiveSignal:", 15);
      logForCSLogCategoryDefault();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_INFO, "Exiting", (uint8_t *)&v5, 2u);
      }

      exit(0);
    }
  }
  else
  {
    v3 = result;
    logForCSLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_213CF1000, v4, OS_LOG_TYPE_INFO, "Received signal %lu", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend((id)sSignalHandlerDelegate, "didReceiveSignal:", v3);
  }
  return result;
}

uint64_t releaseCallback()
{
  return SICorrectionDestory();
}

void sub_213D70A2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213D70DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_213D71138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_QWORD *__si_process_corrections_block_invoke(_QWORD *result, int a2, __int128 *a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  int *v21;
  int v22;
  int v23;

  v4 = result;
  switch(a2)
  {
    case 1:
      v5 = *(_QWORD *)(result[7] + 8);
      v6 = *(_DWORD *)(v5 + 24) + 1;
      goto LABEL_25;
    case 2:
      v8 = *(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24);
      if (v8 == 1)
      {
        *(_QWORD *)(result[11] + 8) = result[12];
        if (*(_QWORD *)(result[11] + 8 * *(int *)(*(_QWORD *)(result[7] + 8) + 24) - 8) == result[14])
        {
          v14 = *(_QWORD *)(result[8] + 8);
          v15 = *(_QWORD *)(v14 + 24);
          if (v15 <= 0x3FF)
          {
            v16 = *(_QWORD *)(*(_QWORD *)(result[10] + 8) + 24);
            *(_QWORD *)(v14 + 24) = v15 + 1;
            v17 = v16 + 24 * v15;
            v18 = *a3;
            *(_QWORD *)(v17 + 16) = *((_QWORD *)a3 + 2);
            *(_OWORD *)v17 = v18;
          }
        }
      }
      else
      {
        if (v8)
          return result;
        *(_QWORD *)result[11] = result[12];
        v9 = *((_QWORD *)a3 + 2);
        switch(v9)
        {
          case 8:
            if (**((_QWORD **)a3 + 1) != 0x65676175676E616CLL)
              return result;
            v11 = result[16];
            goto LABEL_38;
          case 7:
            v21 = (int *)*((_QWORD *)a3 + 1);
            v22 = *v21;
            v23 = *(int *)((char *)v21 + 3);
            if (v22 == 1936876918 && v23 == 1852795251)
            {
              v11 = result[15];
              goto LABEL_38;
            }
            break;
          case 1:
            v10 = **((unsigned __int8 **)a3 + 1);
            if (v10 == 113)
            {
              *(_QWORD *)(result[11] + 8 * *(int *)(*(_QWORD *)(result[7] + 8) + 24)) = result[13];
              v10 = **((unsigned __int8 **)a3 + 1);
            }
            if (v10 == 99)
            {
              v11 = result[14];
LABEL_38:
              *(_QWORD *)(result[11] + 8 * *(int *)(*(_QWORD *)(result[7] + 8) + 24)) = v11;
            }
            break;
        }
      }
      return result;
    case 3:
      v5 = *(_QWORD *)(result[7] + 8);
      v7 = *(_DWORD *)(v5 + 24);
      if (v7 == 1)
      {
        if (*(_QWORD *)(*(_QWORD *)(result[8] + 8) + 24))
        {
          result = (_QWORD *)(*(uint64_t (**)(void))(result[4] + 16))();
          *(_QWORD *)(*(_QWORD *)(v4[8] + 8) + 24) = 0;
          v5 = *(_QWORD *)(v4[7] + 8);
          v7 = *(_DWORD *)(v5 + 24);
        }
        else
        {
          v7 = 1;
        }
      }
      v6 = v7 - 1;
LABEL_25:
      *(_DWORD *)(v5 + 24) = v6;
      return result;
    case 6:
      if (*(_DWORD *)(*(_QWORD *)(result[7] + 8) + 24))
        return result;
      v12 = *(_QWORD *)result[11];
      if (v12 == result[13])
      {
        v19 = *(_QWORD *)(result[9] + 8);
        v20 = *a3;
        *(_QWORD *)(v19 + 48) = *((_QWORD *)a3 + 2);
        *(_OWORD *)(v19 + 32) = v20;
        *(_QWORD *)(*(_QWORD *)(result[8] + 8) + 24) = 0;
      }
      else
      {
        if (v12 == result[16])
        {
          v13 = result[5];
        }
        else
        {
          if (v12 != result[15])
            return result;
          v13 = result[6];
        }
        return (_QWORD *)(*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v13 + 16))(v13, a3, a4);
      }
      return result;
    default:
      return result;
  }
}

void newHeartbeatDict_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_14_0(&dword_213CF1000, v0, v1, "Error getting parent directory age: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void protectionClassForAnalytics_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_2(&dword_213CF1000, a2, v3, "Invalid dataclass %s", v4);
  OUTLINED_FUNCTION_11();
}

void setClientStateForIndexing_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_213CF1000, v0, v1, "No client state to save for bundleID:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void wait_for_apfs_kb_state_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, (uint64_t)v0, "APFSIOC_VOLUME_CLASSKB_OP error %d for %s", v1);
  OUTLINED_FUNCTION_1();
}

void ___setup_block_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_16();
  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x2199C2F34](*(_QWORD *)(v1 + 32));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24(&dword_213CF1000, v0, v3, "operation canceled %p from line %d", v4);

  OUTLINED_FUNCTION_7();
}

void __updatedFrom2024Seed_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Failed to get previous build", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void __updatedFrom2024Seed_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error creating build format %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void is2024Seed_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_213CF1000, v0, v1, "Error creating seed build format %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __processItemsForImport_block_invoke_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = lastTimeOnPower_block_invoke_5_counter;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fileType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 48), "count");
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = 67110402;
  v11[1] = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2048;
  v17 = a3;
  v18 = 2048;
  v19 = v9;
  v20 = 2112;
  v21 = v10;
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "==== SENDING WORK %d %@ for type:%@ (timeout:%g) count:%ld unique:%@", (uint8_t *)v11, 0x3Au);

}

void __processItemsForImportInner_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_1_1(&dword_213CF1000, v0, v1, "Index ref nil when trying to process items for import", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_1();
}

void SDTransactionCreate_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "SDTransactionCreate, %@", a5, a6, a7, a8, 2u);
}

void SDTransactionDone_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "SDTransactionDone, %s", a5, a6, a7, a8, 2u);
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x24BE07878]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x24BDBBC60]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x24BE04650]();
}

uint64_t CSFriendlyFieldName()
{
  return MEMORY[0x24BDC1948]();
}

uint64_t CSSanitizeProtectionClass()
{
  return MEMORY[0x24BDC19A8]();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x24BDD87E8]();
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return (CFStringRef)MEMORY[0x24BDD8830](snapshot);
}

CFRunLoopSourceRef IOPSNotificationCreateRunLoopSource(IOPowerSourceCallbackType callback, void *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD8860](callback, context);
}

uint64_t MKBDeviceLockAssertion()
{
  return MEMORY[0x24BE67128]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PRPommesStemWordWithCString()
{
  return MEMORY[0x24BE67288]();
}

uint64_t SIAddCorrection()
{
  return MEMORY[0x24BE67290]();
}

uint64_t SICancel()
{
  return MEMORY[0x24BE67298]();
}

uint64_t SICloseCache()
{
  return MEMORY[0x24BE672A0]();
}

uint64_t SICloseIndex()
{
  return MEMORY[0x24BE672A8]();
}

uint64_t SICloseJWLIndex()
{
  return MEMORY[0x24BE672B0]();
}

uint64_t SICopyCSClientStateCache()
{
  return MEMORY[0x24BE672B8]();
}

uint64_t SICopyCachedCSClientState()
{
  return MEMORY[0x24BE672C0]();
}

uint64_t SICopyCorrections()
{
  return MEMORY[0x24BE672C8]();
}

uint64_t SICopyProperties()
{
  return MEMORY[0x24BE672D0]();
}

uint64_t SICopyProperty()
{
  return MEMORY[0x24BE672D8]();
}

uint64_t SICopyRoundedDate()
{
  return MEMORY[0x24BE672E0]();
}

uint64_t SICorrectionCommit()
{
  return MEMORY[0x24BE672E8]();
}

uint64_t SICorrectionCreate()
{
  return MEMORY[0x24BE672F0]();
}

uint64_t SICorrectionDestory()
{
  return MEMORY[0x24BE672F8]();
}

uint64_t SICreateAssertedJournalFile()
{
  return MEMORY[0x24BE67300]();
}

uint64_t SIDeleteAttributes()
{
  return MEMORY[0x24BE67308]();
}

uint64_t SIDeleteBgAssertionFile()
{
  return MEMORY[0x24BE67310]();
}

uint64_t SIDeleteCSAttributes()
{
  return MEMORY[0x24BE67318]();
}

uint64_t SIDeleteCSClientStateCache()
{
  return MEMORY[0x24BE67320]();
}

uint64_t SIDeleteCSItems()
{
  return MEMORY[0x24BE67328]();
}

uint64_t SIDeleteCacheEntry()
{
  return MEMORY[0x24BE67330]();
}

uint64_t SIDropAssertion()
{
  return MEMORY[0x24BE67338]();
}

uint64_t SIExecuteQueryWithResultsCallbackForTags()
{
  return MEMORY[0x24BE67340]();
}

uint64_t SIFetchCSClientState()
{
  return MEMORY[0x24BE67348]();
}

uint64_t SIFetchTopKTerms()
{
  return MEMORY[0x24BE67350]();
}

uint64_t SIFixupPaths()
{
  return MEMORY[0x24BE67358]();
}

uint64_t SIFlushAndSuspendIndex()
{
  return MEMORY[0x24BE67360]();
}

uint64_t SIGetAccumulatedSizeForGroup()
{
  return MEMORY[0x24BE67368]();
}

uint64_t SIGetAccumulatedStorageSizeForBundleId()
{
  return MEMORY[0x24BE67370]();
}

uint64_t SIGetAccumulatedWorkTimeSinceLastSync()
{
  return MEMORY[0x24BE67378]();
}

uint64_t SIGetCSAttributes()
{
  return MEMORY[0x24BE67380]();
}

uint64_t SIGetCacheEntry()
{
  return MEMORY[0x24BE67388]();
}

uint64_t SIGetCacheFd()
{
  return MEMORY[0x24BE67390]();
}

uint64_t SIGetLockedJournalingState()
{
  return MEMORY[0x24BE673A0]();
}

uint64_t SIGetObjectCount()
{
  return MEMORY[0x24BE673A8]();
}

uint64_t SIGetRebuildReason()
{
  return MEMORY[0x24BE673B0]();
}

uint64_t SIIndexInactive()
{
  return MEMORY[0x24BE673B8]();
}

uint64_t SIIndexIsInPlayback()
{
  return MEMORY[0x24BE673C0]();
}

uint64_t SIIsLockedIndexingMode()
{
  return MEMORY[0x24BE673C8]();
}

uint64_t SILogActivity()
{
  return MEMORY[0x24BE673D0]();
}

uint64_t SIOpenIndexAtPathWithCallbacks()
{
  return MEMORY[0x24BE673D8]();
}

uint64_t SIOpenJWLIndex()
{
  return MEMORY[0x24BE673E0]();
}

uint64_t SIPreHeatIndex()
{
  return MEMORY[0x24BE673E8]();
}

uint64_t SIQueryCreateWithItems()
{
  return MEMORY[0x24BE673F0]();
}

uint64_t SIQueryCreateWithParameters()
{
  return MEMORY[0x24BE673F8]();
}

uint64_t SIQueryRelease()
{
  return MEMORY[0x24BE67400]();
}

uint64_t SIQueryRetain()
{
  return MEMORY[0x24BE67408]();
}

uint64_t SIQuerySetBatchingParameters()
{
  return MEMORY[0x24BE67410]();
}

uint64_t SIReleaseJournalAssertion()
{
  return MEMORY[0x24BE67418]();
}

uint64_t SIResultBatchFree()
{
  return MEMORY[0x24BE67420]();
}

uint64_t SIResultQueueCancel()
{
  return MEMORY[0x24BE67428]();
}

uint64_t SIResultQueueCreate()
{
  return MEMORY[0x24BE67430]();
}

uint64_t SIResultQueueDequeue()
{
  return MEMORY[0x24BE67438]();
}

uint64_t SIResultQueueNoWakeupTrigger()
{
  return MEMORY[0x24BE67440]();
}

uint64_t SIResultQueueRelease()
{
  return MEMORY[0x24BE67448]();
}

uint64_t SIResultQueueSetWakeupTrigger()
{
  return MEMORY[0x24BE67450]();
}

uint64_t SIResumeForUnlock()
{
  return MEMORY[0x24BE67458]();
}

uint64_t SIResumeIndex()
{
  return MEMORY[0x24BE67460]();
}

uint64_t SISetAccumulatedWorkBoundaryCrossCallback()
{
  return MEMORY[0x24BE67468]();
}

uint64_t SISetBgAssertionFlag()
{
  return MEMORY[0x24BE67470]();
}

uint64_t SISetCSAttributes()
{
  return MEMORY[0x24BE67478]();
}

uint64_t SISetCacheEntry()
{
  return MEMORY[0x24BE67480]();
}

uint64_t SISetCodedAttributes()
{
  return MEMORY[0x24BE67488]();
}

uint64_t SISetDefaultSchemaData()
{
  return MEMORY[0x24BE67498]();
}

uint64_t SISetFileProvidersCallbacks()
{
  return MEMORY[0x24BE674A0]();
}

uint64_t SISetICUCacheFd()
{
  return MEMORY[0x24BE674A8]();
}

uint64_t SISetLockedJournalingState()
{
  return MEMORY[0x24BE674B0]();
}

uint64_t SISetLogging()
{
  return MEMORY[0x24BE674B8]();
}

uint64_t SISetProperty()
{
  return MEMORY[0x24BE674C0]();
}

uint64_t SISetQueryCSFieldNameCallback()
{
  return MEMORY[0x24BE674C8]();
}

uint64_t SISyncIndex()
{
  return MEMORY[0x24BE674D0]();
}

uint64_t SISyncIndexForLikelyShutdown()
{
  return MEMORY[0x24BE674D8]();
}

uint64_t SISynchedOp()
{
  return MEMORY[0x24BE674E0]();
}

uint64_t SISynchedOpPropagatingPriority()
{
  return MEMORY[0x24BE674E8]();
}

uint64_t SITransferDeletionJournals()
{
  return MEMORY[0x24BE674F0]();
}

uint64_t SIUserCtxCreateWithLanguages()
{
  return MEMORY[0x24BE674F8]();
}

uint64_t SIUserCtxSetEntitlements()
{
  return MEMORY[0x24BE67500]();
}

uint64_t SIValidIndex()
{
  return MEMORY[0x24BE67508]();
}

uint64_t SIWaitForAllIndexShutdown()
{
  return MEMORY[0x24BE67510]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x24BDE8D38](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return MEMORY[0x24BDBD100]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _MDItemDecrypt()
{
  return MEMORY[0x24BE121D8]();
}

uint64_t _MDPlainTextFromHTMLData()
{
  return MEMORY[0x24BDC24F8]();
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x24BE66730]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x24BE66738]();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return MEMORY[0x24BE66748]();
}

uint64_t _MDPlistBytesGetByteVector()
{
  return MEMORY[0x24BE66750]();
}

uint64_t _MDPlistBytesGetByteVectorCount()
{
  return MEMORY[0x24BE66758]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x24BE66788]();
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return MEMORY[0x24BE66790]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x24BE667A0]();
}

uint64_t _MDPlistContainerCreateWithObject()
{
  return MEMORY[0x24BE667A8]();
}

uint64_t _MDPlistContainerGetBytes()
{
  return MEMORY[0x24BE667C8]();
}

uint64_t _MDPlistContainerGetLength()
{
  return MEMORY[0x24BE667D0]();
}

uint64_t _MDPlistDateGetValue()
{
  return MEMORY[0x24BE667E0]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x24BE667F0]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x24BE667F8]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x24BE66800]();
}

uint64_t _MDPlistGetRootPlistObjectFromPlist()
{
  return MEMORY[0x24BE66810]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x24BE66818]();
}

uint64_t _MDStoreOIDArrayApplyBlock()
{
  return MEMORY[0x24BE66828]();
}

uint64_t _MDStoreOIDArrayGetVector()
{
  return MEMORY[0x24BE66830]();
}

uint64_t _MDStoreOIDArrayGetVectorCount()
{
  return MEMORY[0x24BE66838]();
}

uint64_t _SIChangeProtectionClassForFilesInDirectory()
{
  return MEMORY[0x24BE67540]();
}

uint64_t _SICheckIndexForDuplicateOids()
{
  return MEMORY[0x24BE67548]();
}

uint64_t _SICleanupStrings()
{
  return MEMORY[0x24BE67550]();
}

uint64_t _SIConsistencyCheck()
{
  return MEMORY[0x24BE67558]();
}

uint64_t _SICooldownIndexFilesForMerge()
{
  return MEMORY[0x24BE67560]();
}

uint64_t _SICrashStateDump()
{
  return MEMORY[0x24BE67568]();
}

uint64_t _SIDeleteBundles()
{
  return MEMORY[0x24BE67570]();
}

uint64_t _SIDirectoryStoreIterate()
{
  return MEMORY[0x24BE67578]();
}

uint64_t _SIFilterValidatedCSImports()
{
  return MEMORY[0x24BE67580]();
}

uint64_t _SIGetIndexCount()
{
  return MEMORY[0x24BE67588]();
}

uint64_t _SIGetMissingParentOID()
{
  return MEMORY[0x24BE67590]();
}

uint64_t _SIIssueDefrag()
{
  return MEMORY[0x24BE67598]();
}

uint64_t _SIIssueFullMergeWithGroup()
{
  return MEMORY[0x24BE675A0]();
}

uint64_t _SIIssueRecovery()
{
  return MEMORY[0x24BE675A8]();
}

uint64_t _SIIssueSplit()
{
  return MEMORY[0x24BE675B0]();
}

uint64_t _SIOpenIndexFilesForMerge()
{
  return MEMORY[0x24BE675B8]();
}

uint64_t _SIReverseStoreIterate()
{
  return MEMORY[0x24BE675C0]();
}

uint64_t _SIScheduleBackgroundOperation()
{
  return MEMORY[0x24BE675C8]();
}

uint64_t _SIScheduleOperationPostIndexUpdate()
{
  return MEMORY[0x24BE675D0]();
}

uint64_t _SISchedulerCopyDump()
{
  return MEMORY[0x24BE675D8]();
}

uint64_t _SISetAssertedJournalNum()
{
  return MEMORY[0x24BE675E0]();
}

uint64_t _SISetContactsIndex()
{
  return MEMORY[0x24BE675E8]();
}

uint64_t _SISetCoreSpotlightCopyBundleRemapCallback()
{
  return MEMORY[0x24BE675F0]();
}

uint64_t _SISetCoreSpotlightRelatedItemCallback()
{
  return MEMORY[0x24BE675F8]();
}

uint64_t _SISetGetLockStateCallback()
{
  return MEMORY[0x24BE67600]();
}

uint64_t _SISetMemoryPressureStatus()
{
  return MEMORY[0x24BE67608]();
}

uint64_t _SISetPriority()
{
  return MEMORY[0x24BE67610]();
}

uint64_t _SISetProtectionClass()
{
  return MEMORY[0x24BE67618]();
}

uint64_t _SISetQueryBehavior()
{
  return MEMORY[0x24BE67620]();
}

uint64_t _SISetTurboMode()
{
  return MEMORY[0x24BE67628]();
}

uint64_t _SIStartPreheatScheduler()
{
  return MEMORY[0x24BE67630]();
}

uint64_t _SITemporarilyChangeProtectionClass()
{
  return MEMORY[0x24BE67638]();
}

uint64_t _SITransferBundles()
{
  return MEMORY[0x24BE67640]();
}

uint64_t _SIValidateActivityJournal()
{
  return MEMORY[0x24BE67648]();
}

uint64_t _SIValidateVectors()
{
  return MEMORY[0x24BE67650]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24D0E9B38(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D0E9B40(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x24BDACA80]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x24BDAD978]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

uint64_t csindex_xpc_dictionary_decode_status_with_error()
{
  return MEMORY[0x24BDC2500]();
}

uint64_t csindex_xpc_dictionary_encode_status_with_error()
{
  return MEMORY[0x24BDC2508]();
}

uint64_t csquery_xpc_dictionary_encode_status()
{
  return MEMORY[0x24BDC2510]();
}

uint64_t csquery_xpc_dictionary_encode_status_with_error()
{
  return MEMORY[0x24BDC2518]();
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x24BDADC38](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE0A8](*(_QWORD *)&a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE360](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x24BDAE510](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t guarded_close_np()
{
  return MEMORY[0x24BDAE7C8]();
}

uint64_t humanize_number()
{
  return MEMORY[0x24BEDE510]();
}

uint64_t isAppleInternalInstall()
{
  return MEMORY[0x24BDC2520]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDAF140](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x24BDAF240](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x24BDAF430]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

int raise(int a1)
{
  return MEMORY[0x24BDAFA30](*(_QWORD *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

uint64_t si_text_store_delete_by_predicate()
{
  return MEMORY[0x24BE67688]();
}

uint64_t si_tracing_calc_next_spanid()
{
  return MEMORY[0x24BE66878]();
}

uint64_t si_tracing_calc_traceid()
{
  return MEMORY[0x24BE66880]();
}

uint64_t si_tracing_log_span_begin()
{
  return MEMORY[0x24BE66890]();
}

uint64_t si_tracing_log_span_end()
{
  return MEMORY[0x24BE66898]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x24BE668A8]();
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0768](connection);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0770](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

uint64_t xpc_connection_is_extension()
{
  return MEMORY[0x24BDB0790]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB08E0](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB0990](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x24BDB09A0](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x24BDB0A40](*(_QWORD *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x24BDB0A78](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

