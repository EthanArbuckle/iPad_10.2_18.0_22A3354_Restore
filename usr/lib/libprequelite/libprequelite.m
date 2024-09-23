uint64_t pql_invoke_xfunc(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (**v6)(void *, sqlite3_context *, uint64_t, uint64_t);

  v6 = (uint64_t (**)(void *, sqlite3_context *, uint64_t, uint64_t))sqlite3_user_data(a1);
  return v6[2](v6, a1, a2, a3);
}

BOOL __PQLCacheKeyEqual(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

void sub_1D466AF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void pql_bind_object(sqlite3_stmt *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "sqliteBind:index:", a1, a2);
    }
    else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFEAA9B0))
    {
      v5 = (void *)MEMORY[0x1D825FB2C]();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v6, "encodeObject:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
      objc_msgSend(v6, "encodedData");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_blob(a1, a2, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

      objc_autoreleasePoolPop(v5);
    }
    else
    {
      objc_msgSend(v9, "description");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      sqlite3_bind_text(a1, a2, (const char *)objc_msgSend(v8, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

    }
  }
  else
  {
    sqlite3_bind_null(a1, a2);
  }

}

id __createObjectFromResultSetWithSel_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unsigned __int8 *v6;
  void *v7;
  int v8;
  char v9;
  uint64_t v10;
  const char *v11;
  IMP MethodImplementation;
  void *v13;

  v5 = a2;
  if (!*(_QWORD *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "columns") == 1)
  {
    v6 = (unsigned __int8 *)*(id *)(a1 + 32);
    v7 = v6;
    if (*((_QWORD *)v6 + 2))
    {
      v8 = v6[32];

      if (!v8)
        goto LABEL_10;
LABEL_9:
      objc_msgSend(v5, "objectOfClass:atIndex:", *(_QWORD *)(a1 + 48), 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {

      goto LABEL_9;
    }
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
      goto LABEL_9;
  }
LABEL_10:
  if (*(_QWORD *)(a1 + 40))
    v11 = *(const char **)(a1 + 40);
  else
    v11 = sel_initFromPQLResultSet_error_;
  MethodImplementation = class_getMethodImplementation(*(Class *)(a1 + 48), v11);
  v10 = ((uint64_t (*)(id, _QWORD, id, uint64_t))MethodImplementation)(objc_alloc(*(Class *)(a1 + 48)), *(_QWORD *)(a1 + 40), v5, a3);
LABEL_14:
  v13 = (void *)v10;

  return v13;
}

CFTypeRef __PQLCacheKeyRetain(const void *a1, _QWORD *a2)
{
  CFTypeRef result;

  result = CFRetain(a1);
  *a2 = result;
  return result;
}

uint64_t db_trace(char a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((a1 & 1) != 0)
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v7 = pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2080;
      v12 = a4;
      _os_log_impl(&dword_1D4668000, v7, OS_LOG_TYPE_DEBUG, "connection:%@ sql:'%s'", (uint8_t *)&v9, 0x16u);
    }
  }

  return 0;
}

void sub_1D466D854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _pql_log_init()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.prequelite", "default");
  v1 = (void *)pql_log;
  pql_log = (uint64_t)v0;

}

sqlite3_int64 pql_sqlite3_value_pointer(sqlite3_value *a1)
{
  if (sqlite3_value_type(a1) == 1)
    return sqlite3_value_int64(a1);
  else
    return 0;
}

id pql_sqlite3_value_object(sqlite3_value *a1)
{
  id v2;

  if (sqlite3_value_type(a1) == 1)
    v2 = (id)sqlite3_value_int64(a1);
  else
    v2 = 0;
  return v2;
}

void _bind_archived_object(sqlite3_stmt *a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = (void *)MEMORY[0x1D825FB2C]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v8, *MEMORY[0x1E0CB2CD0]);
  objc_msgSend(v6, "encodedData");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_blob(a1, a2, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  objc_autoreleasePoolPop(v5);
}

double timeInSeconds(unint64_t a1)
{
  if (timeInSeconds_once != -1)
    dispatch_once(&timeInSeconds_once, &__block_literal_global);
  return *(double *)&timeInSeconds_factor * (double)a1;
}

double __timeInSeconds_block_invoke()
{
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  if (info.denom)
  {
    LODWORD(result) = info.numer;
    result = (double)*(unint64_t *)&result / (double)info.denom / 1000000000.0;
    timeInSeconds_factor = *(_QWORD *)&result;
  }
  return result;
}

