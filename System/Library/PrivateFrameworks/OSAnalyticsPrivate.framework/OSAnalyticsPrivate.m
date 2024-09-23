void sub_1D3A9188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1D3A99758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OSAStabilityMonitorLogDomain()
{
  if (OSAStabilityMonitorLogDomain_onceToken != -1)
    dispatch_once(&OSAStabilityMonitorLogDomain_onceToken, &__block_literal_global_0);
  return (id)OSAStabilityMonitorLogDomain_domain;
}

id OSAStabilityMonitorLoadParameters()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v10;

  if (objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DC09D0], "clientWithIdentifier:", 295);
    v0 = objc_claimAutoreleasedReturnValue();
    -[NSObject levelForFactor:withNamespaceName:](v0, "levelForFactor:withNamespaceName:", CFSTR("parameters"), CFSTR("OS_ANALYTICS_STABILITY_MONITOR"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v1, "fileValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dataWithContentsOfFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v10 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (!v6)
      {
        OSAStabilityMonitorLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          OSAStabilityMonitorLoadParameters_cold_3();

      }
    }
    else
    {
      OSAStabilityMonitorLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        OSAStabilityMonitorLoadParameters_cold_2();
      v6 = 0;
    }

  }
  else
  {
    OSAStabilityMonitorLogDomain();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      OSAStabilityMonitorLoadParameters_cold_1();
    v6 = 0;
  }

  return v6;
}

void OSAStabilityMonitorEvaluateStabilityForBundleID(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *empty;
  _QWORD handler[4];
  id v17;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7)
  {
    OSAnalyticsHelperServiceConnection();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      OSAStabilityMonitorLoadParameters();
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        ns2xpc();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13 != 0;
        if (v13)
        {
          empty = xpc_dictionary_create_empty();
          xpc_dictionary_set_uint64(empty, "operation", 8uLL);
          xpc_dictionary_set_string(empty, "stability_bundleID", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
          xpc_dictionary_set_value(empty, "stability_parameters", v13);
          if (v8)
            xpc_dictionary_set_string(empty, "stability_coalitionName", (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __OSAStabilityMonitorEvaluateStabilityForBundleID_block_invoke;
          handler[3] = &unk_1E954CDE0;
          v17 = v10;
          xpc_connection_send_message_with_reply(v11, empty, v9, handler);

        }
        else
        {
          OSAStabilityMonitorLogDomain();
          empty = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(empty, OS_LOG_TYPE_ERROR))
            OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4();
        }

      }
      else
      {
        OSAStabilityMonitorLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3();
        v14 = 0;
      }

    }
    else
    {
      OSAStabilityMonitorLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2();
      v14 = 0;
    }

  }
  else
  {
    OSAStabilityMonitorLogDomain();
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1();
    v14 = 0;
  }

  if (v10 && !v14)
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);

}

void OSAStabilityMonitorLoadParameters_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "Trial is not available on this platform.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSAStabilityMonitorLoadParameters_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "Parameters file not available.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSAStabilityMonitorLoadParameters_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, v0, v1, "Error loading parameters: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "A bundle ID is required to evaluate the stability of a single process.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "Error establishing connection to osanalyticshelper.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3A90000, v0, v1, "Error loading parameters from Trial.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSAStabilityMonitorEvaluateStabilityForBundleID_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D3A90000, v0, v1, "Error converting parameters to an XPC object: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t OSAIsDebugEnabledForRSD()
{
  return MEMORY[0x1E0D64F28]();
}

uint64_t OSAIsRSDDevice()
{
  return MEMORY[0x1E0D64F30]();
}

uint64_t OSAIsRSDDisplay()
{
  return MEMORY[0x1E0D64F38]();
}

uint64_t OSAIsRSDHost()
{
  return MEMORY[0x1E0D64F40]();
}

uint64_t OSANSDateFormat()
{
  return MEMORY[0x1E0D64F48]();
}

uint64_t OSASafeOpenWriteOnly()
{
  return MEMORY[0x1E0D64F50]();
}

uint64_t OSAnalyticsHelperServiceConnection()
{
  return MEMORY[0x1E0D64FA8]();
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return MEMORY[0x1E0CD5F28]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1E0CD66C8](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

int deflateReset(z_streamp strm)
{
  return MEMORY[0x1E0DE92F8](strm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83438](__buf, __size, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

uint64_t ns2xpc()
{
  return MEMORY[0x1E0D65008]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t remote_device_browser_cancel()
{
  return MEMORY[0x1E0D86FE0]();
}

uint64_t remote_device_copy_device_with_uuid()
{
  return MEMORY[0x1E0D87008]();
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x1E0D87020]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x1E0D87030]();
}

uint64_t remote_device_copy_unique_of_type()
{
  return MEMORY[0x1E0D87048]();
}

uint64_t remote_device_copy_uuid()
{
  return MEMORY[0x1E0D87050]();
}

uint64_t remote_device_get_name()
{
  return MEMORY[0x1E0D87070]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x1E0D87080]();
}

uint64_t remote_device_get_type()
{
  return MEMORY[0x1E0D87090]();
}

uint64_t remote_device_set_connected_callback()
{
  return MEMORY[0x1E0D870B0]();
}

uint64_t remote_device_set_disconnected_callback()
{
  return MEMORY[0x1E0D870C0]();
}

uint64_t remote_device_start_browsing()
{
  return MEMORY[0x1E0D870D8]();
}

uint64_t remote_device_state_get_description()
{
  return MEMORY[0x1E0D870E8]();
}

uint64_t remote_device_type_get_description()
{
  return MEMORY[0x1E0D870F0]();
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

uint64_t xpc2ns()
{
  return MEMORY[0x1E0D65018]();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x1E0C864C8]();
}

uint64_t xpc_file_transfer_write_to_fd()
{
  return MEMORY[0x1E0C86500]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1E0D87358]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1E0D87368]();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return MEMORY[0x1E0D87380]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x1E0D87398]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1E0D873D0]();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return MEMORY[0x1E0D873D8]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1E0D873F0]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

