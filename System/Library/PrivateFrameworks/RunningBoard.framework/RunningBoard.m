void sub_21A8B7674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8B7D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_21A8B8C9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
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

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

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

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x22074BF04](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21A8BC1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_21A8BF6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8C0904(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_21A8C4B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8C5164(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t _RBAssertionManagerStoreComparePids(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

uint64_t RBSAttributePathIncrement(char a1, char a2)
{
  int v2;

  v2 = a1 & 0xF;
  if ((a1 & 0xFu) >= 0xEuLL)
    v2 = 14;
  return ((a2 & 0xF) << (4 * (v2 + 1))) | (v2 + 1);
}

void sub_21A8CA7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8CAA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RBPowerlogEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  RBPLEvent *v10;

  v7 = RBPowerlogEvent_onceToken;
  v8 = a2;
  if (v7 != -1)
    dispatch_once(&RBPowerlogEvent_onceToken, &__block_literal_global_23);
  v9 = (void *)RBPowerlogEvent_eventQueue;
  v10 = -[RBPLEvent initWithevent:identity:assertionCount:pid:]([RBPLEvent alloc], "initWithevent:identity:assertionCount:pid:", a1, v8, a3, a4);

  objc_msgSend(v9, "enqueueEvent:", v10);
}

void sub_21A8D43DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A8D5B7C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x830], 8);
  _Block_object_dispose(&STACK[0x7D0], 8);
  _Unwind_Resume(a1);
}

void sub_21A8D6AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _RBLogAddStateCaptureBlockWithTitle(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  RBLogStateCaptureEntry *v13;
  const char *v14;
  RBLogStateCaptureEntry *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("RBStateCaptureManager.m"), 105, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateCaptureTitle"));

    if (v7)
      goto LABEL_4;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("RBStateCaptureManager.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  if (!v6)
    goto LABEL_12;
LABEL_3:
  if (v7)
    goto LABEL_4;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<RBSInvalidatable> _RBLogAddStateCaptureBlockWithTitle(__strong dispatch_queue_t, NSString *__strong, __strong RBLogStateCaptureBlock, BOOL)");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("RBStateCaptureManager.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateCaptureBlock"));

LABEL_4:
  v8 = v7;
  v9 = v6;
  v10 = (void *)os_state_add_handler();
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_lock);
    if (!_registeredStateCaptureBlocks)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v12 = (void *)_registeredStateCaptureBlocks;
      _registeredStateCaptureBlocks = (uint64_t)v11;

    }
    v13 = objc_alloc_init(RBLogStateCaptureEntry);
    v15 = v13;
    if (v13)
      objc_setProperty_nonatomic_copy(v13, v14, v8, 16);
    -[RBLogStateCaptureEntry setTitle:]((uint64_t)v15, v9);
    -[RBLogStateCaptureEntry setQueue:]((uint64_t)v15, v5);
    v16 = (void *)_registeredStateCaptureBlocks;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v17);

    os_unfair_lock_unlock((os_unfair_lock_t)&_lock);
    v10 = -[RBStateCaptureInvalidator initWithHandle:]([RBStateCaptureInvalidator alloc], (uint64_t)v10);

  }
  return v10;
}

