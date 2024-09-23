uint64_t start()
{
  NSObject *v0;
  uint64_t v1;
  const void *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  __CFDictionary *CFProperty;
  __CFDictionary *v6;
  CFTypeID TypeID;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  integer_t policy_info[2];

  if (!setiopolicy_np(9, 0, 1))
  {
    v0 = ((uint64_t (*)(void))_IOHIDLogCategory)();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      sub_100003D6C(v0);
  }
  v1 = IOHIDEventSystemCreate(kCFAllocatorDefault);
  if (!v1)
  {
    v9 = ((uint64_t (*)(void))_IOHIDLogCategory)();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100003CDC(v9, v10, v11, v12, v13, v14, v15, v16);
LABEL_21:
    exit(1);
  }
  v2 = (const void *)v1;
  if (!IOHIDEventSystemOpen(v1, 0, 0, 0, 0))
  {
    v17 = ((uint64_t (*)(void))_IOHIDLogCategory)();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100003D0C(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_20;
  }
  v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IOService:/IOResources/IOHIDSystem");
  if (v3)
  {
    v4 = v3;
    CFProperty = (__CFDictionary *)IORegistryEntryCreateCFProperty(v3, CFSTR("HIDParameters"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        CFDictionaryRemoveValue(v6, CFSTR("HIDKeyboardModifierMappingPairs"));
        IOHIDEventSystemSetProperty(v2, CFSTR("HIDParameters"), v6);
      }
      CFRelease(v6);
    }
    IOObjectRelease(v4);
  }
  *(_QWORD *)policy_info = 0xFE000100FF0001;
  if (task_policy_set(mach_task_self_, 8u, policy_info, 2u))
  {
    v25 = _IOHIDLogCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100003D3C(v25, v26, v27, v28, v29, v30, v31, v32);
LABEL_20:
    CFRelease(v2);
    goto LABEL_21;
  }
  CFRunLoopRun();
  return 0;
}

void sub_100003CC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003CDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CC4((void *)&_mh_execute_header, a1, a3, "Failed to create HIDEventSystem\n", a5, a6, a7, a8, 0);
  sub_100003CD4();
}

void sub_100003D0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CC4((void *)&_mh_execute_header, a1, a3, "Failed to open HIDEventSystem\n", a5, a6, a7, a8, 0);
  sub_100003CD4();
}

void sub_100003D3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003CC4((void *)&_mh_execute_header, a1, a3, "Failed to set HIDEventSystem QOS\n", a5, a6, a7, a8, 0);
  sub_100003CD4();
}

void sub_100003D6C(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setiopolicy_np returned error: %#x\n", (uint8_t *)v1, 8u);
  sub_100003CD4();
}
