void *AHTRestoreCreateDeviceList()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  +[AHTLoader allDevices](AHTLoader, "allDevices");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v0;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v5);
        v17[0] = CFSTR("DeviceName");
        objc_msgSend(v6, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v7;
        v17[1] = CFSTR("ImageTag");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "imageTag"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v8;
        v18[2] = MEMORY[0x24BDBD1C8];
        v17[2] = CFSTR("NeedsUpdate");
        v17[3] = CFSTR("LoadingGroup");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "loadingGroup"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18[3] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "addObject:", v10);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v3);
  }

  return v1;
}

uint64_t AHTRestoreUpdateDevice(uint64_t a1, uint64_t a2, char a3)
{
  void *v5;
  uint64_t updated;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
  {
    v8 = CFSTR("LockChip");
    v9[0] = *MEMORY[0x24BDBD270];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  updated = AHTRestoreUpdateDeviceWithOverrides(a1, a2, v5);

  return updated;
}

uint64_t AHTRestoreUpdateDeviceWithOverrides(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  unsigned int v24;
  id v26;

  if (!a2)
    return 3758097090;
  v5 = (void *)MEMORY[0x24BDBD1B8];
  if (a3)
    v5 = a3;
  v6 = v5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SkipUpdate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", MEMORY[0x24BDBD1C8]);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IgnoreFailures"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x24BDBD1C8]);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[AHTLoader withName:](AHTLoader, "withName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LockChip"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDBD1C8];
      v16 = objc_msgSend(v14, "isEqual:", MEMORY[0x24BDBD1C8]);

      if (v16)
        v17 = 9;
      else
        v17 = 1;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AHT_PRE_FDR_CHECKPOINT"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v15);

      if (v19)
        v20 = v17 | 0x80;
      else
        v20 = v17;
      v26 = 0;
      v21 = objc_msgSend(v13, "loadImage:payloadOnly:options:error:", a2, 0, v20, &v26);
      v22 = v26;
      v23 = v22;
      if (v22)
      {
        v24 = objc_msgSend(v22, "code");
      }
      else if (v21)
      {
        v24 = 0;
      }
      else
      {
        v24 = -536870212;
      }
      if (v11)
        v9 = 0;
      else
        v9 = v24;

    }
    else if (v11)
    {
      v9 = 0;
    }
    else
    {
      v9 = 3758097088;
    }

  }
  return v9;
}

uint64_t AHTRestoreFailureCleanup(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AHTLoader withName:](AHTLoader, "withName:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v8 = 0;
    v3 = objc_msgSend(v2, "overrideNextLoadOptions:error:", 65, &v8);
    v4 = v8;
    v5 = v4;
    if ((v3 & 1) != 0)
      v6 = 0;
    else
      v6 = objc_msgSend(v4, "code");

  }
  else
  {
    v6 = 3758097088;
  }

  return v6;
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

