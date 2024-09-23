void sub_2454C1870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  __destructor_8_s8_s16_s24((id *)va);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_t0w1_s8_s16_s24(uint64_t a1, uint64_t a2)
{
  id result;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(id *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(id *)(a2 + 16);
  result = *(id *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

void __destructor_8_s8_s16_s24(id *a1)
{

}

void sub_2454C1A2C(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void sub_2454C1B1C(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2454C375C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2454C3980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2454C3CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2454C42B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2454C46A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2454C5420(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2454C5824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  id *v35;

  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2454C5AAC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2454C5EB4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  __destructor_8_s8_s16_s24(v1);
  __destructor_8_s8_s16_s24((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2454C5FE0(_Unwind_Exception *a1)
{
  id *v1;

  __destructor_8_s8_s16_s24(v1);
  _Unwind_Resume(a1);
}

void sub_2454C63A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;
  id *v13;
  id *v14;
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 112));
  __destructor_8_s8_s16_s24((id *)(v12 + 32));
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_48n29_8_8_t0w32_S_t32w1_s40_s48_s56(uint64_t a1, uint64_t a2)
{
  __int128 v2;

  v2 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v2;
  return __copy_constructor_8_8_t0w1_s8_s16_s24(a1 + 80, a2 + 80);
}

void __destroy_helper_block_e8_48n15_8_S_s40_s48_s56(uint64_t a1)
{
  __destructor_8_s8_s16_s24((id *)(a1 + 80));
}

void sub_2454C6CB0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_2454C6CF4()
{
  JUMPOUT(0x2454C6CE4);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  return a2;
}

id SCLogger()
{
  if (SCLogger_onceToken != -1)
    dispatch_once(&SCLogger_onceToken, &__block_literal_global_1);
  return (id)SCLogger_log;
}

double configWithGlobalDefaults@<D0>(_OWORD *a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 3;
  *a1 = xmmword_2454CF1F0;
  a1[1] = unk_2454CF200;
  return result;
}

uint64_t sharingRemindersStatusToString(uint64_t a1)
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
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
  id v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[18];

  v25[16] = *MEMORY[0x24BDAC8D0];
  v25[0] = CFSTR("Feature flags:");
  v2 = (void *)MEMORY[0x24BDD17C8];
  if (_os_feature_enabled_impl())
    v3 = "Yes";
  else
    v3 = "No";
  objc_msgSend(v2, "stringWithFormat:", CFSTR("  %-42s %s"), "WiFi Sync Feature Flag:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v24;
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (_os_feature_enabled_impl())
    v5 = "Yes";
  else
    v5 = "No";
  objc_msgSend(v4, "stringWithFormat:", CFSTR("  %-42s %s"), "General Reminder Feature Flag:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v23;
  v25[3] = CFSTR("\n");
  v25[4] = CFSTR("Sharing Reminders Status:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %hhu"), "Consecutive notification count:", *(unsigned __int8 *)(a1 + 32));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v22;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %llu"), "Maximum notification count before opt out:", *(_QWORD *)a1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v21;
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(a1 + 40), 1, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("  %-42s %@"), "Last fired date:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %@"), "Scheduled sharing reminders:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v8;
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 56), "valueForKey:", CFSTR("com.apple.safetycheckd.wifi"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("  %-42s %@"), "Non-actionable identifiers (Wifi Sync):", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[9] = v11;
  v25[10] = CFSTR("\n");
  v25[11] = CFSTR("Delays:");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %llu"), "Time interval (backstop):", *(_QWORD *)(a1 + 8));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[12] = v12;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %llu"), "Time interval (general):", *(_QWORD *)(a1 + 16));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[13] = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("  %-42s %llu"), "Time interval (short):", *(_QWORD *)(a1 + 24));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[14] = v14;
  v25[15] = CFSTR("\n");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_retainAutorelease(v16);
  v18 = objc_msgSend(v17, "UTF8String");

  __destructor_8_s8_s16_s24((id *)(a1 + 32));
  return v18;
}

void sub_2454C78D4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t localizedDateStringFromUTC(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", a1, 1, 1);
}

void sub_2454C7D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  __destructor_8_s8_s16_s24((id *)va);
  _Unwind_Resume(a1);
}

void sub_2454C8750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2454C8D9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SCUIBundle()
{
  if (SCUIBundle_onceToken != -1)
    dispatch_once(&SCUIBundle_onceToken, &__block_literal_global_3);
  return (id)SCUIBundle__Bundle;
}

id SCUILocStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SCUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *storeKeyToString(unint64_t a1)
{
  NSObject *v3;

  if (a1 < 4)
    return off_251662A10[a1];
  SCLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    storeKeyToString_cold_1(a1, v3);

  return 0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2454CB534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void storeKeyToString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_2454C0000, a2, OS_LOG_TYPE_ERROR, "\"Cannot cast to string, unsupported key value: %ld\"", (uint8_t *)&v2, 0xCu);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

uint64_t lockdown_copy_wireless_connections_list()
{
  return MEMORY[0x24BEDC500]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

