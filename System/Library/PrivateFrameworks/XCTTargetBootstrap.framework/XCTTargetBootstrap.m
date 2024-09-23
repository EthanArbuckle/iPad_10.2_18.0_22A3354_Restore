void XCTPerformBootstrap(const char *a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint8_t v23[16];
  uint64_t state64;
  int out_token;

  v3 = a2;
  v4 = XCTRegisterForBootstrap(a1, v3, 0);
  out_token = -1;
  if (!notify_register_check(a1, &out_token))
  {
    state64 = 0;
    if (notify_get_state(out_token, &state64))
    {
      XCTTBDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        XCTPerformBootstrap_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      notify_cancel(out_token);
      v21 = state64;
      XCTTBDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v21 == 1)
      {
        if (v22)
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_2084C6000, v13, OS_LOG_TYPE_DEFAULT, "Test daemon availability confirmed via notify_get_state.", v23, 2u);
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
        v5 = objc_claimAutoreleasedReturnValue();
        XCTConnectToDaemon(v3, v5);
        notify_cancel(v4);
        goto LABEL_4;
      }
      if (v22)
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_2084C6000, v13, OS_LOG_TYPE_DEFAULT, "notify_get_state check indicated test daemon not ready.", v23, 2u);
      }
    }

    goto LABEL_9;
  }
  XCTTBDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    XCTPerformBootstrap_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
LABEL_4:

LABEL_9:
}

id XCTTBDefaultLog()
{
  if (XCTTBDefaultLog_onceToken != -1)
    dispatch_once(&XCTTBDefaultLog_onceToken, &__block_literal_global);
  return (id)XCTTBDefaultLog_defaultLog;
}

uint64_t XCTRegisterForBootstrap(const char *a1, void *a2, int a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint32_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD handler[4];
  id v23;
  id v24;
  int out_token;

  v5 = a2;
  out_token = 0;
  v6 = (id)targetSessionsByServiceName;
  objc_sync_enter(v6);
  if (a3)
    objc_msgSend((id)targetSessionsByServiceName, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __XCTRegisterForBootstrap_block_invoke;
  handler[3] = &unk_24C0A9F98;
  v23 = v5;
  v24 = v7;
  v9 = v7;
  v10 = v5;
  v11 = notify_register_dispatch(a1, &out_token, v8, handler);

  if (v11)
  {
    XCTTBDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      XCTRegisterForBootstrap_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);

  }
  v20 = out_token;

  return v20;
}

void sub_2084C780C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void XCTTargetBootstrap()
{
  if (XCTTargetBootstrap_onceToken != -1)
    dispatch_once(&XCTTargetBootstrap_onceToken, &__block_literal_global_0);
}

void sub_2084C7CFC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2084C8664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void XCTConnectToDaemon(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  XCTTargetSession *v7;
  XCTTargetSession *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v3 = a1;
  v4 = a2;
  if (XCTConnectToDaemon_onceToken != -1)
    dispatch_once(&XCTConnectToDaemon_onceToken, &__block_literal_global_13);
  v5 = (id)targetSessionsByServiceName;
  objc_sync_enter(v5);
  objc_msgSend((id)targetSessionsByServiceName, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = [XCTTargetSession alloc];
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __XCTConnectToDaemon_block_invoke_2;
    v13 = &unk_24C0A9FE0;
    v14 = v4;
    v9 = v3;
    v15 = v9;
    v7 = -[XCTTargetSession initWithServiceName:registrationHandler:](v8, "initWithServiceName:registrationHandler:", v9, &v10);
    objc_msgSend((id)targetSessionsByServiceName, "setObject:forKeyedSubscript:", v7, v9, v10, v11, v12, v13);

  }
  objc_sync_exit(v5);

  if (v7)
    -[XCTTargetSession connect](v7, "connect");

}

void sub_2084C8A7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id XCTSharedDaemonConnectionProvider()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_opt_class();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v0);
  v1 = (void *)_sharedDaemonConnectionProvider;
  if (!_sharedDaemonConnectionProvider)
  {
    v2 = objc_opt_new();
    v3 = (void *)_sharedDaemonConnectionProvider;
    _sharedDaemonConnectionProvider = v2;

    v1 = (void *)_sharedDaemonConnectionProvider;
  }
  v4 = v1;
  objc_sync_exit(v0);

  return v4;
}

void sub_2084C8DF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void XCTSetSharedDaemonConnectionProvider(void *a1)
{
  id v1;
  void *v2;
  id obj;

  v1 = a1;
  objc_opt_class();
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v2 = (void *)_sharedDaemonConnectionProvider;
  _sharedDaemonConnectionProvider = (uint64_t)v1;

  objc_sync_exit(obj);
}

void XCTPerformBootstrap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2084C6000, a1, a3, "Unable to query test daemon availability.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void XCTPerformBootstrap_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2084C6000, a1, a3, "Unable to register token for checking test daemon availability.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void XCTRegisterForBootstrap_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2084C6000, a1, a3, "Unable to register for test daemon availability notification.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

