void _registerObservers(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  if (a2[2])
  {
    v2 = a2;
    objc_msgSend(v2, "setShouldRegisterForZoomListeners:", 1);
    objc_msgSend(v2, "setRegisteredForZoomListener:", 0);
    objc_msgSend(v2, "setRegisteredForZoomAttributeListeners:", 0);
    objc_msgSend(v2, "_zoomChanged:", 0);

  }
}

void sub_215D23870(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

double ZOTMainScreenSize()
{
  if (ZOTMainScreenSize_onceToken != -1)
    dispatch_once(&ZOTMainScreenSize_onceToken, &__block_literal_global_531);
  return *(double *)&ZOTMainScreenSize_ScreenSize_0;
}

double ZOTMainScreenRect()
{
  ZOTMainScreenSize();
  return 0.0;
}

id ZOTWindowServerDisplay()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
  if (!ZOTWindowServerDisplay_kZOTWindowServerDisplay)
  {
    objc_msgSend(MEMORY[0x24BDE57F8], "server");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "displays");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
    ZOTWindowServerDisplay_kZOTWindowServerDisplay = v3;

    v0 = (void *)ZOTWindowServerDisplay_kZOTWindowServerDisplay;
  }
  return v0;
}

uint64_t ZOTDeviceRotation()
{
  uint64_t result;
  float v1;
  double v2;

  result = ZOTDeviceRotation_Rotation;
  if (ZOTDeviceRotation_Rotation == -1)
  {
    result = MGCopyAnswer();
    if (result)
    {
      CFRelease((CFTypeRef)result);
      GSMainScreenOrientation();
      v2 = fabsf(v1);
      if (v2 < 0.001)
      {
        result = 0;
        ZOTDeviceRotation_Rotation = 0;
        return result;
      }
      if (fabs(v2 + -4.71238898) < 0.001)
      {
        result = 2;
LABEL_10:
        ZOTDeviceRotation_Rotation = result;
        return result;
      }
      if (fabs(v2 + -1.57079633) < 0.001)
      {
        result = 1;
        goto LABEL_10;
      }
      return ZOTDeviceRotation_Rotation;
    }
  }
  return result;
}

uint64_t ZOTDisplayMainScreenSize()
{
  return ZOTDeviceRotation();
}

uint64_t ZOTRotateToScreen(char a1)
{
  if ((a1 & 1) == 0)
  {
    ZOTMainScreenSize();
    ZOTDeviceRotation();
  }
  return ZOTDeviceRotation();
}

uint64_t ZOTRotateFromScreen(char a1)
{
  if ((a1 & 1) == 0)
  {
    ZOTMainScreenSize();
    ZOTDeviceRotation();
  }
  return ZOTDeviceRotation();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x24BE002B0]();
}

uint64_t AXProcessGetName()
{
  return MEMORY[0x24BE002D0]();
}

uint64_t AXProcessIsAXSettingsShortcutsPlugin()
{
  return MEMORY[0x24BE002D8]();
}

uint64_t AXProcessIsAXUIServer()
{
  return MEMORY[0x24BE002E0]();
}

uint64_t AXProcessIsAccessibilityAppIntents()
{
  return MEMORY[0x24BE002E8]();
}

uint64_t AXProcessIsBackboard()
{
  return MEMORY[0x24BE002F0]();
}

uint64_t AXProcessIsPreferences()
{
  return MEMORY[0x24BE00310]();
}

uint64_t AXProcessIsSetup()
{
  return MEMORY[0x24BE00320]();
}

uint64_t AXProcessIsSiri()
{
  return MEMORY[0x24BE00328]();
}

uint64_t AXProcessIsSpringBoard()
{
  return MEMORY[0x24BE00330]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x24BE00360]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t GSMainScreenOrientation()
{
  return MEMORY[0x24BE3D5F8]();
}

uint64_t GSMainScreenSize()
{
  return MEMORY[0x24BE3D618]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x24BDD11D8](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x24BDD1248]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t ZOOMLogCommon()
{
  return MEMORY[0x24BE007E8]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x24BE007F0]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x24BE00810]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