void _addRBProperties(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  xpc_object_t empty;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  xpc_dictionary_get_value(v5, "_AdditionalProperties");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = MEMORY[0x24BDACFA0];
  if (!v8 || MEMORY[0x22074C57C](v8) != v10)
  {
    empty = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v5, "_AdditionalProperties", empty);
    v9 = empty;
  }
  xpc_dictionary_get_value(v9, "RunningBoard");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12 || MEMORY[0x22074C57C](v12) != v10)
  {
    v14 = xpc_dictionary_create_empty();

    xpc_dictionary_set_value(v9, "RunningBoard", v14);
    v13 = v14;
  }
  if (v6)
  {
    objc_msgSend(v6, "encodeForJob");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      xpc_dictionary_set_value(v13, "RunningBoardLaunchedIdentity", v15);
    }
    else
    {
      rbs_job_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        _addRBProperties_cold_1();

    }
  }
  xpc_dictionary_set_BOOL(v13, "RunningBoardLaunched", 1);
  xpc_dictionary_get_value(v13, "Managed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17 && objc_msgSend(v6, "defaultManageFlags") == 255)
    xpc_dictionary_set_BOOL(v13, "Managed", 1);
  objc_msgSend(v7, "beforeTranslocationBundlePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v7, "beforeTranslocationBundlePath");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v13, "BeforeTranslocationBundlePath", (const char *)objc_msgSend(v19, "UTF8String"));

  }
  objc_msgSend(v7, "homeDirectory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v7, "homeDirectory");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v13, "HOME", (const char *)objc_msgSend(v21, "UTF8String"));

  }
  objc_msgSend(v7, "tmpDirectory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "tmpDirectory");
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v13, "TMPDIR", (const char *)objc_msgSend(v23, "UTF8String"));

  }
  objc_msgSend(v7, "spawnConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v7, "spawnConstraint");
    v25 = _CFXPCCreateXPCObjectFromCFObject();
    v26 = (void *)v25;
    if (!v25 || MEMORY[0x22074C57C](v25) != v10)
    {
      rbs_job_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "spawnConstraint");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v6;
        v31 = 2114;
        v32 = v28;
        _os_log_impl(&dword_21A8B4000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to set spawn constraint for job: %{public}@", (uint8_t *)&v29, 0x16u);

      }
    }
    xpc_dictionary_set_value(v5, "SpawnConstraint", v26);

  }
}

void sub_21A8DFFD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_21A8E1694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A8E1864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

id _describeXPCObject()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x22074C498]();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  free(v0);
  return v1;
}

void sub_21A8E33EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_21A8E3FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _handleDeath(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  v7 = a2;
  rbs_ttl_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = 138544130;
      v11 = v5;
      v12 = 1024;
      v13 = objc_msgSend(v6, "os_reason_namespace");
      v14 = 2048;
      v15 = objc_msgSend(v6, "os_reason_code");
      v16 = 1024;
      v17 = objc_msgSend(v6, "wait4Status");
      _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by launchd (%u, %llu, %u)", (uint8_t *)&v10, 0x22u);
    }

    objc_msgSend(MEMORY[0x24BE80C60], "exitContextForNamespace:code:wait4Status:", objc_msgSend(v6, "os_reason_namespace"), objc_msgSend(v6, "os_reason_code"), objc_msgSend(v6, "wait4Status"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastExitContext:", v8);
  }
  else if (v9)
  {
    v10 = 138543362;
    v11 = v5;
    _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ termination reported by launchd without exit status", (uint8_t *)&v10, 0xCu);
  }

  v7[2](v7);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_1_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_1_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return NSRequestConcreteImplementation();
}

