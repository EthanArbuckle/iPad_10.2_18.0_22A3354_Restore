uint64_t cs_uvfsop_init()
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v1 = 136315394;
    v2 = "cs_uvfsop_init";
    v3 = 1024;
    v4 = 629;
    _os_log_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Initializing CS UserFS plugin...\n", (uint8_t *)&v1, 0x12u);
  }
  return 0;
}

void cs_uvfsop_fini()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v0 = 136315394;
    v1 = "cs_uvfsop_fini";
    v2 = 1024;
    v3 = 636;
    _os_log_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Cleaning up CS UserFS plugin...\n", (uint8_t *)&v0, 0x12u);
  }
}

uint64_t cs_uvfsop_taste(int a1)
{
  uint64_t v2;
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  io_service_t MatchingService;
  io_object_t v11;
  const __CFString *CFProperty;
  const __CFString *v13;
  CFComparisonResult v14;
  uint64_t v16;
  char v17;
  char v18;
  uint8_t *v19;
  ssize_t v20;
  unsigned int v21;
  BOOL v22;
  unint64_t v23;
  int v24;
  int v25;
  int *v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  unsigned int v45;
  stat v46;
  int valuePtr;
  uint8_t v48[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  _DWORD __b[3];
  _QWORD v55[3];
  uint8_t buf[32];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  memset(&v46, 0, sizeof(v46));
  v45 = 0;
  v44 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "cs_fd_is_corestorage_pv";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 417;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a1;
    _os_log_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Tasting Apple_CoreStorage plugin, fd: %d\n", buf, 0x18u);
  }
  fstat(a1, &v46);
  if ((v46.st_mode & 0xF000) != 0x6000)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      cs_uvfsop_taste_cold_5();
    v2 = 45;
    goto LABEL_28;
  }
  if (ioctl(a1, 0x40046418uLL, &v45) == -1 && (v2 = *__error(), (_DWORD)v2)
    || ioctl(a1, 0x40086419uLL, &v44) == -1 && (v2 = *__error(), (_DWORD)v2)
    || (v2 = 15, !v45)
    || !v44)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      cs_uvfsop_taste_cold_4();
