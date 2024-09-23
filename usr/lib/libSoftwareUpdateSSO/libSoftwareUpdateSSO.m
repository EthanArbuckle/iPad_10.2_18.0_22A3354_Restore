id SoftwareUpdateSSOlogInfo()
{
  if (SoftwareUpdateSSOlogInfo_logInfoOnce != -1)
    dispatch_once(&SoftwareUpdateSSOlogInfo_logInfoOnce, &__block_literal_global_1);
  return (id)SoftwareUpdateSSOlogInfo_infoLog;
}

id SoftwareUpdateSSOlogError()
{
  if (SoftwareUpdateSSOlogError_logErrorOnce != -1)
    dispatch_once(&SoftwareUpdateSSOlogError_logErrorOnce, &__block_literal_global_3);
  return (id)SoftwareUpdateSSOlogError_infoError;
}

id SoftwareUpdateSSOlogDebug()
{
  if (SoftwareUpdateSSOlogDebug_logDebugOnce != -1)
    dispatch_once(&SoftwareUpdateSSOlogDebug_logDebugOnce, &__block_literal_global_5);
  return (id)SoftwareUpdateSSOlogDebug_infoDebug;
}

id SoftwareUpdateSSOlogFault()
{
  if (SoftwareUpdateSSOlogFault_logFaultOnce != -1)
    dispatch_once(&SoftwareUpdateSSOlogFault_logFaultOnce, &__block_literal_global_7);
  return (id)SoftwareUpdateSSOlogFault_infoFault;
}

