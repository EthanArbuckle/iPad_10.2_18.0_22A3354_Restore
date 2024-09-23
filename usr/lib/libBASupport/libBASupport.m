BOOL ba_is_process_extension()
{
  uint64_t v0;
  audit_token_t *v1;
  const __CFAllocator *v2;
  const __CFString *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  const __CFDictionary *v9;
  CFTypeID v10;
  const void *v11;
  _BOOL8 v12;
  CFTypeID v13;
  const void *v14;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  char buffer[4096];
  uint64_t v20;

  v0 = MEMORY[0x1E0C80A78]();
  v20 = *MEMORY[0x1E0C80C00];
  if (!v0)
    ba_is_process_extension_cold_1();
  v1 = (audit_token_t *)v0;
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath_audittoken(v1, buffer, 0x1000u) >= 1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], buffer);
    if (v3)
    {
      v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 0);
      v5 = v4;
      if (!v4)
      {
        v12 = 0;
LABEL_22:
        CFRelease(v3);
        return v12;
      }
      v6 = CFBundleCopyInfoDictionaryForURL(v4);
      v7 = v6;
      if (!v6)
      {
        v12 = 0;
LABEL_21:
        CFRelease(v5);
        goto LABEL_22;
      }
      Value = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("EXAppExtensionAttributes"));
      v9 = Value;
      if (Value)
      {
        v10 = CFGetTypeID(Value);
        if (v10 == CFDictionaryGetTypeID())
        {
          v11 = CFDictionaryGetValue(v9, CFSTR("EXExtensionPointIdentifier"));
          v12 = (_BOOL8)v11;
          if (v11)
          {
            v13 = CFGetTypeID(v11);
            if (v13 == CFStringGetTypeID())
              goto LABEL_17;
          }
        }
      }
      v14 = CFDictionaryGetValue(v7, CFSTR("NSExtension"));
      v12 = (_BOOL8)v14;
      if (v14)
      {
        v15 = CFGetTypeID(v14);
        if (v15 != CFDictionaryGetTypeID())
          goto LABEL_19;
        v16 = CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("NSExtensionPointIdentifier"));
        v12 = (_BOOL8)v16;
        if (v16)
        {
          v17 = CFGetTypeID(v16);
          if (v17 == CFStringGetTypeID())
          {
LABEL_17:
            v12 = CFStringCompare((CFStringRef)v12, CFSTR("com.apple.background-asset-downloader-extension"), 0) == kCFCompareEqualTo;
            goto LABEL_20;
          }
LABEL_19:
          v12 = 0;
        }
      }
LABEL_20:
      CFRelease(v7);
      goto LABEL_21;
    }
  }
  return 0;
}

void sub_1ACB534B4(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;
  const void *v3;

  CFRelease(v3);
  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t ba_is_current_process_extension()
{
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v3;

  *(_OWORD *)task_info_out = 0u;
  v3 = 0u;
  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt))
    return 0;
  else
    return ba_is_process_extension_ls((__int128 *)task_info_out);
}

uint64_t ba_is_process_extension_ls(__int128 *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (!a1)
    ba_is_process_extension_ls_cold_1();
  v2 = os_log_create("com.apple.BackgroundAssets.BASupport", "ExtensionLookup");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getLSBundleRecordClass_softClass;
  v21 = getLSBundleRecordClass_softClass;
  if (!getLSBundleRecordClass_softClass)
  {
    *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v15 + 1) = 3221225472;
    *(_QWORD *)&v16 = __getLSBundleRecordClass_block_invoke;
    *((_QWORD *)&v16 + 1) = &unk_1E5C72308;
    v17 = &v18;
    __getLSBundleRecordClass_block_invoke((uint64_t)&v15);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  v14 = 0;
  v5 = a1[1];
  v15 = *a1;
  v16 = v5;
  objc_msgSend(v4, "bundleRecordForAuditToken:error:", &v15, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (!v6)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      ba_is_process_extension_ls_cold_2((uint64_t)v7, v2);
    goto LABEL_11;
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getLSApplicationExtensionRecordClass_softClass;
  v21 = getLSApplicationExtensionRecordClass_softClass;
  if (!getLSApplicationExtensionRecordClass_softClass)
  {
    *(_QWORD *)&v15 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v15 + 1) = 3221225472;
    *(_QWORD *)&v16 = __getLSApplicationExtensionRecordClass_block_invoke;
    *((_QWORD *)&v16 + 1) = &unk_1E5C72308;
    v17 = &v18;
    __getLSApplicationExtensionRecordClass_block_invoke((uint64_t)&v15);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "extensionPointRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.background-asset-downloader-extension"));

LABEL_12:
  return v12;
}

void sub_1ACB5375C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLSBundleRecordClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreServicesLibrary();
  result = objc_getClass("LSBundleRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSBundleRecordClass_block_invoke_cold_1();
  getLSBundleRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreServicesLibrary()
{
  void *v0;

  if (!CoreServicesLibraryCore_frameworkLibrary)
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getLSApplicationExtensionRecordClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreServicesLibrary();
  result = objc_getClass("LSApplicationExtensionRecord");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getLSApplicationExtensionRecordClass_block_invoke_cold_1();
  getLSApplicationExtensionRecordClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ba_is_process_extension_ls_cold_1()
{
  qword_1EECAC5B0 = (uint64_t)"BUG IN CLIENT OF libBASupport: ba_is_process_extension_ls() was invoked with a NULL audit token.";
  qword_1EECAC5E0 = 6;
  __break(1u);
}

void ba_is_process_extension_ls_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1ACB52000, a2, OS_LOG_TYPE_DEBUG, "-[LSBundleRecord bundleRecordForAuditToken:] returned nil. %{public}@", (uint8_t *)&v2, 0xCu);
}

void ba_is_process_extension_cold_1()
{
  qword_1EECAC5B0 = (uint64_t)"BUG IN CLIENT OF libBASupport: ba_is_process_extension() was invoked with a NULL audit token.";
  qword_1EECAC5E0 = 6;
  __break(1u);
}

void __getLSBundleRecordClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getLSApplicationExtensionRecordClass_block_invoke_cold_1(v0);
}

void __getLSApplicationExtensionRecordClass_block_invoke_cold_1()
{
  const __CFURL *v0;

  v0 = (const __CFURL *)abort_report_np();
  CFBundleCopyInfoDictionaryForURL(v0);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1E0C99008](alloc, buffer);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

