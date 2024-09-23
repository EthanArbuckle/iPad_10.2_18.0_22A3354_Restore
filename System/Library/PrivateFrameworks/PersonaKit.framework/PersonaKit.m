void _PRHandleSelfCacheDidChange(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "hasVendedData");
    _PRGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v6)
      {
        v7 = 136315394;
        v8 = "_PRHandleSelfCacheDidChange";
        v9 = 1024;
        v10 = 930;
        _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Rebroadcasting PRSelfLikenessesDidChangeNotification\"", (uint8_t *)&v7, 0x12u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", CFSTR("PRSelfLikenessesDidChangeNotification"), v3);
    }
    else if (v6)
    {
      v7 = 136315650;
      v8 = "_PRHandleSelfCacheDidChange";
      v9 = 1024;
      v10 = 926;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Store %@ has never vended data. Not broadcasting local change notifications.\"", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void _PRHandleOtherCacheDidChange(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "hasVendedData");
    _PRGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 1) != 0)
    {
      if (v6)
      {
        v7 = 136315394;
        v8 = "_PRHandleOtherCacheDidChange";
        v9 = 1024;
        v10 = 947;
        _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Rebroadcasting PROtherLikenessesDidChangeNotification\"", (uint8_t *)&v7, 0x12u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", CFSTR("PROtherLikenessesDidChangeNotification"), v3);
    }
    else if (v6)
    {
      v7 = 136315650;
      v8 = "_PRHandleOtherCacheDidChange";
      v9 = 1024;
      v10 = 943;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_209583000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Store %@ has never vended data. Not broadcasting local change notifications.\"", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

id _PRGetLogSystem()
{
  if (_PRGetLogSystem_onceToken != -1)
    dispatch_once(&_PRGetLogSystem_onceToken, &__block_literal_global_1);
  return (id)_PRGetLogSystem_log;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE618](source, decode, shouldInterpolate, *(_QWORD *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

