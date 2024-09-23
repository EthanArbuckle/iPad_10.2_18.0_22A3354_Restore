const __CFString *SUControllerStringForManagerState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x11)
    return CFSTR("Unknown");
  else
    return off_2518D06A0[a1 - 1];
}

void SUControllerIPCEncodeObject(uint64_t a1, void *a2, const char *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  const __CFString *v14;
  void *v15;
  xpc_object_t xdict;

  xdict = a2;
  v7 = a4;
  if (xdict && a3 && v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v8, "encodeObject:forKey:", v7, *MEMORY[0x24BDD0E88]);
    objc_msgSend(v8, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_retainAutorelease(v9);
      xpc_dictionary_set_data(xdict, a3, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    }
    else
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logAtLevel:label:format:", 0, "SUControllerIPCEncodeObject", CFSTR("{SUControllerIPCEncodeObject} failed to encode using archiver"));

    }
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    v13 = "MISSING";
    if (a3)
      v13 = a3;
    v14 = CFSTR("PROVIDED");
    if (!v7)
      v14 = CFSTR("MISSING");
    objc_msgSend(v12, "logAtLevel:label:format:", 0, "SUControllerIPCEncodeObject", CFSTR("{SUControllerIPCEncodeObject} missing required parameter(s): message:PROVIDED(%s), key:%s, object:%@"), a1, v13, v14);
  }

}

id _SUControllerIPCDecodeObjectForKey(uint64_t a1, xpc_object_t xdict, char *key, uint64_t a4, int a5)
{
  const void *data;
  const void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  size_t length;

  if (!xdict || !key)
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = "MISSING";
    if (key)
      v17 = key;
    objc_msgSend(v15, "logAtLevel:label:format:", 0, "_SUControllerIPCDecodeObjectForKey", CFSTR("{_SUControllerIPCDecodeObjectForKey} missing required parameter(s): message:PROVIDED(%s), key:%s"), a1, v17);

    return 0;
  }
  length = 0;
  data = xpc_dictionary_get_data(xdict, key, &length);
  if (!data)
  {
    if (a5)
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logAtLevel:label:format:", 0, "_SUControllerIPCDecodeObjectForKey", CFSTR("{SUControllerIPCDecodeObjectForKey} unable to get data for key:%s"), key);
      v14 = 0;
      goto LABEL_11;
    }
    return 0;
  }
  v10 = data;
  v11 = objc_alloc(MEMORY[0x24BDD1620]);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v10, length);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initForReadingFromData:error:", v12, 0);

  objc_msgSend(v13, "decodeObjectOfClass:forKey:", a4, *MEMORY[0x24BDD0E88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finishDecoding");
LABEL_11:

  return v14;
}

id SUControllerIPCDecodeObjectForKey(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return _SUControllerIPCDecodeObjectForKey(a1, a2, a3, a4, 1);
}

id SUControllerIPCDecodeOptionalObjectForKey(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  return _SUControllerIPCDecodeObjectForKey(a1, a2, a3, a4, 0);
}

BOOL SUControllerIPCDecodeBooleanForKey(uint64_t a1, xpc_object_t xdict, char *key)
{
  void *v6;
  void *v7;
  const char *v8;

  if (xdict && key)
    return xpc_dictionary_get_BOOL(xdict, key);
  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = "MISSING";
  if (key)
    v8 = key;
  objc_msgSend(v6, "logAtLevel:label:format:", 0, "SUControllerIPCDecodeBooleanForKey", CFSTR("{SUControllerIPCDecodeBooleanForKey} missing required parameter(s): message:PROVIDED(%s), key:%s"), a1, v8);

  return 0;
}

id SUControllerIPCDecodeStringForKey(uint64_t a1, xpc_object_t xdict, char *key)
{
  void *string;
  void *v6;
  void *v7;
  const char *v8;

  if (xdict && key)
  {
    string = (void *)xpc_dictionary_get_string(xdict, key);
    if (string)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
      string = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = "MISSING";
    if (key)
      v8 = key;
    objc_msgSend(v6, "logAtLevel:label:format:", 0, "SUControllerIPCDecodeStringForKey", CFSTR("{SUControllerIPCDecodeStringForKey} missing required parameter(s): message:PROVIDED(%s), key:%s"), a1, v8);

    string = 0;
  }
  return string;
}

BOOL SUControllerIPCClientIsEntitled()
{
  const __CFAllocator *v0;
  __SecTask *v1;
  __SecTask *v2;
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  _BOOL8 v6;
  CFErrorRef v7;
  void *v8;
  void *v9;
  uint64_t v11;
  audit_token_t token;
  __int128 v13;
  __int128 v14;
  CFErrorRef error;

  error = 0;
  v13 = 0u;
  v14 = 0u;
  xpc_connection_get_audit_token();
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  memset(&token, 0, sizeof(token));
  v1 = SecTaskCreateWithAuditToken(v0, &token);
  if (v1)
  {
    v2 = v1;
    v3 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.private.allow-SUController"), &error);
    if (v3)
    {
      v4 = v3;
      v5 = CFGetTypeID(v3);
      if (v5 == CFBooleanGetTypeID())
      {
        v6 = CFBooleanGetValue(v4) != 0;
      }
      else
      {
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logAtLevel:label:format:", 0, "SUControllerIPCClientIsEntitled", CFSTR("entitlement has wrong type"));

        v6 = 0;
      }
      CFRelease(v2);
      v2 = v4;
    }
    else
    {
      v7 = error;
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v8, "logAtLevel:label:format:", 0, "SUControllerIPCClientIsEntitled", CFSTR("unable to look up client entitlement: %ld"), CFErrorGetCode(error));
      else
        objc_msgSend(v8, "logAtLevel:label:format:", 0, "SUControllerIPCClientIsEntitled", CFSTR("client is not entitled"), v11);

      v6 = 0;
    }
    CFRelease(v2);
  }
  else
  {
    v6 = 0;
  }
  if (error)
    CFRelease(error);
  return v6;
}

