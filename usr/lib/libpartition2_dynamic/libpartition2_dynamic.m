void sub_206358E70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
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

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t _lp2_delete_directory_contents(const char *a1)
{
  _removefile_state *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  unsigned int value;
  char path[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  value = 0;
  v2 = removefile_state_alloc();
  removefile_state_set(v2, 1u, _lp2_delete_directory_contents_confirm);
  removefile_state_set(v2, 2u, &value);
  removefile_state_set(v2, 3u, _lp2_delete_directory_contents_error);
  removefile_state_set(v2, 4u, &value);
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v3 = _os_log_pack_fill();
  *(_DWORD *)v3 = 136380675;
  *(_QWORD *)(v3 + 4) = a1;
  _LPLogPack(1);
  if (removefile(a1, v2, 3u))
  {
    if (!value)
      value = *__error();
  }
  else
  {
    strcpy(path, ".XXXXXXXX");
    v4 = open(a1, 1048832);
    if (v4 == -1)
    {
      v8 = *__error();
    }
    else
    {
      v5 = v4;
      v6 = mkstempsat_np(v4, path, 8);
      if (v6 == -1)
      {
        v8 = *__error();
      }
      else
      {
        v7 = v6;
        if (unlinkat(v5, path, 0) || fcopyfile(v7, v5, 0, 5u))
          v8 = *__error();
        else
          v8 = 0;
        close(v7);
      }
      close(v5);
    }
    value = v8;
    if (v8)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v9 = _os_log_pack_fill();
      v10 = strerror(value);
      *(_DWORD *)v9 = 136380931;
      *(_QWORD *)(v9 + 4) = a1;
      *(_WORD *)(v9 + 12) = 2080;
      *(_QWORD *)(v9 + 14) = v10;
      _LPLogPack(1);
    }
  }
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v11 = _os_log_pack_fill();
  v12 = value;
  v13 = "failed";
  *(_DWORD *)v11 = 136381187;
  *(_QWORD *)(v11 + 4) = a1;
  if (!v12)
    v13 = "succeeded";
  *(_WORD *)(v11 + 12) = 2080;
  *(_QWORD *)(v11 + 14) = v13;
  *(_WORD *)(v11 + 22) = 1024;
  *(_DWORD *)(v11 + 24) = v12;
  _LPLogPack(1);
  removefile_state_free(v2);
  return value;
}

uint64_t _execForLibpartition(const char **a1)
{
  uint64_t v2;
  const char *v3;
  int *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  int v12;
  ssize_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  int *v23;
  char *v24;
  uint64_t v25;
  const char *v26;
  int v27;
  int v28;
  posix_spawnattr_t v29;
  posix_spawn_file_actions_t v30;
  pid_t v31;
  _BYTE v32[1024];
  int v33[2];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  *(_QWORD *)v33 = -1;
  if (pipe(v33))
  {
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v2 = _os_log_pack_fill();
    v3 = *a1;
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)v2 = 136315394;
    *(_QWORD *)(v2 + 4) = v3;
    *(_WORD *)(v2 + 12) = 2080;
    *(_QWORD *)(v2 + 14) = v5;
    _LPLogPack(1);
    return 0xFFFFFFFFLL;
  }
  v29 = 0;
  v30 = 0;
  posix_spawn_file_actions_init(&v30);
  posix_spawn_file_actions_adddup2(&v30, v33[1], 1);
  posix_spawn_file_actions_addclose(&v30, v33[0]);
  posix_spawnattr_init(&v29);
  posix_spawnattr_setflags(&v29, 0x4000);
  v7 = posix_spawn(&v31, *a1, &v30, 0, (char *const *)a1, 0);
  if ((_DWORD)v7)
  {
    v6 = v7;
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v8 = _os_log_pack_fill();
    v9 = *a1;
    v10 = strerror(v6);
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v8 + 4) = v9;
    *(_WORD *)(v8 + 12) = 2080;
    *(_QWORD *)(v8 + 14) = v10;
    _LPLogPack(1);
    close(v33[0]);
    goto LABEL_5;
  }
  bzero(v32, 0x400uLL);
  v12 = v33[0];
  close(v33[1]);
  v33[1] = -1;
  v13 = read(v12, v32, 0x400uLL);
  if (v13 >= 1)
  {
    do
    {
      execlogfunction(v13, v14, v15, v16, v17, v18, v19, v20, v13);
      v13 = read(v12, v32, 0x400uLL);
    }
    while (v13 > 0);
  }
  v28 = 0;
  if (waitpid(v31, &v28, 0) == -1)
  {
    v6 = *__error();
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v21 = _os_log_pack_fill();
    v22 = *a1;
    v23 = __error();
    v24 = strerror(*v23);
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)(v21 + 4) = v22;
    *(_WORD *)(v21 + 12) = 2080;
    *(_QWORD *)(v21 + 14) = v24;
    _LPLogPack(1);
  }
  else
  {
    if ((v28 & 0x7F) == 0x7F)
    {
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v25 = _os_log_pack_fill();
      v26 = *a1;
      v27 = v28 >> 8;
    }
    else
    {
      if ((v28 & 0x7F) == 0)
      {
        v6 = BYTE1(v28);
        goto LABEL_5;
      }
      _os_log_pack_size();
      MEMORY[0x24BDAC7A8]();
      v25 = _os_log_pack_fill();
      v26 = *a1;
      v27 = v28 & 0x7F;
    }
    *(_DWORD *)v25 = 136315394;
    *(_QWORD *)(v25 + 4) = v26;
    *(_WORD *)(v25 + 12) = 1024;
    *(_DWORD *)(v25 + 14) = v27;
    _LPLogPack(1);
    v6 = 0xFFFFFFFFLL;
  }