void OUTLINED_FUNCTION_0_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id OUTLINED_FUNCTION_0_11(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_0_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void ___backgroundContentFetchingProcessAssertionDuration_block_invoke()
{
  _backgroundContentFetchingProcessAssertionDuration___backgroundContentFetchingProcessAssertionDuration = _positiveDoubleForDefault(CFSTR("BKBackgroundContentFetchingProcessAssertionDuration"), 30.0);
}

double _positiveDoubleForDefault(const __CFString *a1, double a2)
{
  const __CFNumber *v3;
  const __CFNumber *v4;
  CFTypeID v5;
  int Value;
  double valuePtr;

  v3 = (const __CFNumber *)CFPreferencesCopyValue(a1, CFSTR("com.apple.assertiond"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      valuePtr = 0.0;
      Value = CFNumberGetValue(v4, kCFNumberDoubleType, &valuePtr);
      if (valuePtr > 0.0 && Value != 0)
        a2 = valuePtr;
    }
    CFRelease(v4);
  }
  return a2;
}

void ___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion_block_invoke()
{
  _backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion___backgroundTaskCompletionDurationAllowedAfterContentFetchingAssertion = _positiveDoubleForDefault(CFSTR("BKBackgroundContentFetchingTaskCompletionDuration"), 10.0);
}

void sub_21A8F1DAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

id _errorWithRequestCodeAndInfoBuilder(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
    objc_msgSend(v13, "setObject:forKey:", v10, *MEMORY[0x24BDD0FD8]);
  if (v11)
    objc_msgSend(v14, "setObject:forKey:", v11, *MEMORY[0x24BDD1398]);
  if (v12)
    v12[2](v12, v14);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v9, a2, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void _parseEntitlementConfigAndAddToRestrictedEntitlements(void *a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 138412290;
    v20 = v5;
    v21 = v3;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7, v20);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Type"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("Daemon")))
        {
          v24 = v9;
          objc_msgSend(MEMORY[0x24BE80C98], "identityForDaemonJobLabel:", v7);
          v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v11 = v10;
          v25 = v8;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Entitlements"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v4, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  v19 = v18;
                  objc_msgSend(v18, "addObject:", v11);
                }
                else
                {
                  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v11);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKey:", v19, v17);
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v14);
          }

          v3 = v21;
          v9 = v24;
          v8 = v25;
          goto LABEL_23;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("App")))
        {
          v24 = v9;
          objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:jobLabel:auid:platform:", v7, v7, 0, 6);
          v10 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        rbs_general_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v20;
          v36 = v7;
          _os_log_fault_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_FAULT, "_parseEntitlementConfigAndAddToRestrictedEntitlements failed fetching type of identity %@", buf, 0xCu);
        }
LABEL_23:

      }
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v23);
  }

}

NSObject *_getPlistInRunningBoardLibrary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  RBSPathForSystemDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("RunningBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v4, 8, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    v7 = v6;
    rbs_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v7, "localizedDescription");
    v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_21A8B4000, v8, OS_LOG_TYPE_DEFAULT, "_getPlistInRunningBoardLibrary skipped because NSData dataWithContentsOfFile resulted in %{public}@", buf, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, &v12);
  v8 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v7)
  {
    rbs_general_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      _getPlistInRunningBoardLibrary_cold_2(v7, v9);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_general_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      _getPlistInRunningBoardLibrary_cold_1();
    goto LABEL_11;
  }
  v8 = v8;
  v10 = v8;
LABEL_13:

  return v10;
}