void sub_1D4670B68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __PQLCacheValueRelease(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *((id *)v3 + 14);
  v5 = a1;
  if ((objc_msgSend(v3, "isTraced") & 1) != 0 || objc_msgSend(v5, "isTraced"))
  {
    if (pql_pred != -1)
      dispatch_once_f(&pql_pred, 0, (dispatch_function_t)_pql_log_init);
    v6 = (void *)pql_log;
    if (os_log_type_enabled((os_log_t)pql_log, OS_LOG_TYPE_DEBUG))
    {
      v7 = v6;
      v11 = 138412546;
      v12 = (id)objc_opt_class();
      v13 = 2048;
      v14 = v5;
      v8 = v12;
      _os_log_impl(&dword_1D4668000, v7, OS_LOG_TYPE_DEBUG, "uncaching: <%@:%p>", (uint8_t *)&v11, 0x16u);

    }
  }
  v9 = v4;
  objc_sync_enter(v9);
  objc_msgSend(v9, "addObject:", v5);
  CFRelease(v5);

  objc_sync_exit(v9);
  v10 = *((_QWORD *)v3 + 13);
  if (v10)
  {
    if (!v9)
      __PQLCacheValueRelease_cold_1();
    dispatch_source_merge_data(v10, 1uLL);
  }

}

void sub_1D4670E44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D4671DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PQLBusyHandlerFunction(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1D825FB2C]();
  v5 = a1;
  objc_msgSend(v5, "lockedHandler");
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 5, CFSTR("busy handler called"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = ((uint64_t (**)(_QWORD, id, _QWORD, void *))v6)[2](v6, v5, 0, v7);
  }
  else
  {
    objc_msgSend(v5, "busyHandler");
    v9 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v9;
    if (!v9)
    {
      v10 = 0;
      goto LABEL_6;
    }
    v8 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v5, a2);
  }
  v10 = v8;
LABEL_6:

  objc_autoreleasePoolPop(v4);
  return v10;
}

void ___defaultAllowedClasses_block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v6 = (void *)_defaultAllowedClasses_allowedClasses;
  _defaultAllowedClasses_allowedClasses = v5;

}

void __PQLCacheValueRelease_cold_1()
{
  __assert_rtn("__PQLCacheValueRelease", "PQLConnection.m", 298, "queue");
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_db_clone()
{
  return MEMORY[0x1E0DE8518]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int cache_create(const char *name, const cache_attributes_t *attrs, cache_t **cache_out)
{
  return MEMORY[0x1E0C81770](name, attrs, cache_out);
}

int cache_destroy(cache_t *cache)
{
  return MEMORY[0x1E0C81778](cache);
}

int cache_get_and_retain(cache_t *cache, void *key, void **value_out)
{
  return MEMORY[0x1E0C81788](cache, key, value_out);
}

uint64_t cache_get_count_hint()
{
  return MEMORY[0x1E0C81798]();
}

uint64_t cache_get_name()
{
  return MEMORY[0x1E0C817B8]();
}

int cache_release_value(cache_t *cache, void *value)
{
  return MEMORY[0x1E0C817D8](cache, value);
}

int cache_remove_all(cache_t *cache)
{
  return MEMORY[0x1E0C817E8](cache);
}

int cache_set_and_retain(cache_t *cache, void *key, void *value, cache_cost_t cost)
{
  return MEMORY[0x1E0C817F8](cache, key, value, cost);
}

uint64_t cache_set_count_hint()
{
  return MEMORY[0x1E0C81808]();
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1E0DE8630](a1, a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

sqlite3_value *__cdecl sqlite3_column_value(sqlite3_stmt *a1, int iCol)
{
  return (sqlite3_value *)MEMORY[0x1E0DE86D0](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1E0DE87E0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1E0DE87F8]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1E0DE8860](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_sleep(int a1)
{
  return MEMORY[0x1E0DE8958](*(_QWORD *)&a1);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_status(int op, int *pCurrent, int *pHighwater, int resetFlag)
{
  return MEMORY[0x1E0DE89A0](*(_QWORD *)&op, pCurrent, pHighwater, *(_QWORD *)&resetFlag);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89B0](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x1E0DE89C0](a1, *(_QWORD *)&op, *(_QWORD *)&resetFlg);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE89E8](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1E0DE89F0](a1, *(_QWORD *)&uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1E0DE8A10](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A20](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x1E0DE8A30](a1);
  return result;
}

sqlite3_value *__cdecl sqlite3_value_dup(const sqlite3_value *a1)
{
  return (sqlite3_value *)MEMORY[0x1E0DE8A38](a1);
}

void sqlite3_value_free(sqlite3_value *a1)
{
  MEMORY[0x1E0DE8A40](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A70](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