LABEL_5:
  posix_spawnattr_destroy(&v29);
  posix_spawn_file_actions_destroy(&v30);
  if (v33[1] != -1)
    close(v33[1]);
  return v6;
}

char *___is_running_in_ramdisk_block_invoke()
{
  char *result;
  size_t v1;
  char __s1[1024];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  bzero(__s1, 0x400uLL);
  v1 = 1024;
  result = (char *)sysctlbyname("kern.bootargs", __s1, &v1, 0, 0);
  if (!(_DWORD)result)
  {
    result = strstr(__s1, "-restore");
    if (result)
      _is_running_in_ramdisk_is_ramdisk = 1;
  }
  return result;
}

uint64_t _lp2_delete_directory_contents_confirm()
{
  return 0;
}

uint64_t _lp2_delete_directory_contents_error(uint64_t a1, uint64_t a2, int *a3)
{
  int *v5;
  int v6;
  uint64_t v7;
  char *v8;

  v5 = __error();
  v6 = *v5;
  *a3 = *v5;
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v7 = _os_log_pack_fill();
  v8 = strerror(v6);
  *(_DWORD *)v7 = 136380931;
  *(_QWORD *)(v7 + 4) = a2;
  *(_WORD *)(v7 + 12) = 2080;
  *(_QWORD *)(v7 + 14) = v8;
  _LPLogPack(1);
  return 2;
}

void execlogfunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", CFSTR("%.*s"), &a9);
  _os_log_pack_size();
  MEMORY[0x24BDAC7A8]();
  v10 = _os_log_pack_fill();
  *(_DWORD *)v10 = 138412290;
  *(_QWORD *)(v10 + 4) = v9;
  _LPLogPack(3);

}

id _LPLogObject()
{
  if (_LPLogObject_onceToken != -1)
    dispatch_once(&_LPLogObject_onceToken, &__block_literal_global_0);
  return (id)_LPLogObject_obj;
}

void _LPLogPack(int a1)
{
  id v1;
  char *v2;
  id v3;

  if (sLogLevel >= a1)
  {
    v1 = _LPLogObject();
    v2 = (char *)os_log_pack_compose();

    if (sLogToStandardOut)
      fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s\n", v2);
    if (sLogToOSLog)
    {
      v3 = _LPLogObject();
      os_log_pack_send();

    }
    if (sLogToConsole)
      dprintf(sConsoleFD, "%s\n", v2);
    free(v2);
  }
}