id restrictedEntitlementsFromPlist()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _getPlistInRunningBoardLibrary(CFSTR("runningboardEntitlementsConfiguration.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v1;
  if (v1)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v1, v0);
  }
  else
  {
    rbs_general_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      restrictedEntitlementsFromPlist_cold_1(v2);

  }
  _getPlistInRunningBoardLibrary(CFSTR("runningboardAdditionalEntitlementsConfiguration.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v3;
  if (v3)
  {
    _parseEntitlementConfigAndAddToRestrictedEntitlements(v3, v0);
  }
  else
  {
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_INFO, "RunningBoard did not find a secondary entitlements configuration at runningboardAdditionalEntitlementsConfiguration.plist", buf, 2u);
    }

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.runningboard"));
  objc_msgSend(v15, "objectForKey:", CFSTR("AdditionalEntitlementsConfigurations"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _parseEntitlementConfigAndAddToRestrictedEntitlements(v14, v0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v0;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        rbs_general_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v10, v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v10;
          v24 = 2114;
          v25 = v12;
          _os_log_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_INFO, "generated restrictions for entitlement %{public}@: %{public}@", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  return v5;
}

id _posixErrorWithCodeAndDescription(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BDD1128];
  v10 = *MEMORY[0x24BDD0FC8];
  v11[0] = a2;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_21A8FA1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void ___synchronizeJobsQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.runningboardservices.synchronizeJobs", v2);
  v1 = (void *)_synchronizeJobsQueue_queue;
  _synchronizeJobsQueue_queue = (uint64_t)v0;

}

void OUTLINED_FUNCTION_6(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_11(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_12()
{
  void *v0;

  return objc_msgSend(v0, "state");
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

char *OUTLINED_FUNCTION_7(int *a1)
{
  return strerror(*a1);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

int *OUTLINED_FUNCTION_12_0()
{
  return __error();
}

int *OUTLINED_FUNCTION_13_0()
{
  return __error();
}

int *OUTLINED_FUNCTION_17()
{
  return __error();
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void OUTLINED_FUNCTION_21(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

int *OUTLINED_FUNCTION_22()
{
  return __error();
}

int *OUTLINED_FUNCTION_25()
{
  return __error();
}

int *OUTLINED_FUNCTION_26()
{
  return __error();
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

int *OUTLINED_FUNCTION_4_0()
{
  return __error();
}

void sub_21A906814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_21A906BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return xpc_strerror();
}

void sub_21A908D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A908E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A909574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A9096A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A909EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21A90BA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int *OUTLINED_FUNCTION_2_5()
{
  return __error();
}

id safeGetProperty(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    rbs_assertion_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v21 = v7;
      v22 = 2114;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = a3;
      v17 = v23;
      _os_log_error_impl(&dword_21A8B4000, v11, OS_LOG_TYPE_ERROR, "Detected misconfigured attribute. Property %{public}@ had class %{public}@ when class %{public}@ was expected", buf, 0x20u);

    }
    if (v8)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Detected misconfigured attribute. Property %@ had class %@ when class %@ was expected"), v7, objc_opt_class(), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("RBDomainAttributeManagerDataProviderErrorDomain"), 2, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v15);
    }
    goto LABEL_8;
  }
  v10 = v9;
LABEL_9:

  return v10;
}

void OUTLINED_FUNCTION_2_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_11_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_21A914F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "count");
}

void OUTLINED_FUNCTION_9_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void _getPlistInRunningBoardLibrary_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21A8B4000, v0, v1, "_getPlistInRunningBoardLibrary failed because result is not dictionary (%{public}@)", v2);
  OUTLINED_FUNCTION_1_1();
}

void _getPlistInRunningBoardLibrary_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21A8B4000, a2, v4, "_getPlistInRunningBoardLibrary failed in NSPropertyList propertyListWithData with error %{public}@", v5);

}

void restrictedEntitlementsFromPlist_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A8B4000, log, OS_LOG_TYPE_FAULT, "RunningBoard did not find an entitlements configuration at runningboardEntitlementsConfiguration.plist", v1, 2u);
}

void _addRBProperties_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "%{public}@ failed to encode identity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

uint64_t IOGPUDeviceCreate()
{
  return MEMORY[0x24BE51530]();
}

uint64_t IOGPUDeviceSetAppGPURole()
{
  return MEMORY[0x24BE51558]();
}