LABEL_28:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      cs_uvfsop_taste_cold_2();
    return v2;
  }
  if (!IOServiceMatching("IOMedia"))
    goto LABEL_17;
  v3 = IOServiceMatching("IOMedia");
  if (!v3)
    goto LABEL_17;
  v4 = v3;
  *(_DWORD *)buf = HIBYTE(v46.st_rdev);
  valuePtr = v46.st_rdev & 0xFFFFFF;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, buf);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(v4, CFSTR("BSD Major"), v6);
    CFRelease(v7);
  }
  v8 = CFNumberCreate(v5, kCFNumberIntType, &valuePtr);
  if (v8)
  {
    v9 = v8;
    CFDictionarySetValue(v4, CFSTR("BSD Minor"), v8);
    CFRelease(v9);
  }
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v4);
  if (!MatchingService
    || (v11 = MatchingService,
        (CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("Content Hint"), v5, 0)) == 0)
    || (v13 = CFProperty,
        v14 = CFStringCompare(CFProperty, CFSTR("53746F72-6167-11AA-AA11-00306543ECAC"), 0),
        CFRelease(v13),
        IOObjectRelease(v11),
        v14))
  {
LABEL_17:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      cs_uvfsop_taste_cold_1();
    return 45;
  }
  v55[0] = 0;
  v55[1] = v44 * v45 - 512;
  memset_pattern16(__b, &unk_22314C820, 8uLL);
  v16 = 0;
  v17 = 1;
  while (1)
  {
    v18 = v17;
    v19 = &v48[512 * v16];
    v20 = pread(a1, v19, 0x200uLL, v55[v16]);
    if (v20 == -1)
      v21 = *__error();
    else
      v21 = 0;
    if (v21)
      v22 = 1;
    else
      v22 = v20 == 512;
    if (v22)
      v2 = v21;
    else
      v2 = 5;
    if ((_DWORD)v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        cs_uvfsop_taste_cold_3();
      goto LABEL_28;
    }
    v23 = v45;
    v43 = v18;
    if (*((_WORD *)v19 + 45))
    {
      v24 = cs_verify_cksum(*((unsigned __int16 *)v19 + 45), (uint64_t)&v48[512 * v16], 512);
      if (v24)
      {
        v25 = v24;
        goto LABEL_52;
      }
    }
    if (v19[10] != 16)
    {
      v25 = 4;
      goto LABEL_52;
    }
    if (v19[11])
      goto LABEL_47;
    if (*((_QWORD *)v19 + 3) || *((_QWORD *)v19 + 4))
    {
      v25 = 16;
      goto LABEL_52;
    }
    if (*((_DWORD *)v19 + 12) != 512)
      goto LABEL_47;
    if (((4 * v19[52]) & 8) != 0)
      break;
    v25 = 1048577;
    if (*((_WORD *)v19 + 4) != 1 || *((_WORD *)v19 + 44) != 21315)
      goto LABEL_52;
    if (*((unsigned __int16 *)v19 + 47) - 5 < 0xFFFFFFFC)
      goto LABEL_47;
    if (*((_DWORD *)v19 + 25) % v23)
      goto LABEL_47;
    v34 = *((_DWORD *)v19 + 24);
    if (!v34)
      goto LABEL_47;
    if (v34 % v23)
      goto LABEL_47;
    v35 = *((_QWORD *)v19 + 8);
    if (v35 % v23)
      goto LABEL_47;
    v36 = 0x200 / v23;
    if (0x200 / v23 * (_DWORD)v23 != 512)
      ++v36;
    v37 = 2 * v23 * v36;
    if (v35 < v37)
    {
LABEL_47:
      v25 = 8;
      goto LABEL_52;
    }
    v38 = *((_QWORD *)v19 + 9);
    if (v38)
    {
      v25 = 8;
      if (v38 < v37 || v38 % v23)
        goto LABEL_52;
    }
    v39 = *((_QWORD *)v19 + 10);
    if (v39)
    {
      v25 = 8;
      if (v39 < v37 || v39 % v23)
        goto LABEL_52;
    }
    v26 = &__b[v16];
LABEL_65:
    v17 = 0;
    *v26 = 0;
    v16 = 1;
    if ((v43 & 1) == 0)
      goto LABEL_90;
  }
  v25 = (4 * v19[52]) & 8;
LABEL_52:
  v26 = &__b[v16];
  *v26 = v25;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  v60 = 0u;
  v59 = 0u;
  v58 = 0u;
  v57 = 0u;
  memset(buf, 0, sizeof(buf));
  v27 = *((unsigned __int16 *)v19 + 4);
  if (v27 == 1)
    goto LABEL_62;
  if (memcmp(v19, buf, 0x200uLL))
  {
    if (v27 == 11)
    {
      v28 = v19[10];
      v29 = v19[11];
      v30 = *((_QWORD *)v19 + 3);
      v31 = *((_QWORD *)v19 + 4);
      v32 = *((_DWORD *)v19 + 12);
      if ((!*((_WORD *)v19 + 45)
         || !cs_verify_cksum(*((unsigned __int16 *)v19 + 45), (uint64_t)v19, *((unsigned int *)v19 + 12)))
        && v28 == 16
        && !v29
        && !(v31 | v30)
        && v32 == 512)
      {
        *v26 = 1048577;
        v33 = MEMORY[0x24BDACB70];
LABEL_63:
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "cs_fd_is_corestorage_pv";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 526;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = a1;
          _os_log_impl(&dword_22314B000, v33, OS_LOG_TYPE_INFO, "%s:%d: Disk with fd %u has older physical volume header format.\n", buf, 0x18u);
        }
        goto LABEL_65;
      }
    }