id SUControllerIPCDictionaryToXPC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = xpc_dictionary_create(0, 0, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __SUControllerIPCDictionaryToXPC_block_invoke;
  v9[3] = &unk_2518D0738;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

id SUControllerIPCXPCToDictionary(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD applier[4];
  id v7;

  v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x249580634](v1) == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __SUControllerIPCXPCToDictionary_block_invoke;
    applier[3] = &unk_2518D0760;
    v3 = v4;
    v7 = v3;
    xpc_dictionary_apply(v2, applier);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SUControllerArchive(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v2, "encodeObject:forKey:", v1, *MEMORY[0x24BDD0E88]);
    objc_msgSend(v2, "encodedData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id SUControllerUnarchive(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_3;
  v8 = (void *)v7;
  objc_msgSend(v5, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    v13 = objc_alloc(MEMORY[0x24BDD1620]);
    objc_msgSend(v5, "objectForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initForReadingFromData:error:", v14, 0);

    objc_msgSend(v15, "decodeObjectOfClass:forKey:", a3, *MEMORY[0x24BDD0E88]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishDecoding");

  }
  else
  {
LABEL_3:
    v12 = 0;
  }

  return v12;
}

id SUControllerError(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SUControllerErrorUserInfoV(a1, a2, 0, a3, a4, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id SUControllerErrorUserInfoV(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v11 = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    v15 = objc_msgSend(v12, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  if (v14)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v14, a6);
    if (v17)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD0FC8]);

  }
  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, a2, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id SUControllerErrorUserInfo(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SUControllerErrorUserInfoV(a1, a2, a3, a4, a5, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t doStringsMatch(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend((id)v3, "isEqualToString:", v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t updateRequiresDocAsset()
{
  void *v0;
  void *v1;
  int v2;

  objc_msgSend(MEMORY[0x24BEAEA40], "sharedDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "deviceClass");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("AppleTV"));

  return v2 ^ 1u;
}

void sub_24769F594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_24769F770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x24BDBBA68](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
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

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