uint64_t LPLogSetOutput(char a1)
{
  uint64_t result;

  sLogToStandardOut = a1 & 1;
  sLogToOSLog = (a1 & 2) != 0;
  sLogToConsole = (a1 & 4) != 0;
  result = sConsoleFD;
  if ((a1 & 4) != 0)
  {
    if (sConsoleFD == -1)
    {
      result = open("/dev/console", 10);
      sConsoleFD = result;
      if ((_DWORD)result == -1)
        sLogToConsole = 0;
    }
  }
  else
  {
    if (sConsoleFD != -1)
      result = close(sConsoleFD);
    sConsoleFD = -1;
  }
  return result;
}

uint64_t LPLogSetVerbosity(uint64_t result)
{
  sLogLevel = result;
  return result;
}

id __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{

}

BOOL iterateSafely(uint64_t a1, int a2, id a3, void *a4)
{
  void (**v7)(id, _QWORD);
  void (**v8)(_QWORD);
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = (void (**)(id, _QWORD))a3;
  v8 = a4;
  if (a2 < 1)
  {
    v10 = 0;
LABEL_10:
    _os_log_pack_size();
    MEMORY[0x24BDAC7A8]();
    v13 = _os_log_pack_fill();
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v13 + 4) = "_Bool iterateSafely(io_iterator_t, int, void (^__strong)(io_object_t), void (^__strong)(void))";
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v13 + 14) = a2;
    _LPLogPack(1);
  }
  else
  {
    v9 = 0;
    v10 = 1;
    while (1)
    {
      v11 = IOIteratorNext(a1);
      if ((_DWORD)v11)
      {
        v12 = v11;
        do
        {
          v7[2](v7, v12);
          IOObjectRelease(v12);
          v12 = IOIteratorNext(a1);
        }
        while ((_DWORD)v12);
      }
      if (IOIteratorIsValid(a1))
        break;
      MEMORY[0x20BCF2F48](a1);
      v8[2](v8);
      v10 = ++v9 < a2;
      if (v9 == a2)
        goto LABEL_10;
    }
  }

  return v10;
}

uint64_t APFSVolumeCreate()
{
  return MEMORY[0x24BDFD298]();
}

uint64_t APFSVolumeCreateForMSU()
{
  return MEMORY[0x24BDFD2A0]();
}

uint64_t APFSVolumeDelete()
{
  return MEMORY[0x24BDFD2A8]();
}

uint64_t APFSVolumeGetVEKState()
{
  return MEMORY[0x24BDFD2C0]();
}

uint64_t APFSVolumeRole()
{
  return MEMORY[0x24BDFD2F8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x24BDD86F0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88B8](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8950](*(_QWORD *)&iterator);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x24BDD89C8](*(_QWORD *)&service, waitTime);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x24BDACB98]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x24BDACBA0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE0A8](*(_QWORD *)&a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x24BDAE2F0](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAE490](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAE498](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int fs_snapshot_list(int a1, attrlist *a2, void *a3, size_t a4, uint32_t a5)
{
  return MEMORY[0x24BDAE4A0](*(_QWORD *)&a1, a2, a3, a4, *(_QWORD *)&a5);
}

int fs_snapshot_rename(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x24BDAE4B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAE4B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t fs_snapshot_root()
{
  return MEMORY[0x24BDAE4C0]();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x24BDAE698](a1, *(_QWORD *)&a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
}

int mkstempsat_np(int dfd, char *path, int slen)
{
  return MEMORY[0x24BDAEF88](*(_QWORD *)&dfd, path, *(_QWORD *)&slen);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x24BDAF370]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x24BDAF378]();
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x24BDAF600](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x24BDAF610](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x24BDAF618](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF630](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x24BDAF638](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF640](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x24BDAF650](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x24BDAF660](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x24BDAFB40](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x24BDAFB48]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x24BDAFB50](a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x24BDAFB60](state, *(_QWORD *)&key, value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAFD00](a1, a2, a3, a4, *(_QWORD *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x24BDB02B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int unmount(const char *a1, int a2)
{
  return MEMORY[0x24BDB02C8](a1, *(_QWORD *)&a2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x24BDB0478](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