LABEL_62:
    *v26 = v25;
    v33 = MEMORY[0x24BDACB70];
    if ((v25 & 0x100000) == 0)
      goto LABEL_90;
    goto LABEL_63;
  }
  *v26 = 33554433;
LABEL_90:
  v40 = 0;
  v41 = 1;
  while (1)
  {
    v42 = v41;
    if (__b[v40])
      break;
    v41 = 0;
    v40 = 1;
    if ((v42 & 1) == 0)
      goto LABEL_95;
  }
  if ((v41 & 1) != 0)
    goto LABEL_17;
LABEL_95:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v48 = 136315650;
    v49 = "cs_uvfsop_taste";
    v50 = 1024;
    v51 = 618;
    v52 = 1024;
    v53 = a1;
    _os_log_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d: Disk with file descriptor %d is corestorage physical volume.\n", v48, 0x18u);
  }
  return 0;
}

_QWORD *livefiles_plugin_init(_QWORD *result)
{
  if (result)
    *result = &cs_fsops;
  return result;
}

uint64_t cs_verify_cksum(int a1, uint64_t a2, uint64_t a3)
{
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a1 != 1)
    return 8;
  cksum_init(1u, v6);
  cksum(1, (char *)(a2 + 8), a3 - 8, (unsigned int *)v6);
  return 2 * (v6[0] != *(_QWORD *)a2);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t cksum_init(unsigned int a1, _QWORD *a2)
{
  unsigned int v2;
  uint64_t result;

  v2 = a1;
  if (a1)
  {
    result = 0;
    if (v2 != 1)
      return result;
    v2 = 255;
  }
  *a2 = 0x101010101010101 * v2;
  return 1;
}

uint64_t cksum(uint64_t result, char *a2, uint64_t a3, unsigned int *a4)
{
  unsigned int i;
  char v5;

  if ((_DWORD)result == 1)
  {
    for (i = *a4; a3; --a3)
    {
      v5 = *a2++;
      i = crc32_table[(v5 ^ i)] ^ (i >> 8);
    }
    *a4 = i;
  }
  return result;
}

void cs_uvfsop_taste_cold_1()
{
  __int16 v0;
  int v1;
  _WORD v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v2 = 136315650;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v2[7] = 610;
  v2[9] = v0;
  v3 = v1;
  _os_log_error_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Disk with file descriptor %d is not an corestorage physical volume.\n", (uint8_t *)v2, 0x18u);
  OUTLINED_FUNCTION_2();
}

void cs_uvfsop_taste_cold_2()
{
  __int16 v0;
  int v1;
  int v2;
  _WORD v3[10];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v3[7] = 600;
  v3[9] = v0;
  v4 = v1;
  v5 = v0;
  v6 = v2;
  _os_log_error_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Encountered error while tasting disk with file descriptor %d for Apple_CoreStorage plugin (error %d).\n", (uint8_t *)v3, 0x1Eu);
}

void cs_uvfsop_taste_cold_3()
{
  uint64_t v0;
  __int16 v1;
  int v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v3 = 136315906;
  OUTLINED_FUNCTION_0();
  *(_DWORD *)&v3[7] = 506;
  v3[9] = 2048;
  v4 = v0;
  v5 = v1;
  v6 = v2;
  _os_log_error_impl(&dword_22314B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d: Failed to read volume-hearder at offset %llu for disk with fd %d, Aborting taste.\n", (uint8_t *)v3, 0x22u);
}

void cs_uvfsop_taste_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22314B000, MEMORY[0x24BDACB70], v0, "%s:%d: Failed to get blocksize and block count for the device. Aborting taste.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void cs_uvfsop_taste_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22314B000, MEMORY[0x24BDACB70], v0, "%s:%d: Apple_CoreStorage plugin only supports block device. Aborting taste.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