uint64_t IOPMAssertionDeclareSystemActivityWithProperties()
{
  return MEMORY[0x24BDD8730]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x24BDD8750](*(_QWORD *)&theAssertion, theProperty, theValue);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8980](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromRBSCPUMaximumUsageViolationPolicy()
{
  return MEMORY[0x24BE80A90]();
}

uint64_t NSStringFromRBSDurationEndPolicy()
{
  return MEMORY[0x24BE80A98]();
}

uint64_t NSStringFromRBSDurationStartPolicy()
{
  return MEMORY[0x24BE80AA0]();
}

uint64_t NSStringFromRBSGPURole()
{
  return MEMORY[0x24BE80AA8]();
}

uint64_t NSStringFromRBSLegacyReason()
{
  return MEMORY[0x24BE80AB0]();
}

uint64_t NSStringFromRBSMemoryLimitStrength()
{
  return MEMORY[0x24BE80AB8]();
}

uint64_t NSStringFromRBSRole()
{
  return MEMORY[0x24BE80AC0]();
}

uint64_t NSStringFromRBSTaskState()
{
  return MEMORY[0x24BE80AC8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x24BE74F58]();
}

uint64_t RBSAcquisitionCompletionPolicyIsValid()
{
  return MEMORY[0x24BE80D70]();
}

uint64_t RBSArrayForKey()
{
  return MEMORY[0x24BE80D78]();
}

uint64_t RBSAuditTokenRepresentsPlatformBinary()
{
  return MEMORY[0x24BE80D98]();
}

uint64_t RBSBoolForKey()
{
  return MEMORY[0x24BE80DA0]();
}

uint64_t RBSBundleIDForPID()
{
  return MEMORY[0x24BE80DA8]();
}

uint64_t RBSContainedExtensionBundleIDs()
{
  return MEMORY[0x24BE80DB8]();
}

uint64_t RBSDarwinRoleFromRBSRole()
{
  return MEMORY[0x24BE80DC8]();
}

uint64_t RBSDictionaryForKey()
{
  return MEMORY[0x24BE80DD0]();
}

uint64_t RBSDispatchAsyncWithQoS()
{
  return MEMORY[0x24BE80DD8]();
}

uint64_t RBSEndowmentEncode()
{
  return MEMORY[0x24BE80DE0]();
}

uint64_t RBSExecutablePathForPID()
{
  return MEMORY[0x24BE80DE8]();
}

uint64_t RBSExtensionPointFromBundleDict()
{
  return MEMORY[0x24BE80DF0]();
}

uint64_t RBSInvalidRealAuditToken()
{
  return MEMORY[0x24BE80DF8]();
}

uint64_t RBSMachAbsoluteTime()
{
  return MEMORY[0x24BE80E00]();
}

uint64_t RBSNumberForKey()
{
  return MEMORY[0x24BE80E18]();
}

uint64_t RBSPIDExists()
{
  return MEMORY[0x24BE80E20]();
}

uint64_t RBSPIDIsBeingDebugged()
{
  return MEMORY[0x24BE80E28]();
}

uint64_t RBSPathForSystemDirectory()
{
  return MEMORY[0x24BE80E30]();
}

uint64_t RBSRealAuditTokenValid()
{
  return MEMORY[0x24BE80E40]();
}

uint64_t RBSStringForKey()
{
  return MEMORY[0x24BE80E88]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x24BDE8D80](task);
}

uint64_t WriteCrashReportWithStackshot()
{
  return MEMORY[0x24BE6DFF0]();
}

uint64_t WriteCrashReportWithStackshotWithPayload()
{
  return MEMORY[0x24BE6DFF8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _EXConfigureLaunchContext()
{
  return MEMORY[0x24BDC7A20]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _launch_get_last_exit_reason_4SB()
{
  return MEMORY[0x24BE043C8]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_lockstate()
{
  return MEMORY[0x24BEDDF08]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8E0](atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F0](atoken);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_iterate_results_with_subquery_sync()
{
  return MEMORY[0x24BDADB40]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_operation_set_platform()
{
  return MEMORY[0x24BDADB50]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x24BDADB70]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
}

uint64_t container_query_set_uid()
{
  return MEMORY[0x24BDADB80]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x24BDADF50]();
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE018](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x24BDAE0D0]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t kpersona_find()
{
  return MEMORY[0x24BDAE988]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x24BDAE990]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x24BDAEEA0]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint64_t notify_resume_pid()
{
  return MEMORY[0x24BDAF190]();
}

uint64_t notify_suspend_pid()
{
  return MEMORY[0x24BDAF1A8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x24BDAF2F8]();
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x24BDAF420]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x24BDAF428]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x24BDAF4E8]();
}

uint64_t pid_resume()
{
  return MEMORY[0x24BDAF5B8]();
}

uint64_t pid_shutdown_sockets()
{
  return MEMORY[0x24BDAF5C0]();
}

uint64_t pid_suspend()
{
  return MEMORY[0x24BDAF5C8]();
}