id copyPersonID(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;
  SoftwareUpdateSSO *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if ((MSUSSOIsAvailable(CFSTR("1205")) & 1) != 0)
  {
    if (v3)
    {
      v4 = objc_msgSend(v3, "valueForKey:", CFSTR("stealthMode"));
      if (v4 == *MEMORY[0x24BDBD270])
        v5 = CFSTR("1");
      else
        v5 = CFSTR("0");
      NSLog(CFSTR("%s: Attempting to retrieve personID with interactivity level %d"), "copyPersonID", v4 == *MEMORY[0x24BDBD270]);
    }
    else
    {
      NSLog(CFSTR("%s: Attempting to retrieve personID with interactivity level %d"), "copyPersonID", 0);
      v5 = CFSTR("0");
    }
    v14[0] = CFSTR("applicationIdentifier");
    v14[1] = CFSTR("environmentIdentifier");
    v15[0] = CFSTR("1205");
    v15[1] = CFSTR("APPLECONNECT.APPLE.COM");
    v14[2] = CFSTR("interactivity");
    v15[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SoftwareUpdateSSO initWithOptions:]([SoftwareUpdateSSO alloc], "initWithOptions:", v7);
    if (!-[SoftwareUpdateSSO ssoIsSupported](v8, "ssoIsSupported"))
    {
      NSLog(CFSTR("SoftwareUpdateSSO not supported in this environment"));
      v12 = 0;
LABEL_24:
      v6 = v12;

      goto LABEL_25;
    }
    NSLog(CFSTR("SoftwareUpdateSSO supported. Attempting to read userInfo"));
    v9 = -[SoftwareUpdateSSO copyUserInfo](v8, "copyUserInfo");
    v10 = v9;
    if (!v9)
    {
      NSLog(CFSTR("SoftwareUpdateSSO was unable to read the userInfo"));
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SoftwareUpdateSSOError"), 1, 0);
        v12 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_23;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("personId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = (void *)objc_msgSend(v11, "copy");
      if (v12)
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      NSLog(CFSTR("SoftwareUpdateSSO was able to read the userinfo(%@) but got unexpected data type for personID"), v10);
    }
    NSLog(CFSTR("SoftwareUpdateSSO was able to read userInfo but unable to determine personID"));
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SoftwareUpdateSSOError"), 2, 0);
      v12 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    goto LABEL_22;
  }
  NSLog(CFSTR("%s: Not supported in this environment\n"), "copyPersonID");
  v6 = 0;
LABEL_25:

  return v6;
}

uint64_t MSUSSOIsAvailable(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  SoftwareUpdateSSO *v4;
  SoftwareUpdateSSO *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9 = CFSTR("applicationIdentifier");
  v10 = CFSTR("environmentIdentifier");
  v12 = a1;
  v13 = CFSTR("APPLECONNECT.APPLE.COM");
  v11 = CFSTR("interactivity");
  v14 = CFSTR("0");
  v1 = (void *)MEMORY[0x24BDBCE70];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", &v12, &v9, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SoftwareUpdateSSO alloc];

  v5 = -[SoftwareUpdateSSO initWithOptions:](v4, "initWithOptions:", v3);
  v6 = -[SoftwareUpdateSSO ssoIsSupported](v5, "ssoIsSupported");
  v7 = CFSTR("NO");
  if ((_DWORD)v6)
    v7 = CFSTR("YES");
  NSLog(CFSTR("MSUSSOIsAvailable: %@"), v7, v9, v10, v11, v12, v13, v14, v15);

  return v6;
}

id copyPersonalizationSSOToken(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if ((MSUSSOIsAvailable(CFSTR("1205")) & 1) != 0)
  {
    if (v3)
    {
      v4 = objc_msgSend(v3, "valueForKey:", CFSTR("stealthMode"));
      v5 = v4 == *MEMORY[0x24BDBD270];
    }
    else
    {
      v5 = 0;
    }
    NSLog(CFSTR("Calling copyDawTokenAndUsername with interactivity level %d"), v5);
    v17 = 0;
    copyDawTokenAndUsername(CFSTR("1205"), v5, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    v9 = v8;
    if (v7 && v8)
    {
      v10 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v9, CFSTR("1205"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setLength:", objc_msgSend(v12, "length") + 1);
      v13 = objc_retainAutorelease(v10);
      objc_msgSend(v12, "getCString:maxLength:encoding:", objc_msgSend(v13, "mutableBytes"), objc_msgSend(v13, "length"), 4);
      objc_msgSend(v11, "setLength:", objc_msgSend(v7, "length") + 1);
      v14 = objc_retainAutorelease(v11);
      objc_msgSend(v7, "getCString:maxLength:encoding:", objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "length"), 4);
      v15 = objc_retainAutorelease(v14);
      objc_msgSend(v13, "appendBytes:length:", objc_msgSend(v15, "mutableBytes"), objc_msgSend(v15, "length") - 1);
      v18 = CFSTR("ssodata");
      v19[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("copyDawTokenAndUsername failed to return with a token (%@) or a username (%@)"), v7, v8);
      if (a2)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SoftwareUpdateSSOError"), 1, 0);
        v6 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
    }

  }
  else
  {
    NSLog(CFSTR("%s: Not supported in this environment"), "copyPersonalizationSSOToken");
    v6 = 0;
  }

  return v6;
}

id copyDawTokenAndUsername(void *a1, int a2, _QWORD *a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  SoftwareUpdateSSO *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = v5;
  v7 = CFSTR("177666");
  if (v5)
    v7 = v5;
  v8 = v7;
  if ((MSUSSOIsAvailable(v8) & 1) == 0)
  {
    NSLog(CFSTR("%s: Not supported in this environment"), "copyDawTokenAndUsername");
    goto LABEL_15;
  }
  NSLog(CFSTR("Attempting to get token"));
  if (!v6)
  {
LABEL_15:
    v16 = 0;
    goto LABEL_18;
  }
  v9 = CFSTR("0");
  if (a2 == 1)
    v9 = CFSTR("1");
  if (a2 == 2)
    v10 = CFSTR("2");
  else
    v10 = v9;
  NSLog(CFSTR("Setting interactivity level to %@"), v10);
  v18[0] = CFSTR("applicationIdentifier");
  v18[1] = CFSTR("environmentIdentifier");
  v19[0] = v6;
  v19[1] = CFSTR("APPLECONNECT.APPLE.COM");
  v18[2] = CFSTR("interactivity");
  v19[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SoftwareUpdateSSO initWithOptions:]([SoftwareUpdateSSO alloc], "initWithOptions:", v11);
  if (-[SoftwareUpdateSSO ssoIsSupported](v12, "ssoIsSupported"))
  {
    NSLog(CFSTR("SoftwareUpdateSSO supported. Attempting to read token"));
    -[SoftwareUpdateSSO getDawToken](v12, "getDawToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SoftwareUpdateSSO userName](v12, "userName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a3 && v14)
    {
      v15 = objc_retainAutorelease(v14);
      *a3 = v15;
    }
  }
  else
  {
    NSLog(CFSTR("SoftwareUpdateSSO not supported in this environment"));
    v15 = 0;
    v13 = 0;
  }
  v16 = v13;

LABEL_18:
  return v16;
}

id copyDawToken(void *a1, int a2)
{
  return copyDawTokenAndUsername(a1, a2, 0);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

