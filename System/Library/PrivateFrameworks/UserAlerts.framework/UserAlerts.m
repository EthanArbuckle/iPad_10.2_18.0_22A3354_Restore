void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id URTLog()
{
  if (URTLog_onceToken != -1)
    dispatch_once(&URTLog_onceToken, &__block_literal_global);
  return (id)URTLog_logger;
}

void sub_21A1D4B28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A1D4C04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21A1D4C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t _URTUserNotificationRunLoopCallback(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    _URTUserNotificationRunLoopCallback_cold_1(a2, v4);

  return +[URTUserNotificationPresentation invokeHandlerForUserNotification:responseFlags:](URTUserNotificationPresentation, "invokeHandlerForUserNotification:responseFlags:", a1, a2);
}

void sub_21A1D5300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *URTDescriptionForAlertPresentationStyle(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (a1 == 1)
    v1 = CFSTR("modal");
  if (a1 == 2)
    return CFSTR("full sheet");
  else
    return v1;
}

void sub_21A1D5E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A1D64B4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

const __CFString *URTDescriptionForAlertDestination(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (a1 == 1)
    v1 = CFSTR("CarPlay");
  if (a1 == 2)
    return CFSTR("Previews");
  else
    return v1;
}

const __CFString *URTMachPortNameForAlertDestination(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("com.apple.CarPlayApp.user-alerts-service");
  if (a1 != 1)
    v1 = 0;
  if (a1 == 2)
    return CFSTR("com.apple.preview-shell.user-alerts-service");
  else
    return v1;
}

void sub_21A1D7454(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id URTVerifyString(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    URTLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      URTVerifyString_cold_1((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);

    v2 = 0;
  }

  return v2;
}

id URTVerifyClass(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    URTLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      URTVerifyClass_cold_1((uint64_t)v3, a2, v5);

    v4 = 0;
  }

  return v4;
}

URTAlertPresenter *URTAlertCreate(uint64_t a1, _DWORD *a2, void *a3)
{
  id v5;
  URTAlertPresenter *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  URTAlert *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  URTAlertAction *v15;
  URTAlertAction *v16;
  void *v17;
  void *v18;
  URTAlertAction *v19;
  URTAlertAction *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  URTAlertPresenter *v35;
  _DWORD *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id location;

  v5 = a3;
  v6 = objc_alloc_init(URTAlertPresenter);
  -[URTAlertPresenter _addDefaultDestinationAlertFromUserNotificationContents:flags:](v6, "_addDefaultDestinationAlertFromUserNotificationContents:flags:", v5, a1);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URTAlertCarPlayHeaderKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  URTVerifyString(v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URTAlertCarPlayMessageKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  URTVerifyString(v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v8 | v10)
  {
    objc_initWeak(&location, v6);
    v11 = -[URTAlert initWithTitle:message:]([URTAlert alloc], "initWithTitle:message:", v8, v10);
    v37 = a2;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URTAlertCarPlayDefaultButtonTitleKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    URTVerifyString(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x24BDAC760];
    if (v13)
    {
      v15 = [URTAlertAction alloc];
      v40[0] = v14;
      v40[1] = 3221225472;
      v40[2] = __URTAlertCreate_block_invoke;
      v40[3] = &unk_24DC7B1D8;
      objc_copyWeak(&v41, &location);
      v16 = -[URTAlertAction initWithTitle:handler:](v15, "initWithTitle:handler:", v13, v40);
      -[URTAlert setDefaultAction:](v11, "setDefaultAction:", v16);

      objc_destroyWeak(&v41);
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URTAlertCarPlayCancelButtonTitleKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    URTVerifyString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = [URTAlertAction alloc];
      v38[0] = v14;
      v38[1] = 3221225472;
      v38[2] = __URTAlertCreate_block_invoke_2;
      v38[3] = &unk_24DC7B1D8;
      objc_copyWeak(&v39, &location);
      v20 = -[URTAlertAction initWithTitle:handler:](v19, "initWithTitle:handler:", v18, v38);
      -[URTAlert setCancelAction:](v11, "setCancelAction:", v20);

      objc_destroyWeak(&v39);
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SBUserNotificationAllowedApplications"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    URTVerifyClass(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[URTAlert setAllowedApplicationBundleIDs:](v11, "setAllowedApplicationBundleIDs:", v23);
    -[URTAlertPresenter addAlert:forDestination:](v6, "addAlert:forDestination:", v11, 1);

    objc_destroyWeak(&location);
    a2 = v37;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("URTAlertShowInPreviewsKey"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (!v24)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    URTLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      URTAlertCreate_cold_1((uint64_t)v24, v26, v27, v28, v29, v30, v31, v32);

LABEL_14:
    goto LABEL_15;
  }
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
    -[URTAlertPresenter _addFromUserNotificationContents:toServiceDestination:](v6, "_addFromUserNotificationContents:toServiceDestination:", v5, 2);
LABEL_15:
  -[URTAlertPresenter present](v6, "present");
  -[URTAlertPresenter userNotificationPresentation](v6, "userNotificationPresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "error");

  if (v34)
  {
    v35 = 0;
    if (a2)
      *a2 = v34;
  }
  else
  {
    v35 = v6;
  }

  return v35;
}

void sub_21A1D8540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t URTAlertReceiveResponse()
{
  return 0;
}

uint64_t URTAlertCreateRunLoopSource(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a1;
  objc_msgSend(v5, "setCompatibilityCallback:", a2);
  objc_msgSend(v5, "userNotificationPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __URTAlertCreateRunLoopSource_block_invoke;
  v10[3] = &unk_24DC7B260;
  v11 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "createRunLoopSourceOrdered:handler:", a3, v10);

  return v8;
}

void sub_21A1D896C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A1D8B18(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _URTUserNotificationRunLoopCallback_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_21A1D3000, a2, OS_LOG_TYPE_DEBUG, "CFUserNotification callback response flags: %lu", (uint8_t *)&v2, 0xCu);
}

void URTVerifyString_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A1D3000, a2, a3, "object %@ is not a string", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void URTVerifyClass_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21A1D3000, log, OS_LOG_TYPE_ERROR, "object %@ is not of class %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void URTAlertCreate_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21A1D3000, a2, a3, "object %@ is not a BOOL number", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE0BB38]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