uint64_t proc_disable_cpumon()
{
  return MEMORY[0x24BDAF6B8]();
}

int proc_pidfdinfo(int pid, int fd, int flavor, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F0](*(_QWORD *)&pid, *(_QWORD *)&fd, *(_QWORD *)&flavor, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_resume_cpumon()
{
  return MEMORY[0x24BDAF728]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x24BDAF730]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x24BDAF738]();
}

uint64_t proc_set_cpumon_params_fatal()
{
  return MEMORY[0x24BDAF740]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

uint64_t rbs_assertion_log()
{
  return MEMORY[0x24BE80EA8]();
}

uint64_t rbs_best_effort_networking_log()
{
  return MEMORY[0x24BE80EB0]();
}

uint64_t rbs_connection_log()
{
  return MEMORY[0x24BE80EB8]();
}

uint64_t rbs_general_log()
{
  return MEMORY[0x24BE80EC0]();
}

uint64_t rbs_jetsam_log()
{
  return MEMORY[0x24BE80EC8]();
}

uint64_t rbs_job_log()
{
  return MEMORY[0x24BE80ED0]();
}

uint64_t rbs_job_oversize_log()
{
  return MEMORY[0x24BE80ED8]();
}

uint64_t rbs_message_log()
{
  return MEMORY[0x24BE80EE0]();
}

uint64_t rbs_monitor_log()
{
  return MEMORY[0x24BE80EE8]();
}

uint64_t rbs_power_log()
{
  return MEMORY[0x24BE80EF0]();
}

uint64_t rbs_process_log()
{
  return MEMORY[0x24BE80EF8]();
}

uint64_t rbs_sp_assertion_log()
{
  return MEMORY[0x24BE80F00]();
}

uint64_t rbs_sp_state_log()
{
  return MEMORY[0x24BE80F08]();
}

uint64_t rbs_sp_telemetry_log()
{
  return MEMORY[0x24BE80F10]();
}

uint64_t rbs_sp_therm_log()
{
  return MEMORY[0x24BE80F18]();
}

uint64_t rbs_state_log()
{
  return MEMORY[0x24BE80F20]();
}

uint64_t rbs_ttl_log()
{
  return MEMORY[0x24BE80F28]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x24BDAFBE0]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x24BDAFBE8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x24BDAFC20]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFD28](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x24BDAFD48](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAFDA0](a1, *(_QWORD *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x24BDAFDA8](a1);
}

uint64_t spd_client_start_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x24BEDDEE0]();
}

uint64_t spd_client_stop_monitoring_all_sockets_for_pid()
{
  return MEMORY[0x24BEDDEE8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

uint64_t tailspin_config_create_with_default_config()
{
  return MEMORY[0x24BEDE460]();
}

uint64_t tailspin_config_free()
{
  return MEMORY[0x24BEDE468]();
}

uint64_t tailspin_dump_output_sync()
{
  return MEMORY[0x24BEDE488]();
}

uint64_t tailspin_enabled_set()
{
  return MEMORY[0x24BEDE4A8]();
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x24BDB01F0]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x24BDB0400]();
}

uint64_t wd_endpoint_activate()
{
  return MEMORY[0x24BEC1EE8]();
}

uint64_t wd_endpoint_add_queue()
{
  return MEMORY[0x24BEC1EF0]();
}

uint64_t wd_endpoint_register()
{
  return MEMORY[0x24BEC1EF8]();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB0670](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  MEMORY[0x24BDB06B8](xarray, index, value);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x24BDB06E8]();
}

uint64_t xpc_bundle_get_executable_path()
{
  return MEMORY[0x24BDB06F0]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x24BDB06F8]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x24BDB0700]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  MEMORY[0x24BDB07F8](connection);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
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

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
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

uint64_t xpc_endpoint_get_bs_job_handle()
{
  return MEMORY[0x24BDB0A00]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x24BDB0B78]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x24BDB0BE8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x24BDB0BF0]();
}

