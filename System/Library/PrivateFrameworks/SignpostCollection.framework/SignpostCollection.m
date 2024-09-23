void sub_212A38C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  id *v28;
  id *v29;
  uint64_t v30;

  objc_destroyWeak(v29);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(v28);
  objc_destroyWeak((id *)(v30 - 88));
  _Unwind_Resume(a1);
}

void _initOSLogEventProxyFields(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "set_machContinuousTimestamp:", objc_msgSend(v3, "machContinuousTimestamp"));
  objc_msgSend(v4, "setProcessID:", objc_msgSend(v3, "processIdentifier"));
  objc_msgSend(v4, "setProcessUniqueID:", objc_msgSend(v3, "creatorProcessUniqueIdentifier"));
  objc_msgSend(v4, "setThreadID:", objc_msgSend(v3, "threadIdentifier"));
  objc_msgSend(v3, "processImageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcessImageUUID:", v5);

  objc_msgSend(v3, "processImagePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcessImagePath:", v6);

  objc_msgSend(v3, "processImagePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcessName:", v8);

  objc_msgSend(v3, "senderImageUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSenderImageUUID:", v9);

  objc_msgSend(v3, "senderImagePath");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSenderImagePath:", v10);
}

void sub_212A39F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_212A3A46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212A3A930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v28 - 176), 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_212A3B4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void ___dateRangeFromLogArchiveSource_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

void sub_212A3BEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, id *location)
{
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_212A3CF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

double SignpostSystemTimebaseRatio()
{
  if (SignpostSystemTimebaseRatio_onceToken != -1)
    dispatch_once(&SignpostSystemTimebaseRatio_onceToken, &__block_literal_global_0);
  return *(double *)&SignpostSystemTimebaseRatio_timebaseRatio;
}

uint64_t SignpostPlatformForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("macOS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhoneOS")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watchOS")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tvOS")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("bridgeOS")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *StringForSignpostPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_24CE7A6C8[a1 - 1];
}

uint64_t SignpostPlatformForDevice()
{
  return 2;
}

uint64_t SCWriteLoggingAppleTrace(void *a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v21;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)MEMORY[0x212BF7FF4]();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v21 = 0;
  v18 = SCWriteLoggingAppleTraceWithPredicate(v11, v12, v13, v14, v17, &v21);
  v19 = v21;

  objc_autoreleasePoolPop(v16);
  if (!v19 && (v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, CFSTR("Unknown failure"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
    *a6 = objc_retainAutorelease(v19);

  return v18;
}

uint64_t SCWriteLoggingAppleTraceWithPredicate(void *a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int *v33;
  int appended;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void *)MEMORY[0x212BF7FF4]();
  if (v12)
  {
    objc_msgSend(v12, "pathExtension");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", kSCAppleTraceFileExtension);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Output path '%@' does not have the required extension (*.%@)"), v12, kSCAppleTraceFileExtension);
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fileExistsAtPath:", v12);

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Output path '%@' already exists"), v12, v37);
LABEL_8:
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    if (v13 && v14 && objc_msgSend(v13, "compare:", v14) != -1)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v22 = CFSTR("'startDate' >= 'endDate");
      goto LABEL_6;
    }
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    v28 = ktrace_file_create();
    if (!v28)
    {
      v32 = (void *)MEMORY[0x24BDD17C8];
      v33 = __error();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Failed to create trace file due to error: %s"), strerror(*v33), v37);
      goto LABEL_8;
    }
    v26 = v28;
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE60C78], "storeWithArchiveURL:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = v30;

LABEL_28:
        v38 = (void *)v31;
        appended = ktrace_file_append_log_content_from_store();
        if (appended)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create output logging AppleTrace file due to error: %s"), strerror(appended));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, v35);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0;
        }
        else
        {
          v23 = 0;
          v25 = 1;
        }
        v36 = v38;
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not read from input log archive '%@'. Confirm that that file exists and that you have sufficient permissions to read it."), v11);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, v39);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BE60C78], "localStore");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, CFSTR("Could not read from local store. Confirm that you have the 'com.apple.private.logging.diagnostic' entitlement."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = 0;
    v25 = 0;
LABEL_35:

    goto LABEL_10;
  }
  v21 = (void *)MEMORY[0x24BDD1540];
  v22 = CFSTR("nil output loggingAppleTracePath");
LABEL_6:
  objc_msgSend(v21, "errorWithCode:description:", 10, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v25 = 0;
  v26 = 0;
LABEL_10:
  objc_autoreleasePoolPop(v16);
  if ((v25 & 1) == 0 && !v23)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithCode:description:", 10, CFSTR("Unknown failure"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
    *a6 = objc_retainAutorelease(v23);
  if (v26)
    ktrace_file_close();

  return v25;
}

id _signpostcollection_debug_log()
{
  if (_signpostcollection_debug_log_onceToken != -1)
    dispatch_once(&_signpostcollection_debug_log_onceToken, &__block_literal_global_1);
  return (id)_signpostcollection_debug_log_signpost_log;
}

void ___signpostcollection_debug_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SignpostSupport", "SignpostCollection_Debugging");
  v1 = (void *)_signpostcollection_debug_log_signpost_log;
  _signpostcollection_debug_log_signpost_log = (uint64_t)v0;

}

uint64_t _SignpostSupportMachTimeTranslatorPowerChanged()
{
  return objc_msgSend(MEMORY[0x24BE90680], "_processPowerNotificationOfType:withNotificationID:");
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _SignpostSupportSerializationDataFromObjectArray()
{
  return MEMORY[0x24BE906B8]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x24BECDF40]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x24BECDF48]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x24BECDF50]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x24BECDF58]();
}

uint64_t ktrace_file_append_log_content_from_store()
{
  return MEMORY[0x24BECDFB0]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x24BECDFB8]();
}

uint64_t ktrace_file_create()
{
  return MEMORY[0x24BECDFC0]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x24BECDFD0]();
}

uint64_t ktrace_file_open()
{
  return MEMORY[0x24BECDFD8]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

