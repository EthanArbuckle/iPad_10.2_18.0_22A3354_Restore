uint64_t start()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFData *CFProperty;
  uint64_t Length;
  size_t v4;
  timespec v5;
  int v6;
  char *v7;
  int v8;
  int v10;
  timespec v11;
  char *v12;
  size_t v13;
  int v14;
  stat v15;
  mach_port_t mainPort[4];
  timespec v17;
  timespec v18;
  timespec v19;
  timespec v20;
  CFRange v21;

  puts("checking in");
  if ((chdir(off_100014008) & 0x80000000) == 0)
  {
LABEL_2:
    fflush(__stdoutp);
    mainPort[0] = -1431655766;
    if (!IOMainPort(0, mainPort))
    {
      v0 = IORegistryEntryFromPath(mainPort[0], "IODeviceTree:/chosen");
      if (v0)
      {
        v1 = v0;
        CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("osenvironment"), kCFAllocatorDefault, 0);
        Length = CFDataGetLength(CFProperty);
        if (CFProperty && (v4 = Length, Length <= 64))
        {
          v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          v15.st_atimespec = v5;
          v15.st_mtimespec = v5;
          *(timespec *)&v15.st_dev = v5;
          *(timespec *)&v15.st_uid = v5;
          v21.location = 0;
          v21.length = Length;
          CFDataGetBytes(CFProperty, v21, (UInt8 *)&v15);
          v6 = strncmp("darwinos-ramdisk", (const char *)&v15, v4);
          CFRelease(CFProperty);
          IOObjectRelease(v1);
          if (!v6)
          {
            *(_OWORD *)&v15.st_dev = off_100010560;
            sigaction(31, (const sigaction *)&v15, 0);
            while (1)
              usleep(0xF4240u);
          }
        }
        else
        {
          if (CFProperty)
            CFRelease(CFProperty);
          IOObjectRelease(v1);
        }
      }
    }
    *(_OWORD *)&v15.st_dev = off_100010570;
    sigaction(15, (const sigaction *)&v15, 0);
    sigaction(3, (const sigaction *)&v15, 0);
    sigaction(2, (const sigaction *)&v15, 0);
    xpc_activity_register("com.apple.iomfb_bics_daemon", XPC_ACTIVITY_CHECK_IN, &stru_1000105A0);
    dispatch_main();
  }
  v7 = off_100014000[0];
  v8 = *off_100014000[0];
  if (v8 == 47)
  {
    if (chdir("/"))
      goto LABEL_11;
    v10 = *++v7;
    v8 = v10;
  }
  if (!v8)
    goto LABEL_2;
  while (1)
  {
    v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    v19 = v11;
    v20 = v11;
    v17 = v11;
    v18 = v11;
    *(timespec *)mainPort = v11;
    *(timespec *)&v15.st_blksize = v11;
    *(timespec *)v15.st_qspare = v11;
    v15.st_birthtimespec = v11;
    *(timespec *)&v15.st_size = v11;
    v15.st_mtimespec = v11;
    v15.st_ctimespec = v11;
    *(timespec *)&v15.st_uid = v11;
    v15.st_atimespec = v11;
    *(timespec *)&v15.st_dev = v11;
    v12 = strchr(v7, 47);
    v13 = v12 ? v12 - v7 : strlen(v7);
    if (v13 - 80 < 0xFFFFFFFFFFFFFFAFLL)
      break;
    __strncpy_chk(mainPort, v7, v13, 80);
    *((_BYTE *)mainPort + v13) = 0;
    if (stat((const char *)mainPort, &v15))
    {
      if (*__error() != 2 || mkdir((const char *)mainPort, 0x1F8u))
        break;
    }
    if (chdir((const char *)mainPort))
      break;
    v7 = &v7[v13 - 1];
    do
      v14 = *++v7;
    while (v14 == 47);
    if (!*v7)
      goto LABEL_2;
  }
LABEL_11:
  printf("failed to connect to working directory");
  return 1;
}

void sub_100001AF4()
{
  unint64_t v0;
  unsigned int v1;

  do
    v0 = __ldaxr((unint64_t *)&dword_100014010);
  while (__stlxr(v0 | 1, (unint64_t *)&dword_100014010));
  if ((v0 & 1) != 0)
    v1 = 3;
  else
    v1 = v0 >> 1;
  if (v1 - 2 >= 2)
  {
    if (!v1)
      sub_1000022A8((char *)qword_100014258);
    exit(0);
  }
}

void sub_100001B50(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state;
  char v3;
  unint64_t v4;
  char v5;

  state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    if (qword_100014258)
    {
      do
        v4 = __ldaxr((unint64_t *)&dword_100014010);
      while (__stlxr(v4 | 4, (unint64_t *)&dword_100014010));
      if (v4 >= 2)
      {
        puts("State transition error");
        exit(1);
      }
      if ((dword_100014010 & 0xFFFFFFFE) != 4)
        printf("%s(%d), op failed\n", "set_state", 2);
      if (!(_DWORD)v4)
      {
        puts("woke");
        fflush(__stdoutp);
        sub_100002340((char *)qword_100014258);
      }
      do
        v5 = __ldaxr((unint64_t *)&dword_100014010);
      while (__stlxr(v5 & 1, (unint64_t *)&dword_100014010));
      if (dword_100014010 >= 2)
        printf("%s(%d), op failed\n", "set_state", 0);
      if ((v5 & 1) != 0)
        exit(0);
      goto LABEL_21;
    }
  }
  else
  {
    if (state)
    {
      printf("state = %lld, d=%d\n");
LABEL_21:
      puts("sleeping");
      fflush(__stdoutp);
      return;
    }
    if (!qword_100014258)
    {
      puts("starting");
      fflush(__stdoutp);
      qword_100014258 = sub_100001FE4();
      if (qword_100014258)
      {
        do
          v3 = __ldaxr((unint64_t *)&dword_100014010);
        while (__stlxr(v3 & 1, (unint64_t *)&dword_100014010));
        if (dword_100014010 >= 2)
          printf("%s(%d), op failed\n");
        goto LABEL_21;
      }
      puts("failed to start properly");
      xpc_activity_unregister("com.apple.iomfb_bics_daemon");
    }
  }
}

uint64_t sub_100001D50(int a1)
{
  return ((a1 + 217) & 0xFFFFFFFC) + 4;
}

uint64_t sub_100001D60(_DWORD *a1)
{
  if (*a1 == 1)
    return 14;
  else
    return 0;
}

uint64_t sub_100001D74(uint64_t result, int a2)
{
  int v2;
  unsigned int v3;
  int v4;

  if (result)
  {
    if (*(_DWORD *)result == 1
      && (v2 = *(_DWORD *)(result + 8) + *(unsigned __int16 *)(result + 4) * *(unsigned __int16 *)(result + 6), v2 != -14))
    {
      v3 = (v2 + 17) & 0xFFFFFFFC;
      if (a2)
        v4 = 4;
      else
        v4 = 0;
      return v3 + v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

_DWORD *sub_100001DC0(_DWORD *result)
{
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)(result[2] + 14);
    else
      return 0;
  }
  return result;
}

BOOL sub_100001DE4(const char *a1, size_t __n, char *__s2, int a4)
{
  return (_DWORD)__n == a4 && strncmp(a1, __s2, __n) == 0;
}

int *sub_100001E1C(int *result, int a2, int *a3)
{
  int i;
  int v4;

  for (i = *a3; a2; --a2)
  {
    v4 = *result++;
    i = v4 ^ __ROR4__(i, 15);
  }
  *a3 = i;
  return result;
}

void sub_100001E3C(int a1, int a2, uint64_t a3, intptr_t notificationID)
{
  BOOL v5;
  const char *v6;
  uint64_t v7;

  switch((_DWORD)a3)
  {
    case 0xE0000320:
      byte_100014019 = 0;
      (*(void (**)(uint64_t, _QWORD, uint64_t, intptr_t))(*(_QWORD *)qword_100014700 + 64))(qword_100014700, 0, a3, notificationID);
      if (byte_10001401C)
        v5 = byte_10001401B == 0;
      else
        v5 = 1;
      if (!v5)
      {
        sub_1000031AC("Woke up: resuming pending tasks.\n");
        v7 = 1;
        IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v7);
        if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)qword_100014700 + 24))(qword_100014700))
          byte_10001401B = 0;
        v7 = 0;
        IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v7);
      }
      break;
    case 0xE0000280:
      if (byte_10001401A)
        v6 = (const char *)&unk_10000ACAF;
      else
        v6 = "not ";
      sub_1000031AC("going to sleep, %sbusy", v6);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)qword_100014700 + 64))(qword_100014700, 1);
      pthread_mutex_lock(&stru_100014020);
      if (byte_10001401A)
      {
        byte_100014019 = 1;
        pthread_cond_wait(&stru_100014060, &stru_100014020);
      }
      pthread_mutex_unlock(&stru_100014020);
      sub_1000031AC("allowing sleep");
      goto LABEL_19;
    case 0xE0000270:
LABEL_19:
      IOAllowPowerChange(dword_10001470C, notificationID);
      break;
  }
}

uint64_t sub_100001FE4()
{
  io_registry_entry_t ServiceObject;
  unsigned int v1;

  if (!byte_100014018 && !IOMobileFramebufferGetMainDisplay(&qword_100014098))
  {
    qword_100014700 = 0;
    ServiceObject = IOMobileFramebufferGetServiceObject(qword_100014098);
    v1 = sub_100002E38(ServiceObject, "IOMFBBICSType");
    if (v1 == 2)
    {
      sub_1000031AC("BICS backlight support");
      operator new();
    }
    if (v1 == 1)
    {
      sub_1000031AC("BICS pixel support");
      operator new();
    }
    sub_1000031AC("BICS no support");
    qword_100014700 = 0;
    sub_100002254();
  }
  return 0;
}

void sub_10000221C()
{
  operator delete();
}

uint64_t sub_100002254()
{
  uint64_t result;

  if (qword_100014098)
    CFRelease((CFTypeRef)qword_100014098);
  qword_100014098 = 0;
  result = qword_100014700;
  if (qword_100014700)
  {
    nullsub_2();
    operator delete();
  }
  qword_100014700 = 0;
  return result;
}

uint64_t sub_1000022A8(char *a1)
{
  uint64_t v1;
  uint64_t v3;

  if (a1 == &byte_100014018)
  {
    v3 = 1;
    IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v3);
    v1 = sub_100002C58(qword_100014700);
    v3 = 0;
    IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v3);
  }
  else
  {
    syslog(5, "totally bogus daemon pointer.");
    return 3758097084;
  }
  return v1;
}

uint64_t sub_100002340(char *a1)
{
  uint64_t v1;
  sem_t *v2;
  sem_t *v3;
  uint64_t v5;

  if (a1 == &byte_100014018)
  {
    pthread_mutex_lock(&stru_100014020);
    if (byte_100014019)
    {
      pthread_mutex_unlock(&stru_100014020);
      return 0;
    }
    else
    {
      byte_10001401A = 1;
      pthread_mutex_unlock(&stru_100014020);
      v5 = 1;
      IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v5);
      v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)qword_100014700 + 24))(qword_100014700);
      if ((_DWORD)v1 == -536870165)
        byte_10001401B = 1;
      v5 = 0;
      IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v5);
      pthread_mutex_lock(&stru_100014020);
      byte_10001401A = 0;
      if (byte_100014019)
      {
        byte_100014019 = 0;
        pthread_cond_signal(&stru_100014060);
      }
      pthread_mutex_unlock(&stru_100014020);
      sub_1000031AC("done");
      v2 = sem_open("iomfb_bics_daemon.started", 0);
      if (v2 == (sem_t *)-1)
      {
        sub_1000031AC("Couldn't open semaphore to notify");
      }
      else
      {
        v3 = v2;
        sem_post(v2);
        sem_close(v3);
      }
    }
  }
  else
  {
    v1 = 3758097084;
    syslog(5, "totally bogus daemon pointer.");
  }
  return v1;
}

uint64_t sub_1000024B0()
{
  uint64_t result;
  __int128 v1;
  FILE *v2;
  FILE *v3;
  uint64_t v4;
  _OWORD v5[6];
  int v6;

  byte_100014708 = 1;
  byte_100014709 = 1;
  result = sub_100001FE4();
  if (result)
  {
    v6 = -1431655766;
    *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[4] = v1;
    v5[5] = v1;
    v5[2] = v1;
    v5[3] = v1;
    v5[0] = v1;
    v5[1] = v1;
    v4 = 1;
    IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v4);
    (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)qword_100014700 + 40))(qword_100014700, v5);
    v4 = 0;
    IOMobileFramebufferSetParameter(qword_100014098, 11, 1, &v4);
    v2 = fopen("/var/hardware/done", "w");
    if (!v2)
    {
      sub_10000268C("Couldn't open 'done' file");
      exit(-1);
    }
    v3 = v2;
    fprintf(v2, "%s\n", (const char *)v5);
    return fclose(v3);
  }
  return result;
}

uint64_t sub_1000025D8(uint64_t result)
{
  *(_QWORD *)result = off_1000105D0;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 25) = 0;
  return result;
}

uint64_t sub_1000025F4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = a2;
  return 1;
}

uint64_t sub_100002600(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3;
  io_object_t v4;
  CFTypeRef CFProperty;
  char v6;

  v3 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (v3)
  {
    v4 = v3;
    CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
    IOObjectRelease(v4);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    sub_10000268C("unable to find /defaults node\n");
  }
  return v6 & 1;
}

void sub_10000268C(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(4, a1, va);
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }
}

uint64_t sub_1000026F4(uint64_t a1)
{
  uint64_t result;

  result = sub_100002600(a1, CFSTR("ean-storage-present"));
  *(_BYTE *)(a1 + 25) = result;
  return result;
}

uint64_t sub_100002720(uint64_t a1)
{
  uint64_t result;

  result = sub_100002600(a1, CFSTR("display-storage-present"));
  *(_BYTE *)(a1 + 24) = result;
  return result;
}

uint64_t sub_10000274C(uint64_t a1)
{
  sub_100002778(a1);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
}

void sub_100002778(uint64_t a1)
{
  time_t v2;
  __int128 v3;
  io_registry_entry_t ServiceObject;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int *v14;
  unsigned int v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _QWORD *v20;
  int Block;
  int v22;
  BOOL v23;
  uint64_t v24;
  int *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  _BYTE v29[600];
  _OWORD v30[4];
  unsigned int v31;
  uint64_t v32;
  int *v33;
  unint64_t v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[28];
  _QWORD v41[2];
  _QWORD __dst[1350];
  _BYTE v43[512];
  _DWORD v44[382];

  v2 = time(0);
  bzero(&v44[3], 0x5ECuLL);
  v44[0] = 1;
  *(_QWORD *)&v44[1] = v2;
  *(_QWORD *)&v44[5] = v2;
  memcpy(v43, &unk_10000CEE0, sizeof(v43));
  memcpy(__dst, &unk_10000D0E0, sizeof(__dst));
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v40[12] = v3;
  v39 = v3;
  *(_OWORD *)v40 = v3;
  v36 = xmmword_10000FB10;
  v37 = unk_10000FB20;
  v38 = xmmword_10000FB30;
  v35 = -1;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v41[1] = 0;
  v41[0] = 0;
  ServiceObject = IOMobileFramebufferGetServiceObject(*(_QWORD *)(a1 + 16));
  v5 = sub_100002E38(ServiceObject, "ean-mode-caching");
  v6 = sub_100002E38(ServiceObject, "ean-mode-update-thesh");
  if (v6)
    v7 = v6;
  else
    v7 = 172800;
  if (v5 && *(_BYTE *)(a1 + 25))
  {
    if (!sub_100002EE0(0x50525354u, (void **)&v33, (_DWORD *)&v32 + 1))
    {
      if (HIDWORD(v32) > 0x3FF)
      {
        v8 = v33;
        if (v33)
        {
          v9 = (uint64_t *)(v33 + 5);
          if (*(_QWORD *)(v33 + 5))
          {
            sub_100001E1C(v33 + 5, 2, (int *)&v32);
            if (*(_QWORD *)(v8 + 7) == v32)
            {
              v10 = *v9;
              if (v2 != *v9)
              {
                if ((v2 - *v9) / (unint64_t)(*(_QWORD *)(v8 + 3) + 1) < v7)
                {
LABEL_44:
                  free(v8);
                  return;
                }
                *(_QWORD *)&v44[3] = *(_QWORD *)(v8 + 3) + 1;
                *(_QWORD *)&v44[5] = v10;
              }
            }
          }
        }
      }
      else
      {
        sub_10000268C("modeInfoUpdate: size mismatch\n");
        sub_100003040(0x50525354u);
      }
    }
    v11 = 0;
    v12 = v43;
    while (1)
    {
      HIDWORD(v41[0]) = v11;
      if (IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 50, v12, 64, v41, 3))
        break;
      ++v11;
      v12 += 64;
      if (v11 == 8)
      {
        *(_QWORD *)&v44[129] = 4;
        break;
      }
    }
    v13 = 153;
    v14 = &dword_10000FB40;
    do
    {
      v15 = *v14++;
      v16 = &v43[64 * (unint64_t)v15];
      v17 = v16[1];
      v30[0] = *v16;
      v30[1] = v17;
      v18 = v16[3];
      v30[2] = v16[2];
      v30[3] = v18;
      sub_100002D68(&v44[v13], v30);
      v13 += 16;
    }
    while (v13 != 249);
    v19 = 0;
    v20 = __dst;
    do
    {
      HIDWORD(v41[0]) = v19;
      Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 51, v20, 600, v41, 4);
      if (*((_DWORD *)v20 + 2) == 8)
      {
        v8 = v33;
        goto LABEL_43;
      }
      v22 = Block;
      if (Block)
        v23 = 1;
      else
        v23 = v19 == 17;
      ++v19;
      v20 += 75;
    }
    while (!v23);
    v24 = 249;
    v25 = &dword_10000FB58;
    do
    {
      v26 = *v25++;
      memcpy(v29, &__dst[75 * v26], sizeof(v29));
      sub_100002DCC((uint64_t)&v44[v24], (uint64_t)v29);
      v24 += 16;
    }
    while (v24 != 377);
    if (!v22)
      *(_QWORD *)&v44[129] |= 8uLL;
    if (!IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 64, &v39, 44, 0, 0))
      *(_QWORD *)&v44[129] |= 1uLL;
    *(_OWORD *)&v44[131] = v39;
    *(_OWORD *)&v44[135] = *(_OWORD *)v40;
    *(_QWORD *)&v44[139] = *(_QWORD *)&v40[16];
    if (!IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 61, &v36, 48, 0, 0))
      *(_QWORD *)&v44[129] |= 2uLL;
    v44[141] = v36;
    LOWORD(v44[143]) = WORD4(v36);
    *(_OWORD *)&v44[145] = v37;
    *(_OWORD *)&v44[149] = v38;
    if (!IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 70, &v34, 12, 0, 0))
      *(_QWORD *)&v44[129] |= 0x10uLL;
    v44[377] = v34;
    LOBYTE(v44[378]) = BYTE4(v34);
    v44[379] = v35;
    sub_100001E1C(&v44[129], 252, &v44[381]);
    v8 = v33;
    if (v33 && v44[381] == v33[381])
      goto LABEL_44;
    sub_100001E1C(&v44[5], 2, (int *)&v31);
    *(_QWORD *)&v44[7] = v31;
    v27 = malloc_type_malloc(0x1000uLL, 0xCC9EFE83uLL);
    if (v27)
    {
      v28 = v27;
      bzero(v27, 0x1000uLL);
      memcpy(v28, v44, 0x5F8uLL);
      sub_1000030D0(0x50525354u, (uint64_t)v28, 0x400u);
      free(v28);
    }
LABEL_43:
    if (!v8)
      return;
    goto LABEL_44;
  }
}

uint64_t sub_100002C58(uint64_t a1)
{
  uint64_t v2;

  sub_100002CD0(a1, 1u);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(a1, 0);
  sub_100002CD0(a1, 0);
  sub_100002778(a1);
  return v2;
}

uint64_t sub_100002CD0(uint64_t a1, unsigned int a2)
{
  io_registry_entry_t ServiceObject;
  uint64_t v5;
  uint64_t v7;

  ServiceObject = IOMobileFramebufferGetServiceObject(*(_QWORD *)(a1 + 16));
  if (!sub_100002E38(ServiceObject, "LTHSaveDispPerfBoostEnable"))
    return 0;
  v7 = a2;
  v5 = IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 24, 1, &v7);
  sub_1000031AC("request_disp_perf_boost( %d) -> %d\n", a2, v5);
  return v5;
}

double sub_100002D4C(uint64_t a1, uint64_t a2)
{
  double result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  result = *(double *)(a2 + 32);
  *(double *)(a1 + 32) = result;
  return result;
}

float sub_100002D68(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  uint64_t i;
  float result;

  v2 = 0;
  v3 = a2 + 13;
  *a1 = *a2;
  do
  {
    v4 = &a1[v2 + 13];
    *(v4 - 12) = v3[v2 - 12];
    *v4 = v3[v2++];
  }
  while (v2 != 3);
  for (i = 4; i != 13; ++i)
  {
    result = *(float *)&a2[i];
    *(float *)&a1[i] = result;
  }
  return result;
}

uint64_t sub_100002DBC(uint64_t result)
{
  if ((result - 1) >= 9)
    return 0;
  else
    return result;
}

float sub_100002DCC(uint64_t a1, uint64_t a2)
{
  int v2;
  float result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v2 = *(_DWORD *)(a2 + 8);
  if ((v2 - 1) >= 9)
    v2 = 0;
  *(_DWORD *)(a1 + 8) = v2;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 + 12);
  *(_QWORD *)(a1 + 28) = *(_QWORD *)(a2 + 28);
  result = *(float *)(a2 + 36);
  *(float *)(a1 + 36) = result;
  return result;
}

uint64_t sub_100002E24(int a1, int a2)
{
  return (a1 + a2 - 1) & -a2;
}

const __CFString *sub_100002E38(io_registry_entry_t a1, const char *a2)
{
  const __CFString *result;
  const __CFString *v4;
  const __CFNumber *CFProperty;
  unsigned int valuePtr;

  result = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (result)
  {
    v4 = result;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, result, kCFAllocatorDefault, 0);
    CFRelease(v4);
    if (CFProperty)
    {
      valuePtr = -1431655766;
      if (!CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
        valuePtr = 0;
      CFRelease(CFProperty);
      return (const __CFString *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002EE0(unsigned int a1, void **a2, _DWORD *a3)
{
  uint64_t v6;
  size_t v8;
  void *v9;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;
  mach_port_t connection;
  uint64_t v14[3];

  connection = -1431655766;
  v6 = sub_100008BB8(&connection);
  if ((_DWORD)v6)
    return v6;
  *a2 = 0;
  output = 0xAAAAAAAAAAAAAAAALL;
  input = a1;
  outputCnt = 1;
  v6 = IOConnectCallMethod(connection, 3u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!(_DWORD)v6)
  {
    v8 = output;
    *a3 = output >> 2;
    v9 = malloc_type_malloc(v8, 0x7E1A3BF7uLL);
    *a2 = v9;
    if (v9)
    {
      v14[0] = a1;
      v14[1] = (uint64_t)v9;
      v14[2] = output;
      v6 = IOConnectCallMethod(connection, 4u, v14, 3u, 0, 0, 0, 0, 0, 0);
      IOServiceClose(connection);
      if (!(_DWORD)v6)
        return v6;
      goto LABEL_4;
    }
    v6 = 3758097085;
  }
  IOServiceClose(connection);
LABEL_4:
  if (*a2)
    free(*a2);
  *a2 = 0;
  sub_10000268C("EAN read failed: 0x%X", v6);
  return v6;
}

uint64_t sub_100003040(unsigned int a1)
{
  uint64_t v2;
  uint64_t input;
  io_connect_t v5;

  v5 = -1431655766;
  v2 = sub_100008BB8(&v5);
  if (!(_DWORD)v2)
  {
    input = a1;
    v2 = IOConnectCallMethod(v5, 5u, &input, 1u, 0, 0, 0, 0, 0, 0);
    IOServiceClose(v5);
    if ((_DWORD)v2)
      sub_10000268C("EAN erase failed: 0x%X", v2);
  }
  return v2;
}

uint64_t sub_1000030D0(unsigned int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  mach_port_t connection;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  output = 0;
  connection = -1431655766;
  outputCnt = 1;
  v6 = sub_100008BB8(&connection);
  if (!(_DWORD)v6)
  {
    input[0] = a1;
    input[1] = a2;
    input[2] = 4 * a3;
    v6 = IOConnectCallMethod(connection, 2u, input, 3u, 0, 0, &output, &outputCnt, 0, 0);
    IOServiceClose(connection);
    if ((_DWORD)v6)
      sub_10000268C("EAN update failed: 0x%X", v6);
  }
  return v6;
}

void sub_1000031AC(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(5, a1, va);
  if (byte_10001470A)
  {
    vprintf(a1, va);
    fputc(10, __stdoutp);
  }
}

uint64_t sub_100003214(uint64_t a1)
{
  const char *v1;
  uint64_t *v2;
  int v4;
  uint64_t v5;

  v5 = 0;
  if (*(_BYTE *)(a1 + 24))
  {
    v1 = 0;
    v2 = &v5;
  }
  else
  {
    v2 = 0;
    if (*(_BYTE *)(a1 + 136))
      v1 = "migrate_history";
    else
      v1 = *(const char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32);
  }
  v4 = -1431655766;
  return sub_100006110(a1, 14, 1, 1, *(_QWORD *)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 40), (uint64_t)v1, "history", 4, (uint64_t)v2, (uint64_t)&v4, 0);
}

uint64_t sub_1000032B8(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  char *v5;

  v3 = 120;
  while (1)
  {
    v4 = IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 5, 0, 0);
    v5 = sub_1000059E4(v4);
    sub_1000031AC("%s: Update_BIC => %s", "update_bic", v5);
    if ((_DWORD)v4 == -536870184 || (_DWORD)v4 == -536870187)
      usleep(0xF4240u);
    else
      v1 = v4;
    if ((_DWORD)v4 != -536870184 && (_DWORD)v4 != -536870187)
      break;
    if (!--v3)
      return 3758097084;
  }
  return v1;
}

uint64_t sub_100003380(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  unsigned int v7;
  void *v8;

  v8 = 0;
  v7 = 0;
  sub_1000031AC("%s", "save_bic");
  v2 = &v8;
  if (!*(_BYTE *)(a1 + 25))
    v2 = 0;
  v3 = sub_100006110(a1, 13, 1, 1, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64), "BIC", 0, (uint64_t)v2, (uint64_t)&v7, 4096);
  v4 = (const char *)&unk_10000ACAF;
  if (*(_BYTE *)(a1 + 25))
    v5 = (const char *)&unk_10000ACAF;
  else
    v5 = "not ";
  if (!v8)
    v4 = "not ";
  sub_1000031AC("ean %spresent, membuf %sallocated\n", v5, v4);
  if (v8)
  {
    sub_1000030D0(0x64424943u, (uint64_t)v8, v7);
    free(v8);
  }
  return v3;
}

uint64_t sub_100003468(uint64_t a1)
{
  uint64_t Block;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  float v8;

  v8 = NAN;
  while (1)
  {
    Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 119, &v8, 4, 0, 0);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184)
      break;
    usleep(0xF4240u);
  }
  v4 = Block;
  if ((_DWORD)Block)
  {
    sub_1000031AC(">> BICAB read failed");
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_double(v5, "boost", v8);
      analytics_send_event("com.apple.iomfb.bicab", v6);
      xpc_release(v6);
      v4 = 0;
      sub_1000031AC("BICAB saved");
    }
    else
    {
      return 3758097084;
    }
  }
  return v4;
}

uint64_t sub_10000355C(uint64_t a1)
{
  uint64_t Block;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  unint64_t v8;
  float v9;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  v9 = NAN;
  while (1)
  {
    Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 70, &v8, 12, 0, 0);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184)
      break;
    usleep(0xF4240u);
  }
  v4 = Block;
  if ((_DWORD)Block)
  {
    sub_1000031AC(">> UA Boost read failed", v8);
  }
  else if (BYTE4(v8))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_double(v5, "uaboost", v9);
      analytics_send_event("com.apple.iomfb.uaboost", v6);
      xpc_release(v6);
      v4 = 0;
      sub_1000031AC("UA Boost saved", v8);
    }
    else
    {
      return 3758097084;
    }
  }
  else
  {
    v4 = 0;
    sub_1000031AC("UA Boost factor not valid", v8);
  }
  return v4;
}

uint64_t sub_100003674(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  const __CFData *v4;
  int v5;
  CFDataRef v6;
  __int128 v7;
  size_t v8;
  const __CFURL *v9;
  const __CFURL *v10;
  uint64_t v12;
  UInt8 *bytes[2];
  CFIndex length[2];
  char __s[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  *(_OWORD *)bytes = 0u;
  *(_OWORD *)length = 0u;
  v12 = a1;
  if (*(_BYTE *)(a1 + 25))
    return 0;
  sub_1000031AC("%s", "save_ibic");
  v3 = sub_100005C14(a1, 13, 2, 2, "iBIC", (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_100008ECC, (uint64_t)&v12);
  if (!(_DWORD)v3)
  {
    v5 = sub_100008A54(0xFFFFFFFFLL, (char *)bytes[0], length[0] - 4);
    *(_DWORD *)&bytes[0][length[0] - 4] = ~v5;
    v6 = CFDataCreateWithBytesNoCopy(0, bytes[0], length[0], kCFAllocatorNull);
    v4 = v6;
    if (v6)
    {
      *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v7;
      v30 = v7;
      v27 = v7;
      v28 = v7;
      v25 = v7;
      v26 = v7;
      v23 = v7;
      v24 = v7;
      v21 = v7;
      v22 = v7;
      v19 = v7;
      v20 = v7;
      v17 = v7;
      v18 = v7;
      *(_OWORD *)__s = v7;
      v16 = v7;
      if ((sub_100005F14((uint64_t)v6, __s, 0x100uLL) & 1) == 0)
      {
        sub_10000268C("Unable to find firmware device");
        v1 = 3758097098;
        goto LABEL_14;
      }
      sub_1000031AC("Firmware partition: %s", __s);
      v8 = strlen(__s);
      v9 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v8, 0);
      if (v9)
      {
        v10 = v9;
        v1 = AMRestorePartitionFWCommitData(v9, CFSTR("ibic"), v4, 1, 1);
        CFRelease(v10);
        if ((_DWORD)v1)
          sub_10000268C("Failed to create iBIC in firmware partition");
        else
          sub_1000031AC("iBIC created in firmware partition");
        goto LABEL_14;
      }
      sub_10000268C("Unable to generate path URL");
    }
    else
    {
      sub_10000268C("Unable to create dictionary");
    }
    v1 = 0;
    goto LABEL_14;
  }
  v1 = v3;
  v4 = 0;
LABEL_14:
  if (bytes[0])
    free(bytes[0]);
  if (v4)
    CFRelease(v4);
  return v1;
}

uint64_t sub_10000388C(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  __int128 v13;
  int v14;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  char v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v18 = 0;
  sub_1000031AC("%s", "save_recovery_lth");
  sub_100006A04(a1);
  v2 = *(unsigned __int16 *)(a1 + 140);
  if (*(_WORD *)(a1 + 140) && (v3 = *(unsigned __int16 *)(a1 + 142), *(_WORD *)(a1 + 142)) && *(_DWORD *)(a1 + 144))
  {
    v17 = -1431655766;
    v4 = *(unsigned __int8 *)(a1 + 25);
    v5 = *(_BYTE *)(a1 + 25) != 0;
    if (*(_BYTE *)(a1 + 25))
      v6 = -4096;
    else
      v6 = 0;
    v7 = v5 << 12;
    v8 = 2 * v4;
    v9 = sub_1000063D4(a1, 14, v2, v3, &v18, &v17, "recovery LTH", 2 * v4, v5 << 12);
    if ((_DWORD)v9)
    {
      v10 = v9;
      sub_1000031AC("Could not fetch bis data %s %d");
    }
    else
    {
      v11 = v17;
      if (v17 <= *(_DWORD *)(a1 + 144))
      {
        if (*(_BYTE *)(a1 + 25))
        {
          v12 = v18;
          *(_DWORD *)v18 = -2147483646;
          v12[1] = v11;
          v10 = sub_1000030D0(0x644C5448u, (uint64_t)v12, ((v7 + 4 * ((_DWORD)v11 + v8) - 1) & v6) >> 2);
          sub_1000031AC("dLTH saved to ean - ret: %d, buf_size %d, recovery.nwords %d, version %d");
        }
        else
        {
          *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v33 = v13;
          v34 = v13;
          v31 = v13;
          v32 = v13;
          v29 = v13;
          v30 = v13;
          v27 = v13;
          v28 = v13;
          v25 = v13;
          v26 = v13;
          v23 = v13;
          v24 = v13;
          v21 = v13;
          v22 = v13;
          *(_OWORD *)v19 = v13;
          v20 = v13;
          if ((sub_10000674C(v9, v19, 0x100uLL) & 1) != 0)
          {
            v14 = sub_100006B44(v18, 4 * v11, v19);
            if (v14)
            {
              v10 = 3758097098;
              strerror(v14);
              sub_1000031AC("Unable to write %s - %s");
            }
            else if (sub_10000696C())
            {
              v10 = 3758097098;
              sub_1000031AC("Unable to commit BIS.", v16);
            }
            else
            {
              v10 = 0;
            }
          }
          else
          {
            v10 = 3758097098;
            sub_1000031AC("Unable to find BIS device", v16);
          }
        }
      }
      else
      {
        v10 = 3758097098;
        sub_1000031AC("Read %X words, expected %X");
      }
    }
  }
  else
  {
    sub_1000031AC("Params missing in %s", "save_recovery_lth");
    v10 = 3758097084;
  }
  if (v18)
    free(v18);
  return v10;
}

uint64_t sub_100003AF0(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t Block;
  uint64_t v6;
  time_t v7;
  uint64_t v8;
  int v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  int v18;
  unsigned __int16 *v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  int v24;
  xpc_object_t v25;
  void *v26;
  __int16 v28;
  time_t v29;
  int v30;
  unsigned __int16 v31;
  int v32;
  unsigned __int16 v33;
  int v34;
  unsigned __int16 v35;
  int v36;
  _DWORD __b[162];
  _OWORD v38[2];
  _OWORD v39[2];

  v36 = -1431655766;
  if ((MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw")) & 1) == 0)
  {
    memset(__b, 170, sizeof(__b));
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38[0] = v3;
    v38[1] = v3;
    v39[0] = v3;
    v39[1] = v3;
    while (1)
    {
      Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 16, __b, 648, 0, 0);
      if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184)
        break;
      usleep(0xF4240u);
    }
    v6 = Block;
    if ((_DWORD)Block)
    {
      sub_1000031AC(">> burn in metric read failed.");
      return v6;
    }
    v6 = 3758097098;
    v28 = 16897;
    v7 = time(0);
    v29 = v7;
    v30 = __b[1];
    v31 = __b[2];
    v32 = *(_DWORD *)((char *)&__b[2] + 2);
    v33 = HIWORD(__b[3]);
    v34 = __b[4];
    v35 = __b[5];
    v8 = sub_100008A54(0xFFFFFFFFLL, (char *)&v28, 28);
    v9 = ~(_DWORD)v8;
    v36 = ~(_DWORD)v8;
    v10 = sub_100007120(v8, "min", 0, (unsigned __int16)v30);
    v11 = sub_100007120(v10, "min", 1u, HIWORD(v30));
    v12 = sub_100007120(v11, "min", 2u, v31);
    v13 = sub_100007120(v12, "median", 0, (unsigned __int16)v32);
    v14 = sub_100007120(v13, "median", 1u, HIWORD(v32));
    v15 = sub_100007120(v14, "median", 2u, v33);
    v16 = sub_100007120(v15, "max", 0, (unsigned __int16)v34);
    v17 = sub_100007120(v16, "max", 1u, HIWORD(v34));
    sub_100007120(v17, "max", 2u, v35);
    if (!*(_BYTE *)(a1 + 116))
    {
      sub_1000031AC("Unable to connect to BIM storage");
      return v6;
    }
    sub_1000031AC("IOMFB: BIMUpdaterStartUpdate ");
    if (!BIMUpdaterStartUpdate(*(_QWORD *)(a1 + 120)))
    {
      v2 = 3758097098;
      sub_1000031AC("Unable to begin BIM update");
LABEL_38:
      sub_1000031AC("IOMFB: BIMUpdaterEndUpdate ");
      if ((BIMUpdaterEndUpdate(*(_QWORD *)(a1 + 120)) & 1) != 0)
        return v2;
      sub_1000031AC("Unable to end BIM update");
      return v6;
    }
    v18 = sub_100006F74(a1, 0, (char *)v38);
    v19 = (unsigned __int16 *)v39;
    v20 = sub_100006F74(a1, 1uLL, (char *)v39);
    sub_1000031AC("Writing BIM with timestamp %llu : %d %d : %08x", v7, v18 == 0, v20 == 0, v9);
    if (v20 | v18)
    {
      if (v18)
      {
        v21 = sub_10000709C(a1, 0, (uint64_t)&v28);
        v2 = v21;
        if (v20)
        {
          if (!(_DWORD)v21)
          {
            v2 = sub_10000709C(a1, 1uLL, (uint64_t)&v28);
            goto LABEL_34;
          }
LABEL_37:
          sub_1000031AC("Unable to write BIM to storage");
          goto LABEL_38;
        }
LABEL_26:
        v23 = HIWORD(v34) - v19[12];
        if (v23 <= v35 - v19[13])
          v23 = v35 - v19[13];
        if ((unsigned __int16)v34 - v19[11] <= v23)
          v24 = v23;
        else
          v24 = (unsigned __int16)v34 - v19[11];
        if (v24 >= 0x1F5)
        {
          sub_1000031AC("Max BIM delta above threshold or below 0");
          v25 = xpc_dictionary_create(0, 0, 0);
          if (!v25)
          {
            v2 = 3758097084;
            goto LABEL_37;
          }
          v26 = v25;
          xpc_dictionary_set_int64(v25, "max_bim_delta", v24);
          analytics_send_event("com.apple.iomfb.bics-data-health", v26);
          xpc_release(v26);
        }
LABEL_34:
        if (!(_DWORD)v2)
          goto LABEL_38;
        goto LABEL_37;
      }
      v19 = (unsigned __int16 *)v38;
      v22 = 1;
    }
    else
    {
      v22 = *(_QWORD *)((char *)v38 + 2) > *(_QWORD *)((char *)v39 + 2);
      if (*(_QWORD *)((char *)v38 + 2) > *(_QWORD *)((char *)v39 + 2))
        v19 = (unsigned __int16 *)v38;
    }
    v2 = sub_10000709C(a1, v22, (uint64_t)&v28);
    goto LABEL_26;
  }
  return 0;
}

uint64_t sub_100003EEC(uint64_t a1)
{
  uint64_t Block;
  uint64_t v4;
  unsigned int v5;
  _DWORD __b[902];

  memset(__b, 170, sizeof(__b));
  while (1)
  {
    Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 19, __b, 3608, 0, 0);
    if ((_DWORD)Block != -536870187 && (_DWORD)Block != -536870184)
      break;
    usleep(0x3D090u);
  }
  v4 = Block;
  if ((_DWORD)Block)
  {
    sub_1000031AC(">> tiled BIM read failed.");
  }
  else if (__b[0] == 2)
  {
    if (__b[1])
    {
      v5 = 0;
      while (1)
      {
        LOBYTE(Block) = sub_1000071C0(Block, 0, (uint64_t)__b, v5);
        if ((Block & 1) == 0)
          return 3758097084;
        if (++v5 >= __b[1])
          goto LABEL_14;
      }
    }
    else
    {
LABEL_14:
      sub_1000031AC("TBIM saved");
      return 0;
    }
  }
  else
  {
    v4 = 3758097084;
    sub_1000031AC(">> unexpected tbim version (wanted 2, got %d)");
  }
  return v4;
}

double sub_100004004(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 25) = 0;
  *(_QWORD *)a1 = off_100010638;
  *(_BYTE *)(a1 + 29) = 0;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)off_1000106B8;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)off_1000106C8;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)off_1000106D8;
  result = COERCE_DOUBLE("unsecure_history");
  *(_OWORD *)(a1 + 32) = *(_OWORD *)off_100010698;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)off_1000106A8;
  *(_DWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_WORD *)(a1 + 136) = 0;
  return result;
}

uint64_t sub_100004050(uint64_t a1)
{
  *(_QWORD *)a1 = off_100010638;
  if (*(_QWORD *)(a1 + 120))
  {
    BIMUpdaterCancel();
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 128), 0xFFFFFFFFFFFFFFFFLL);
    CFRelease(*(CFTypeRef *)(a1 + 120));
  }
  return a1;
}

void sub_1000040A0(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL sub_1000040B4(uint64_t a1)
{
  io_registry_entry_t ServiceObject;
  _BOOL8 result;

  ServiceObject = IOMobileFramebufferGetServiceObject(*(_QWORD *)(a1 + 16));
  result = sub_1000040E8(ServiceObject, "TBICSSupported");
  *(_BYTE *)(a1 + 137) = result;
  return result;
}

BOOL sub_1000040E8(io_registry_entry_t a1, const char *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFBoolean *CFProperty;
  _BOOL8 v6;

  v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v3)
    return 0;
  v4 = v3;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, v3, kCFAllocatorDefault, 0);
  CFRelease(v4);
  if (!CFProperty)
    return 0;
  v6 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(CFProperty);
  return v6;
}

uint64_t sub_100004178(uint64_t a1, uint64_t a2, char a3)
{
  io_registry_entry_t ServiceObject;
  uint64_t v6;
  uint64_t v7;
  io_registry_entry_t v8;
  uint64_t result;
  _QWORD v10[5];
  _QWORD v11[5];

  *(_QWORD *)(a1 + 16) = a2;
  ServiceObject = IOMobileFramebufferGetServiceObject(a2);
  *(_DWORD *)(a1 + 112) = sub_100002E38(ServiceObject, "bics_mode");
  bzero((void *)(a1 + 140), 8uLL);
  *(_BYTE *)(a1 + 116) = 0;
  if ((a3 & 1) != 0)
    goto LABEL_3;
  *(_QWORD *)(a1 + 128) = dispatch_semaphore_create(0);
  v10[4] = a1;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  v11[2] = sub_100004290;
  v11[3] = &unk_1000106E8;
  v11[4] = a1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = sub_1000042A0;
  v10[3] = &unk_100010708;
  *(_QWORD *)(a1 + 120) = BIMUpdaterCreate(&_dispatch_main_q, v11, v10);
  v6 = BIMUpdaterActivate();
  if ((v6 & 1) != 0)
  {
LABEL_3:
    v7 = sub_100002600(v6, CFSTR("ean-storage-present"));
    *(_BYTE *)(a1 + 25) = v7;
    *(_BYTE *)(a1 + 24) = sub_100002600(v7, CFSTR("display-storage-present"));
    v8 = IOMobileFramebufferGetServiceObject(*(_QWORD *)(a1 + 16));
    *(_BYTE *)(a1 + 137) = sub_1000040E8(v8, "TBICSSupported");
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a1 + 120) = 0;
  }
  return result;
}

uint64_t sub_100004290(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 116) = 1;
  return result;
}

intptr_t sub_1000042A0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v1 + 116) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 128));
}

uint64_t sub_1000042B0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 25) && *(_BYTE *)(a1 + 26))
  {
    sub_1000032B8(a1);
    *(_BYTE *)(a1 + 26) = 0;
  }
  return 0;
}

uint64_t sub_1000042EC(_BYTE *a1, const std::__fs::filesystem::path *a2, const char *a3)
{
  sub_1000043A8((uint64_t)a1, a2, a3);
  sub_100004654((uint64_t)a1);
  if (byte_100014709)
    sub_10000492C((uint64_t)a1);
  if (sub_100004984((uint64_t)a1))
  {
    sub_1000031AC("Failed to load LTH");
    return 0;
  }
  if (a1[137] && sub_100004B0C((uint64_t)a1))
  {
    sub_1000031AC("Failed to upload TBICS LTH");
    return 0;
  }
  if (a1[26])
  {
    sub_100004CEC((uint64_t)a1);
    sub_100003214((uint64_t)a1);
    if (a1[29])
      sub_100004D80((uint64_t)a1);
  }
  else
  {
    sub_100004EE8((uint64_t)a1);
  }
  sub_100004CEC((uint64_t)a1);
  return 1;
}

uint64_t sub_1000043A8(uint64_t a1, const std::__fs::filesystem::path *a2, const char *a3)
{
  timespec v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char v14;
  char v15;
  std::error_code *v16;
  uint64_t v17;
  char v19;
  stat v20;
  stat v21;
  char to[16];
  timespec v23;
  timespec v24;
  timespec v25;
  timespec v26;
  timespec v27;
  timespec v28;
  timespec v29;
  timespec v30;
  timespec v31;
  timespec v32;
  timespec v33;
  timespec v34;
  timespec v35;
  timespec v36;
  timespec v37;
  char __str[16];
  timespec v39;
  timespec v40;
  timespec v41;
  timespec v42;
  timespec v43;
  timespec v44;
  timespec v45;
  timespec v46;
  timespec v47;
  timespec v48;
  timespec v49;
  timespec v50;
  timespec v51;
  timespec v52;
  timespec v53;

  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v52 = v6;
  v53 = v6;
  v50 = v6;
  v51 = v6;
  v48 = v6;
  v49 = v6;
  v46 = v6;
  v47 = v6;
  v44 = v6;
  v45 = v6;
  v42 = v6;
  v43 = v6;
  v40 = v6;
  v41 = v6;
  *(timespec *)__str = v6;
  v39 = v6;
  v36 = v6;
  v37 = v6;
  v34 = v6;
  v35 = v6;
  v32 = v6;
  v33 = v6;
  v30 = v6;
  v31 = v6;
  v28 = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  *(timespec *)to = v6;
  v23 = v6;
  *(timespec *)&v21.st_blksize = v6;
  *(timespec *)v21.st_qspare = v6;
  v21.st_birthtimespec = v6;
  *(timespec *)&v21.st_size = v6;
  v21.st_mtimespec = v6;
  v21.st_ctimespec = v6;
  *(timespec *)&v21.st_uid = v6;
  v21.st_atimespec = v6;
  *(timespec *)v20.st_qspare = v6;
  *(timespec *)&v21.st_dev = v6;
  *(timespec *)&v20.st_size = v6;
  *(timespec *)&v20.st_blksize = v6;
  v20.st_ctimespec = v6;
  v20.st_birthtimespec = v6;
  v20.st_atimespec = v6;
  v20.st_mtimespec = v6;
  *(timespec *)&v20.st_dev = v6;
  *(timespec *)&v20.st_uid = v6;
  if (stat((const char *)a2, &v21) < 0 || stat(a3, &v20) < 0)
    return 0;
  sub_1000031AC("Daemon migrating from %s to %s", (const char *)a2, a3);
  v7 = 0;
  v19 = 1;
  do
  {
    if (v7 != 2)
    {
      v8 = 0;
      v9 = 1;
      do
      {
        v10 = v9;
        v11 = a1 + 16 * v7 + 8 * v8;
        snprintf(__str, 0x100uLL, "%s/%s", (const char *)a2, *(const char **)(v11 + 32));
        snprintf(to, 0x100uLL, "%s/%s", a3, *(const char **)(v11 + 32));
        if ((stat(__str, &v21) & 0x80000000) == 0)
        {
          if (stat(to, &v20))
          {
            sub_1000031AC("Daemon copying from %s to %s", __str, to);
            if (copyfile(__str, to, 0, 0xAu) < 0)
            {
              sub_1000031AC("Daemon copying from %s to %s failed", __str, to);
              v19 = 0;
            }
          }
        }
        v9 = 0;
        v8 = 1;
      }
      while ((v10 & 1) != 0);
    }
    ++v7;
  }
  while (v7 != 5);
  if ((v19 & 1) != 0)
  {
    for (i = 0; i != 5; ++i)
    {
      v13 = 0;
      v14 = 1;
      do
      {
        v15 = v14;
        snprintf(__str, 0x100uLL, "%s/%s", (const char *)a2, *(const char **)(a1 + 16 * i + 8 * v13 + 32));
        if ((stat(__str, &v21) & 0x80000000) == 0)
        {
          sub_1000031AC("Daemon unlinking %s", __str);
          unlink(__str);
        }
        v14 = 0;
        v13 = 1;
      }
      while ((v15 & 1) != 0);
    }
    remove(a2, v16);
    v17 = 0;
    sub_1000031AC("Daemon migrating completed");
  }
  else
  {
    v17 = 0xFFFFFFFFLL;
    sub_1000031AC("Daemon migrating failed");
  }
  return v17;
}

void sub_100004654(uint64_t a1)
{
  timespec v2;
  int v3;
  int v4;
  int v5;
  void *v6;
  unsigned int v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  stat v12;
  _DWORD v13[20];
  __int128 v14;
  __int128 size;
  __int128 v16;
  unint64_t v17;
  _OWORD v18[12];
  timespec v19;

  if (byte_100014708)
    return;
  v14 = unk_10000FBC8;
  size = xmmword_10000FBD8;
  v16 = unk_10000FBE8;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  v18[11] = v2;
  v19 = v2;
  v18[9] = v2;
  v18[10] = v2;
  v18[7] = v2;
  v18[8] = v2;
  v18[5] = v2;
  v18[6] = v2;
  v18[3] = v2;
  v18[4] = v2;
  v18[1] = v2;
  v18[2] = v2;
  v18[0] = v2;
  *(timespec *)&v12.st_dev = v2;
  *(timespec *)&v12.st_uid = v2;
  v12.st_atimespec = v2;
  v12.st_mtimespec = v2;
  v12.st_ctimespec = v2;
  v12.st_birthtimespec = v2;
  *(timespec *)&v12.st_size = v2;
  *(timespec *)&v12.st_blksize = v2;
  *(timespec *)v12.st_qspare = v2;
  memset(v13, 170, sizeof(v13));
  v11 = -1431655766;
  if (!stat("force_panel_reset", &v12) && (__int16)v12.st_mode < 0)
  {
    if (unlink("force_panel_reset"))
    {
      sub_10000268C("Could not delete %s; skipping reset\n", "force_panel_reset");
      return;
    }
    v6 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  if (IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 32, v18, 208, 0, 0))
    return;
  v3 = open(*(const char **)(a1 + 64), 0);
  if (v3 < 0)
    return;
  v4 = v3;
  if (read(v3, &v11, 4uLL) != 4)
    goto LABEL_30;
  v5 = v11;
  if (v11 == 1112097568)
  {
    if (read(v4, v13, 4uLL) != 4)
      goto LABEL_30;
    v5 = v13[0];
  }
  else
  {
    v13[0] = v11;
  }
  v7 = v5 - 1;
  if (v7 >= 4)
  {
    sub_1000031AC("unknown BIC header version; panelID verification skipped");
    goto LABEL_30;
  }
  v8 = *(_QWORD *)&aD[8 * v7];
  if (v8 != read(v4, &v13[1], v8))
    goto LABEL_30;
  if ((_DWORD)size != HIDWORD(v19.tv_nsec))
  {
    v6 = 0;
    goto LABEL_14;
  }
  v9 = malloc_type_malloc(size, 0x75FC76A9uLL);
  if (!v9)
  {
LABEL_30:
    close(v4);
    return;
  }
  v6 = v9;
  v10 = size;
  if (read(v4, v9, size) != v10 || !memcmp(v6, (char *)v18 + 4, HIDWORD(v19.tv_nsec)))
  {
    close(v4);
LABEL_20:
    free(v6);
    return;
  }
LABEL_14:
  sub_1000031AC("new panel detected; invalidate stored LTH & BIC");
  if (*(_BYTE *)(a1 + 24))
    sub_100005064();
  else
    unlink(*(const char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32));
  unlink(*(const char **)(a1 + 64));
  sub_100005258(a1);
  if (*(_BYTE *)(a1 + 25))
    sub_100003040(0x64424943u);
  *(_BYTE *)(a1 + 26) = 1;
  close(v4);
  if (v6)
    goto LABEL_20;
}

uint64_t sub_10000492C(uint64_t a1)
{
  uint64_t v1;
  char *v2;

  v1 = IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 18, 0, 0);
  v2 = sub_1000059E4(v1);
  sub_1000031AC("%s: Update_BIC => %s", "enable_headless_migration", v2);
  return v1;
}

uint64_t sub_100004984(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  _BYTE v5[8];
  int v6;
  const mach_header_64 *v7;
  int v8;

  if (!*(_BYTE *)(a1 + 26))
  {
    if (*(_BYTE *)(a1 + 24))
    {
      if (!sub_100005808(a1, 0x4C544820u, 1, 1, 14, 1, "history"))
        return 0;
    }
    else if (!sub_10000570C(a1, *(char **)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 32), 1, 1, 14, 1, "history"))
    {
      return 0;
    }
    if (sub_100006C44(a1))
      goto LABEL_2;
    return 0;
  }
LABEL_2:
  v8 = 1;
  v7 = &_mh_execute_header;
  bzero(v5, 0xFBCuLL);
  sub_1000031AC("%s: upload empty history", "upload_history");
  v6 = 0;
  v2 = IOMobileFramebufferSetBlock(*(_QWORD *)(a1 + 16), 14, v5, 4028, &v7, 3);
  v3 = sub_1000059E4(v2);
  sub_1000031AC("%s: set block[0] => %s", "upload_history", v3);
  if ((_DWORD)v2 != -536870201 && (_DWORD)v2 != -536870174 && (_DWORD)v2)
    sub_10000268C("uploading empty history failed.");
  return v2;
}

uint64_t sub_100004B0C(uint64_t a1)
{
  const char *v2;
  int v3;
  int v4;
  timespec v5;
  uint64_t v6;
  xpc_object_t v7;
  const void *data;
  unsigned int st_size;
  __n128 v10;
  ssize_t v11;
  stat v13;
  xpc_object_t v14;
  void *v15;
  int v16;

  v2 = *(const char **)(a1 + 96);
  v16 = -1431655766;
  v14 = 0;
  v15 = 0;
  v3 = open(v2, 0);
  v4 = v3;
  if ((v3 & 0x80000000) == 0)
  {
    v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v13.st_blksize = v5;
    *(timespec *)v13.st_qspare = v5;
    v13.st_birthtimespec = v5;
    *(timespec *)&v13.st_size = v5;
    v13.st_mtimespec = v5;
    v13.st_ctimespec = v5;
    *(timespec *)&v13.st_uid = v5;
    v13.st_atimespec = v5;
    *(timespec *)&v13.st_dev = v5;
    if (fstat(v3, &v13))
    {
      v6 = 3758097084;
      sub_1000031AC("%s: Could not stat %s", "upload_tbics_history", v2);
      close(v4);
      return v6;
    }
    st_size = v13.st_size;
    if ((sub_100006570(v13.st_size, (uint64_t *)&v15, &v16) & 1) != 0)
    {
LABEL_10:
      v11 = read(v4, v15, st_size);
      close(v4);
      if (v11 < st_size)
      {
        v6 = 3758097084;
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_12:
    close(v4);
    v6 = 3758097085;
    goto LABEL_15;
  }
  *(_QWORD *)&v13.st_dev = 0xAAAAAAAAAAAAAAAALL;
  if (sub_100005908(0x544C5448u, &v14) || (v7 = v14) == 0)
  {
    v6 = 3758097084;
    sub_1000031AC("%s: Could not read dstore", "upload_tbics_history");
    return v6;
  }
  data = xpc_dictionary_get_data(v14, "content", (size_t *)&v13);
  st_size = v13.st_dev;
  if ((sub_100006570(v13.st_dev, (uint64_t *)&v15, &v16) & 1) == 0)
    goto LABEL_12;
  if (!data)
    goto LABEL_10;
  memcpy(v15, data, st_size);
  xpc_release(v7);
  close(v4);
LABEL_14:
  v6 = sub_1000065E0(*(_QWORD *)(a1 + 16), 129, (uint64_t)v15, st_size, "TBICS LTH", 0, v10);
LABEL_15:
  if (v15)
    free(v15);
  return v6;
}

uint64_t sub_100004CEC(uint64_t a1)
{
  __int128 v2;
  int v3;
  uint64_t result;
  _OWORD v7[3];
  unint64_t v8;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = v2;
  v7[2] = v2;
  v7[0] = v2;
  v3 = 79;
  do
  {
    usleep(0x3D090u);
    result = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 17, v7, 56, 0, 0);
    if ((_DWORD)result)
      break;
    if (LODWORD(v7[0]) != 1 || BYTE8(v7[0]) == 0)
      break;
  }
  while ((HIDWORD(v7[0]) & 0xFFFFFFFD) != 0 && v3-- != 0);
  return result;
}

uint64_t sub_100004D80(uint64_t a1)
{
  uint64_t v1;
  const char *v2;
  __n128 v4;
  uint64_t v5;
  FILE *v6;
  FILE *v7;
  FILE *v8;
  FILE *v10[3];
  void *__ptr;
  int v12;

  v1 = 3758097084;
  v12 = -1431655766;
  __ptr = 0;
  v2 = "not ";
  if (!*(_BYTE *)(a1 + 25))
    goto LABEL_19;
  if (sub_100006570(7856, (uint64_t *)&__ptr, &v12))
  {
    v5 = sub_1000065E0(*(_QWORD *)(a1 + 16), 129, (uint64_t)__ptr, 7856, "TBICS LTH", 1, v4);
    if (!(_DWORD)v5)
    {
      v6 = *(FILE **)(a1 + 96);
      v7 = *(FILE **)(a1 + 104);
      v10[1] = v7;
      v10[2] = v6;
      v8 = fopen((const char *)v7, "w");
      v10[0] = v8;
      if (v8)
      {
        if (fwrite(__ptr, 1uLL, 0x1EB0uLL, v8))
        {
          if (sub_1000062A0((uint64_t)v10))
          {
            sub_10000515C(0x544C5448u, __ptr, 0x7ACu);
            v1 = 0;
          }
          goto LABEL_11;
        }
      }
      else
      {
        sub_10000268C("Could not open temp file %s", (const char *)v7);
      }
      sub_10000636C((uint64_t)v10);
LABEL_11:
      if (v10[0])
        fclose(v10[0]);
      v5 = v1;
    }
  }
  else
  {
    v5 = 3758097085;
  }
  if (__ptr)
    free(__ptr);
  if (!(_DWORD)v5)
    v2 = (const char *)&unk_10000ACAF;
  v1 = v5;
LABEL_19:
  sub_1000031AC("TBICS LTH %ssaved", v2);
  return v1;
}

void sub_100004ED0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10)
    fclose(a10);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100004EE8(uint64_t a1)
{
  __int128 v3;
  BOOL v4;
  BOOL v5;
  int v7;
  char *v8;
  _OWORD v9[3];
  unint64_t v10;
  int v11;

  if (!*(_BYTE *)(a1 + 26))
  {
    if (!*(_BYTE *)(a1 + 25))
      goto LABEL_19;
    v10 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9[1] = v3;
    v9[2] = v3;
    v9[0] = v3;
    v4 = !IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 17, v9, 56, 0, 0)
      && LODWORD(v9[0]) == 1;
    v5 = !v4 || BYTE8(v9[0]) == 0;
    if (!v5 && BYTE9(v9[0]) == 0)
    {
LABEL_19:
      if (sub_10000570C(a1, *(char **)(a1 + 64), 1, 1, 13, 0, "BIC"))
      {
        v11 = 0;
        bzero(v9, 0xFBCuLL);
        sub_100004CEC(a1);
        v7 = IOMobileFramebufferSetBlock(*(_QWORD *)(a1 + 16), 13, v9, 4028, &v11, 1);
        v8 = sub_1000059E4(v7);
        sub_1000031AC("%s: upload empty bic => %s", "upload_bic", v8);
      }
    }
  }
  return 0;
}

uint64_t sub_100004FEC(xpc_connection_t *a1)
{
  NSObject *v2;
  _xpc_connection_s *mach_service;

  v2 = dispatch_queue_create("com.apple.disp.store.client", 0);
  mach_service = xpc_connection_create_mach_service("display_storage_service", v2, 0);
  *a1 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &stru_100010748);
    xpc_connection_resume(*a1);
    return 0;
  }
  else
  {
    sub_1000031AC("Couldn't find Display Storage driver");
    return 5;
  }
}

uint64_t sub_100005064()
{
  uint64_t v0;
  xpc_object_t v1;
  _xpc_connection_s *v2;
  xpc_connection_t v4;

  v4 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  v0 = sub_100004FEC(&v4);
  if (!(_DWORD)v0)
  {
    v1 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v1, "command", "erase");
    v2 = v4;
    sub_1000050F8(v4, v1);
    xpc_release(v1);
    xpc_connection_cancel(v2);
    xpc_release(v2);
  }
  return v0;
}

intptr_t sub_1000050F8(_xpc_connection_s *a1, void *a2)
{
  xpc_connection_send_message(a1, a2);
  if (qword_1000146F8 != -1)
    dispatch_once(&qword_1000146F8, &stru_1000109B8);
  xpc_connection_send_barrier(a1, &stru_1000109F8);
  return dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000146F0, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000515C(unsigned int a1, const void *a2, unsigned int a3)
{
  uint64_t v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  xpc_connection_t v10;

  v10 = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  v6 = sub_100004FEC(&v10);
  if (!(_DWORD)v6)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "command", "write");
    xpc_dictionary_set_uint64(v7, "key", a1);
    xpc_dictionary_set_data(v7, "content", a2, 4 * a3);
    v8 = v10;
    sub_1000050F8(v10, v7);
    xpc_release(v7);
    xpc_connection_cancel(v8);
    xpc_release(v8);
  }
  return v6;
}

uint64_t sub_100005230(uint64_t a1, unsigned int a2)
{
  return *(_QWORD *)(a1 + 8 * a2 + 64);
}

uint64_t sub_10000523C(uint64_t a1, unsigned int a2)
{
  return *(_QWORD *)(a1 + 16 * (*(_DWORD *)(a1 + 112) != 0) + 8 * a2 + 32);
}

void sub_100005258(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  size_t v7;
  void *v8;
  void *v9;
  char v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (*(_BYTE *)(a1 + 25))
  {
    sub_100003040(0x644C5448u);
  }
  else
  {
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v2;
    v25 = v2;
    v22 = v2;
    v23 = v2;
    v20 = v2;
    v21 = v2;
    v18 = v2;
    v19 = v2;
    v16 = v2;
    v17 = v2;
    v14 = v2;
    v15 = v2;
    v12 = v2;
    v13 = v2;
    *(_OWORD *)v10 = v2;
    v11 = v2;
    sub_100006A04(a1);
    if (*(_WORD *)(a1 + 140))
    {
      v4 = *(unsigned int *)(a1 + 144);
      if ((sub_10000674C(v3, v10, 0x100uLL) & 1) != 0)
      {
        v5 = open(v10, 1);
        if (v5 < 0)
        {
          sub_1000031AC("Unable to open DR LTH");
        }
        else
        {
          v6 = v5;
          if (fcntl(v5, 48, 1) < 0)
          {
            sub_1000031AC("Failed to set F_NOCACHE");
          }
          else
          {
            v7 = 4 * v4;
            v8 = malloc_type_malloc(v7, 0x60020BB1uLL);
            if (v8)
            {
              v9 = v8;
              bzero(v8, v7);
              write(v6, v9, v7);
              free(v9);
            }
          }
          close(v6);
        }
      }
      else
      {
        sub_1000031AC("Unable to find BIS device");
      }
    }
  }
}

uint64_t sub_1000053F0()
{
  uint64_t v1;
  size_t v2;
  size_t v3;

  v3 = 128;
  if (sysctlbyname("hw.target", byte_100014260, &v3, 0, 0))
    return 0xFFFFFFFFLL;
  v1 = 0;
  v2 = v3 + 1;
  while (strncmp(byte_100014260, off_100010768[v1], v2))
  {
    if (++v1 == 20)
      return 4;
  }
  return 5;
}

uint64_t sub_100005494(uint64_t a1, void (***a2)(_QWORD), int a3, int a4, int a5, uint64_t a6, int a7, const char *a8)
{
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v24;
  void (***v25)(_QWORD);
  const char *v26;
  char v27[8];
  unsigned int v28;
  _DWORD v29[3];

  v29[0] = 0;
  v29[1] = a4;
  v29[2] = a5;
  if (a7)
    v13 = 3;
  else
    v13 = 1;
  bzero(v27, 0xFBCuLL);
  v14 = *(unsigned __int8 *)(a1 + 136);
  sub_1000031AC("%s (%s)", "upload_reader", a8);
  if (a3 < 1024 || (a3 & 3) != 0)
  {
    sub_1000031AC("%s: bad file size (%d) for %s", "upload_reader", a3, a8);
    v22 = 3758097084;
LABEL_21:
    sub_10000268C("uploading %s failed.", a8);
  }
  else
  {
    v25 = a2;
    v26 = a8;
    v15 = 0;
    v16 = v14 << 30;
    v17 = a3 >> 2;
    v18 = ((a3 >> 2) + 999) / 0x3E8;
    v28 = v17;
    v19 = 1000;
    v24 = v17;
    while (2)
    {
      if (v15 == v18)
      {
        sub_1000031AC("%s: Upload of %s successful", "upload_reader", v26);
      }
      else
      {
        v29[0] = v15 | v16;
        if (v18 == v15 + 1)
          v19 = v17 - v15 * v19;
        (**a2)(a2);
        v20 = 15;
        while (1)
        {
          v21 = IOMobileFramebufferSetBlock(*(_QWORD *)(a1 + 16), a6, v27, 4028, v29, v13);
          v22 = v21;
          if (v15 || (_DWORD)v21 != -536870187)
            break;
          usleep(0xF4240u);
          if (!--v20)
          {
            v22 = 3758097109;
LABEL_20:
            sub_1000031AC("%s: bad return stat %X", "upload_reader", v22);
            a8 = v26;
            goto LABEL_21;
          }
        }
        if (v15 || (_DWORD)v21 != -536870174)
        {
          ++v15;
          a2 = v25;
          v17 = v24;
          v16 = v14 << 30;
          if (!(_DWORD)v21)
            continue;
          goto LABEL_20;
        }
      }
      return 0;
    }
  }
  return v22;
}

uint64_t sub_1000056D8(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, const char *a8)
{
  uint64_t (**v9)();
  int v10;
  int v11;

  v9 = &off_100010A28;
  v11 = -1431655766;
  v10 = a2;
  return sub_100005494(a1, (void (***)(_QWORD))&v9, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10000570C(uint64_t a1, char *a2, int a3, int a4, uint64_t a5, int a6, const char *a7)
{
  uint64_t v13;
  int v14;
  int v15;
  timespec v16;
  stat v18;
  uint64_t (**v19)();
  int v20;
  int v21;

  v13 = 3758097084;
  v14 = open(a2, 0);
  if ((v14 & 0x80000000) == 0)
  {
    v15 = v14;
    v16.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v16.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v18.st_blksize = v16;
    *(timespec *)v18.st_qspare = v16;
    v18.st_birthtimespec = v16;
    *(timespec *)&v18.st_size = v16;
    v18.st_mtimespec = v16;
    v18.st_ctimespec = v16;
    *(timespec *)&v18.st_uid = v16;
    v18.st_atimespec = v16;
    *(timespec *)&v18.st_dev = v16;
    if (fstat(v14, &v18))
    {
      sub_1000031AC("%s: Could not stat %s", "upload_file", a7);
    }
    else
    {
      v19 = &off_100010A28;
      v21 = -1431655766;
      v20 = v15;
      v13 = sub_100005494(a1, (void (***)(_QWORD))&v19, v18.st_size, a3, a4, a5, a6, a7);
    }
    close(v15);
  }
  return v13;
}

uint64_t sub_100005808(uint64_t a1, unsigned int a2, int a3, int a4, uint64_t a5, int a6, const char *a7)
{
  xpc_object_t v13;
  void (**data)(_QWORD);
  uint64_t v15;
  void (**v17[2])(_QWORD);
  int v18;
  int v19;
  size_t length;
  xpc_object_t xdict;

  length = 0xAAAAAAAAAAAAAAAALL;
  xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  if (sub_100005908(a2, &xdict) || (v13 = xdict) == 0)
  {
    sub_1000031AC("%s: Could not read dstore", "upload_dstore");
    return 3758097084;
  }
  else
  {
    data = (void (**)(_QWORD))xpc_dictionary_get_data(xdict, "content", &length);
    v19 = -1431655766;
    length >>= 2;
    v17[0] = (void (**)(_QWORD))&off_100010A68;
    v17[1] = data;
    v18 = length;
    v15 = sub_100005494(a1, v17, 4 * (int)length, a3, a4, a5, a6, a7);
    xpc_release(v13);
  }
  return v15;
}

uint64_t sub_100005908(unsigned int a1, xpc_object_t *a2)
{
  uint64_t result;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  xpc_connection_t connection;

  connection = (xpc_connection_t)0xAAAAAAAAAAAAAAAALL;
  result = sub_100004FEC(&connection);
  if (!(_DWORD)result)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "command", "read");
    xpc_dictionary_set_uint64(v5, "key", a1);
    v6 = connection;
    *a2 = xpc_connection_send_message_with_reply_sync(connection, v5);
    xpc_release(v5);
    xpc_connection_cancel(v6);
    xpc_release(v6);
    if (xpc_get_type(*a2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      return 0;
    }
    else
    {
      xpc_release(*a2);
      *a2 = 0;
      return 5;
    }
  }
  return result;
}

char *sub_1000059E4(int a1)
{
  uint64_t v1;
  char *v2;

  v1 = 0;
  while (dword_1000108C8[v1] != a1)
  {
    v1 += 4;
    if (v1 == 36)
    {
      v2 = byte_1000142E0;
      snprintf(byte_1000142E0, 0xCuLL, "%X", a1);
      return v2;
    }
  }
  return *(char **)&dword_1000108C8[v1 + 2];
}

unint64_t sub_100005A58(uint64_t a1, _DWORD *a2, unint64_t a3, uint64_t a4, const void *a5)
{
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  char *v20;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  void *v24;
  uint64_t m;

  v9 = sub_1000053F0();
  v10 = sub_1000053F0();
  *a2 = v10;
  if (v10 == 4)
    v11 = 92;
  else
    v11 = 84;
  v12 = (v11 + *(_DWORD *)(a4 + 96));
  a2[1] = v12;
  if (v12 <= a3)
  {
    v13 = a4 + 13;
    v14 = -3;
    do
    {
      v15 = (char *)a2 + v14 + 14;
      *(v15 - 3) = *(_BYTE *)(v13 + v14 - 6);
      *v15 = *(_BYTE *)(v13 + v14 - 3);
      v15[3] = *(_BYTE *)(v13 + v14);
      v15[6] = *(_BYTE *)(v13 + v14 + 3);
      v15[9] = *(_BYTE *)(v13 + v14 + 6);
      v15[12] = *(_BYTE *)(v13 + v14 + 9);
      v15[15] = *(_BYTE *)(v13 + v14 + 12);
    }
    while (!__CFADD__(v14++, 1));
    v17 = 0;
    v18 = a2 + 11;
    v19 = -6;
    do
    {
      v20 = (char *)v18 + v19;
      *((_WORD *)v20 - 4) = *(_WORD *)(a4 + v17 * 4 + 26);
      *((_WORD *)v20 - 1) = *(_WORD *)(a4 + v17 * 4 + 28);
      v18[v17] = *(_DWORD *)(a4 + v17 * 4 + 40);
      ++v17;
      v19 += 2;
    }
    while (v17 != 3);
    for (i = 0; i != 3; ++i)
      a2[i + 14] = *(_DWORD *)(a4 + 52 + i * 4);
    if (v9 == 4)
    {
      for (j = 0; j != 3; ++j)
        a2[j + 17] = *(_DWORD *)(a4 + 64 + j * 4);
      for (k = 0; k != 3; ++k)
        a2[k + 20] = *(_DWORD *)(a4 + 76 + k * 4);
      v24 = a2 + 23;
    }
    else
    {
      for (m = 0; m != 3; ++m)
        a2[m + 17] = *(_DWORD *)(a4 + 76 + m * 4);
      a2[20] = *(_DWORD *)(a4 + 128);
      v24 = a2 + 21;
    }
    memcpy(v24, a5, *(unsigned int *)(a4 + 96));
  }
  else
  {
    sub_10000268C("Not enough space allocated for the ibic header");
    return 0;
  }
  return v12;
}

uint64_t sub_100005C14(uint64_t a1, uint64_t a2, int a3, int a4, const char *a5, uint64_t (*a6)(uint64_t, _DWORD *, uint64_t, uint64_t), uint64_t a7)
{
  int v9;
  int v10;
  int v11;
  uint64_t Block;
  uint64_t v13;
  char *v14;
  int v15;
  uint64_t v16;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  _DWORD __b[1007];
  _DWORD v30[3];
  int v31;

  v30[1] = a3;
  v30[2] = a4;
  v31 = 0;
  v9 = *(unsigned __int8 *)(a1 + 136) << 30;
  memset(__b, 170, sizeof(__b));
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v30[0] = v10 | v9;
    Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), a2, __b, 4028, v30, 4);
    v13 = Block;
    if ((_DWORD)Block != -536870187)
      break;
LABEL_5:
    if (++v11 > 0x77)
    {
      sub_10000268C("%s: max retries reached; bailing.");
      return v13;
    }
    sub_1000031AC("%s: IOMFB busy, will retry", "fetch_machine");
LABEL_8:
    usleep(0xF4240u);
    v10 = v30[0];
  }
  if ((_DWORD)Block)
  {
    if ((_DWORD)Block != -536870184)
    {
      v14 = sub_1000059E4(Block);
      sub_1000031AC("%s: GetBlock[0] returned %s", "fetch_machine", v14);
LABEL_11:
      sub_10000268C("failed to save %s -- IOMFB in a bad state");
      return v13;
    }
    goto LABEL_5;
  }
  v31 = __b[1];
  sub_1000031AC("%s: xfer id=%d, pending=%d, nwords=%d", "fetch_machine", __b[1], LOBYTE(__b[0]), __b[2]);
  if (LOBYTE(__b[0]))
    goto LABEL_8;
  v15 = __b[2];
  if ((__b[2] - 1) >= 0x3E8)
    v16 = 1000;
  else
    v16 = __b[2];
  v13 = ((uint64_t (*)(uint64_t, _DWORD *, _QWORD, uint64_t, _QWORD))a6)(a7, __b, 0, v16, __b[2]);
  if ((_DWORD)v13)
  {
LABEL_16:
    sub_10000268C("%s: %s save failure [%X]");
    return v13;
  }
  v31 = __b[1];
  if ((v15 + 999) >= 0x7D0)
  {
    v18 = 0;
    v19 = (v15 + 999) / 0x3E8u;
    v25 = v19 - 2;
    if (v19 <= 2)
      v19 = 2;
    v20 = v19 - 1;
    v21 = -1000;
    LODWORD(v22) = v16;
    while (1)
    {
      v30[0] = (v18 + 1) | v9;
      v23 = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), a2, __b, 4028, v30, 4);
      if ((_DWORD)v23)
      {
        v13 = v23;
        goto LABEL_11;
      }
      v22 = v25 == v18 ? (v21 + __b[2]) : v22;
      v24 = a6(a7, __b, v16, v22);
      if ((_DWORD)v24)
        break;
      v16 = (v22 + v16);
      ++v18;
      v21 -= 1000;
      if (v20 == v18)
        goto LABEL_28;
    }
    v13 = v24;
    goto LABEL_16;
  }
LABEL_28:
  sub_1000031AC("%s: save of %s successful", "fetch_machine", a5);
  return 0;
}

uint64_t sub_100005EF0(char *a1, uint64_t a2)
{
  return ~sub_100008A54(0xFFFFFFFFLL, a1, a2);
}

uint64_t sub_100005F14(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v5;
  io_object_t v6;
  io_object_t v7;
  const __CFString *Value;
  __int128 v10;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  char buffer[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_1000031AC("Failed to allocate iterator");
    return 0;
  }
  v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v7 = v6;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty(v7, "IOService", CFSTR("EmbeddedDeviceTypeFirmware"), kCFAllocatorDefault, 3u))
    {
      goto LABEL_11;
    }
    properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0))
      break;
    sub_1000031AC("Unable to obtain properties of IOMedia object");
LABEL_11:
    IOObjectRelease(v7);
    v7 = IOIteratorNext(iterator);
    if (!v7)
      goto LABEL_12;
  }
  Value = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("BSD Name"));
  if (!Value)
  {
    CFRelease(properties);
    goto LABEL_11;
  }
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v10;
  v20 = v10;
  v17 = v10;
  v18 = v10;
  v15 = v10;
  v16 = v10;
  *(_OWORD *)buffer = v10;
  v14 = v10;
  CFStringGetCString(Value, buffer, 128, 0x8000100u);
  snprintf(a2, a3, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  v5 = 1;
LABEL_13:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_100006110(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const char *a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v12;
  _QWORD v14[2];
  int v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v14[0] = a9;
  v14[1] = a10;
  v16 = -1431655766;
  v17 = a7;
  v15 = a11;
  v18 = 0;
  if (a6)
    operator new();
  v12 = sub_100005C14(a1, a2, a3, a4, a7, (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_1000090D4, (uint64_t)v14);
  if ((_DWORD)v12)
    sub_10000268C("%s save failure", a7);
  return v12;
}

void sub_10000627C()
{
  operator delete();
}

BOOL sub_1000062A0(uint64_t a1)
{
  FILE *v1;
  int v3;
  timespec v4;
  std::error_code *v6;
  int v7;
  stat v8;

  v1 = *(FILE **)a1;
  if (!*(_QWORD *)a1)
    return 0;
  v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(_QWORD *)a1 = 0;
  if (!*(_QWORD *)(a1 + 8))
    return 1;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blksize = v4;
  *(timespec *)v8.st_qspare = v4;
  v8.st_birthtimespec = v4;
  *(timespec *)&v8.st_size = v4;
  v8.st_mtimespec = v4;
  v8.st_ctimespec = v4;
  *(timespec *)&v8.st_uid = v4;
  v8.st_atimespec = v4;
  *(timespec *)&v8.st_dev = v4;
  if (v3)
  {
LABEL_4:
    unlink(*(const char **)(a1 + 8));
    return 0;
  }
  sync();
  if (stat(*(const char **)(a1 + 16), &v8))
  {
    if (*__error() != 2)
      goto LABEL_4;
  }
  else if (unlink(*(const char **)(a1 + 16)))
  {
    goto LABEL_4;
  }
  rename(*(const std::__fs::filesystem::path **)(a1 + 8), *(const std::__fs::filesystem::path **)(a1 + 16), v6);
  return v7 == 0;
}

BOOL sub_10000636C(uint64_t a1)
{
  FILE *v1;
  int v3;
  const char *v4;

  v1 = *(FILE **)a1;
  if (!*(_QWORD *)a1)
    return 0;
  v3 = ferror(*(FILE **)a1);
  fclose(v1);
  *(_QWORD *)a1 = 0;
  v4 = *(const char **)(a1 + 8);
  if (!v4)
    v4 = *(const char **)(a1 + 16);
  return (unlink(v4) | v3) == 0;
}

uint64_t sub_1000063D4(uint64_t a1, uint64_t a2, int a3, int a4, void **a5, _DWORD *a6, const char *a7, int a8, int a9)
{
  uint64_t v12;
  _DWORD v14[2];
  unint64_t v15;
  const char *v16;
  void **v17;

  v14[0] = a8;
  v14[1] = a9;
  v16 = a7;
  v15 = 0xAAAAAAAA00000000;
  v17 = a5;
  *a5 = 0;
  v12 = sub_100005C14(a1, a2, a3, a4, a7, (uint64_t (*)(uint64_t, _DWORD *, uint64_t, uint64_t))sub_1000091E0, (uint64_t)v14);
  if ((_DWORD)v12)
  {
    sub_10000268C("%s fetch failure", a7);
    if (*a5)
    {
      free(*a5);
      *a5 = 0;
    }
  }
  else
  {
    *a6 = v15;
  }
  return v12;
}

uint64_t sub_100006470(uint64_t a1)
{
  const char *v1;
  int v3;
  __n128 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  int v10;

  v10 = -1431655766;
  v9 = 0;
  v1 = "not ";
  if (!*(_BYTE *)(a1 + 25))
  {
    v7 = 3758097084;
    goto LABEL_11;
  }
  v3 = sub_100006570(3968, (uint64_t *)&v9, &v10);
  v5 = v9;
  if (!v3)
  {
    v7 = 3758097085;
    if (!v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = sub_1000065E0(*(_QWORD *)(a1 + 16), 130, (uint64_t)v9, 3968, "TBIC", 1, v4);
  v5 = v9;
  if (!(_DWORD)v6)
  {
    if (sub_1000030D0(0x54424943u, (uint64_t)v9, 0x3E0u))
      v7 = 3758097084;
    else
      v7 = 0;
    v5 = v9;
    if (!v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = v6;
  if (v9)
LABEL_8:
    free(v5);
LABEL_9:
  if (!(_DWORD)v7)
    v1 = (const char *)&unk_10000ACAF;
LABEL_11:
  sub_1000031AC("TBICS BIC %ssaved", v1);
  return v7;
}

uint64_t sub_100006570(int a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t result;
  size_t v7;

  result = 0;
  if (a1 && a2 && a3)
  {
    v7 = (a1 + 0x3FFF) & 0xFFFFC000;
    *a3 = v7;
    result = (uint64_t)malloc_type_aligned_alloc(0x4000uLL, v7, 0x45EC97D2uLL);
    *a2 = result;
    if (result)
    {
      bzero((void *)result, *a3);
      return 1;
    }
    else
    {
      *a3 = 0;
    }
  }
  return result;
}

uint64_t sub_1000065E0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const char *a5, int a6, __n128 a7)
{
  const char *v11;
  int i;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  int v17;
  uint64_t v18;

  a7.n128_u64[0] = 0xAAAAAAAA00000001;
  if (a6)
    v11 = "get";
  else
    v11 = "set";
  v16 = 0xAAAAAAAA00000001;
  BYTE4(v16) = a6;
  v17 = a4;
  v18 = a3;
  for (i = 119; ; --i)
  {
    v13 = a6
        ? IOMobileFramebufferGetBufBlock(a1, a2, &v16, 20, 0, 0, a7)
        : IOMobileFramebufferSetBlock(a1, a2, &v16, 20, 0, 0);
    v14 = v13;
    if ((_DWORD)v13 != -536870187 && (_DWORD)v13 != -536870184)
      break;
    if (!i)
    {
      sub_10000268C("%s %s max retries reached -> bailing");
      return v14;
    }
    sub_1000031AC("%s %s failed, will retry", v11, a5);
    usleep(0xF4240u);
  }
  if ((_DWORD)v13)
  {
    sub_1000059E4(v13);
    sub_10000268C("%s %s failed: %s");
  }
  return v14;
}

BOOL sub_100006710(FILE **a1, void *__ptr, size_t __size, size_t __nitems)
{
  return *a1 && fwrite(__ptr, __size, __nitems, *a1) != 0;
}

uint64_t sub_10000674C(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v5;
  io_object_t v6;
  io_object_t v7;
  const __CFString *Value;
  const __CFBoolean *v9;
  __int128 v11;
  size_t __size;
  CFMutableDictionaryRef properties;
  io_iterator_t iterator;
  char buffer[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  iterator = 0;
  if (IORegistryCreateIterator(kIOMainPortDefault, "IOService", 1u, &iterator))
  {
    sub_1000031AC("Failed to allocate iterator");
    return 0;
  }
  v6 = IOIteratorNext(iterator);
  if (!v6)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  __size = a3;
  while (1)
  {
    if (!IOObjectConformsTo(v7, "IOMedia")
      || kCFBooleanTrue != IORegistryEntrySearchCFProperty(v7, "IOService", CFSTR("EmbeddedDeviceTypeBIS"), kCFAllocatorDefault, 3u))
    {
      goto LABEL_12;
    }
    properties = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0))
      break;
    sub_1000031AC("Unable to obtain properties of IOMedia object");
LABEL_12:
    IOObjectRelease(v7);
    v7 = IOIteratorNext(iterator);
    if (!v7)
      goto LABEL_13;
  }
  Value = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("BSD Name"));
  v9 = (const __CFBoolean *)CFDictionaryGetValue(properties, CFSTR("Whole"));
  if (!Value || v9 != kCFBooleanTrue)
  {
    CFRelease(properties);
    goto LABEL_12;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21 = v11;
  v22 = v11;
  v19 = v11;
  v20 = v11;
  v17 = v11;
  v18 = v11;
  *(_OWORD *)buffer = v11;
  v16 = v11;
  CFStringGetCString(Value, buffer, 128, 0x8000100u);
  snprintf(a2, __size, "%s%s", "/dev/", buffer);
  CFRelease(properties);
  IOObjectRelease(v7);
  v5 = 1;
LABEL_14:
  IOObjectRelease(iterator);
  return v5;
}

uint64_t sub_10000696C()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;

  v0 = IOServiceMatching("AppleANS2NVMeController");
  if (!v0)
  {
    sub_1000031AC("Can't create AppleANS2NVMeController dictionary");
    return 16;
  }
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_1000031AC("Can't find AppleANS2NVMeController service");
    return 16;
  }
  v2 = MatchingService;
  if (IORegistryEntrySetCFProperty(MatchingService, CFSTR("bis-write-done"), kCFBooleanTrue))
    sub_1000031AC("Failed to commit BIS");
  IOObjectRelease(v2);
  return 0;
}

void sub_100006A04(uint64_t a1)
{
  int v2;
  int Block;
  _OWORD v4[14];
  __int128 v5;
  unint64_t v6;

  v2 = 5;
  while (!*(_WORD *)(a1 + 140))
  {
    v6 = 0xAAAAAAAAAAAAAAAALL;
    v5 = xmmword_10000FCF0;
    v4[0] = xmmword_10000FC10;
    memset(&v4[1], 255, 208);
    Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 15, v4, 248, 0, 0);
    if (Block != -536870187 && Block != -536870184)
    {
      if (Block)
      {
        sub_1000031AC(">> reading BICS params failed.");
      }
      else if (LODWORD(v4[0]) == 1)
      {
        *(_DWORD *)(a1 + 140) = HIDWORD(v5);
        *(_DWORD *)(a1 + 144) = v6;
        sub_1000031AC("recovery scale %d %d, nwords=%X");
      }
      else
      {
        sub_1000031AC("unexpected struct version for BICS parameters");
      }
      return;
    }
    usleep(0xF4240u);
    if (!--v2)
      return;
  }
}

uint64_t sub_100006B44(const void *a1, size_t a2, char *a3)
{
  uint64_t v3;
  int v7;
  int v8;
  ssize_t v9;
  ssize_t v10;
  uint64_t v12;

  v3 = 22;
  if (a1 && a3)
  {
    v7 = open(a3, 1);
    if ((v7 & 0x80000000) == 0)
    {
      v8 = v7;
      if (fcntl(v7, 48, 1) < 0)
      {
        sub_1000031AC("Failed to set F_NOCACHE", v12);
      }
      else
      {
        v9 = write(v8, a1, a2);
        v10 = v9;
        if ((v9 & 0x8000000000000000) == 0 && v9 == a2)
        {
          v3 = 0;
LABEL_14:
          close(v8);
          return v3;
        }
        sub_1000031AC("Failed to Write");
        if (v10 < 0)
          sub_1000031AC("Write Failed");
        else
          sub_1000031AC("Wrong Buf_size %zd - %zd");
      }
      v3 = *__error();
      goto LABEL_14;
    }
    sub_1000031AC("Failed to open %s", a3);
    return *__error();
  }
  return v3;
}

uint64_t sub_100006C44(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  char *v12;
  char *v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  char *v17;
  uint64_t (**v18)();
  unint64_t v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  char *v23;
  _OWORD v24[16];

  sub_100006A04(a1);
  sub_1000031AC("%s", "load_recovery_lth");
  if (!*(_WORD *)(a1 + 140) || !*(_WORD *)(a1 + 142) || !*(_DWORD *)(a1 + 144))
  {
    v5 = 3758097084;
    sub_1000031AC("Params missing in %s");
    return v5;
  }
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[14] = v3;
  v24[15] = v3;
  v24[12] = v3;
  v24[13] = v3;
  v24[10] = v3;
  v24[11] = v3;
  v24[8] = v3;
  v24[9] = v3;
  v24[6] = v3;
  v24[7] = v3;
  v24[4] = v3;
  v24[5] = v3;
  v24[2] = v3;
  v24[3] = v3;
  v24[0] = v3;
  v24[1] = v3;
  if (*(_BYTE *)(a1 + 25))
  {
    v23 = (char *)0xAAAAAAAAAAAAAAAALL;
    v22 = -1431655766;
    v4 = sub_100002EE0(0x644C5448u, (void **)&v23, &v22);
    if ((_DWORD)v4)
    {
      v5 = v4;
      sub_1000031AC("Failed to read dLTH from ean: ret- %d");
      return v5;
    }
    v12 = v23;
    v13 = v23 + 4;
    v14 = *(_DWORD *)v23;
    if ((*(_DWORD *)v23 & 0x80000000) != 0)
    {
      v15 = v14 & 0x7FFFFFFF;
      v13 = v23 + 8;
      v14 = *((_DWORD *)v23 + 1);
    }
    else
    {
      v15 = 1;
    }
    sub_1000031AC("dLTH version: %u\n", v15);
    v16 = *(_DWORD *)(a1 + 144);
    if (v14 > v16 || v22 <= v14)
    {
      v5 = 3758097084;
      sub_1000031AC("Buffer size mismatch in %s: buf %d, recovery.nwords %d", "load_recovery_lth", v14, v16);
      free(v12);
      return v5;
    }
    sub_1000031AC("dLTH size: %u\n", v14);
    v19 = (unint64_t)v13;
    v21 = -1431655766;
    v18 = (uint64_t (**)())&off_100010A68;
    v20 = v14;
    v5 = sub_100005494(a1, (void (***)(_QWORD))&v18, 4 * v14, *(unsigned __int16 *)(a1 + 140), *(unsigned __int16 *)(a1 + 142), 14, 1, "recovery LTH");
    free(v12);
    v8 = -1;
  }
  else
  {
    if ((sub_10000674C(v2, (char *)v24, 0x100uLL) & 1) == 0)
    {
      sub_1000031AC("Unable to find BIS device");
      return 3758097098;
    }
    sub_1000031AC("LTH recovery path = %s", (const char *)v24);
    v7 = sub_100006F20((const char *)v24);
    if ((v7 & 0x80000000) != 0)
    {
      v17 = strerror(-536870212);
      sub_1000031AC("Unable to read BIS LTH - %s", v17);
      return 3758097098;
    }
    v8 = v7;
    v9 = 4 * *(_DWORD *)(a1 + 144);
    v10 = *(unsigned __int16 *)(a1 + 140);
    v11 = *(unsigned __int16 *)(a1 + 142);
    v18 = &off_100010A28;
    v19 = v7 | 0xAAAAAAAA00000000;
    v5 = sub_100005494(a1, (void (***)(_QWORD))&v18, v9, v10, v11, 14, 1, "recovery LTH");
  }
  if (!(_DWORD)v5)
    sub_1000031AC("Disaster recovery history uploaded");
  if ((v8 & 0x80000000) == 0)
    close(v8);
  return v5;
}

uint64_t sub_100006F20(const char *a1)
{
  uint64_t v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = open(a1, 0);
  if ((v2 & 0x80000000) != 0)
    sub_1000031AC("Failed to open %s", a1);
  return v2;
}

uint64_t sub_100006F74(uint64_t a1, unint64_t a2, char *a3)
{
  uint64_t result;
  int v6;

  result = 3758097090;
  if (a2 <= 1 && a3)
  {
    v6 = BIMUpdaterRead(*(_QWORD *)(a1 + 120));
    if (v6)
    {
      sub_1000031AC("IOConnectCallMethod() @%u failed for READ with 0x%08x.", 2285, v6);
      return 3758097098;
    }
    sub_1000031AC("IOMFB: BIM read version:%u header:%u timestamp:%llu crc:%u", *a3, a3[1], *(_QWORD *)(a3 + 2), *((_DWORD *)a3 + 7));
    if (*a3 == 1)
    {
      if (a3[1] == 66)
      {
        if (*((_DWORD *)a3 + 7) == ~sub_100008A54(0xFFFFFFFFLL, a3, 28))
          return 0;
        sub_1000031AC("BIM region: %llu failed Checksum: %08x expected - %08x calculated");
      }
      else
      {
        sub_1000031AC("BIM region: %llu header malformed %02x expected - %02x read");
      }
    }
    else
    {
      sub_1000031AC("BIM region: %llu version incorrect %02x expected - %02x read");
    }
    return 3758097084;
  }
  return result;
}

uint64_t sub_10000709C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;

  v3 = 3758097090;
  if (a2 <= 1 && a3)
  {
    v5 = BIMUpdaterWrite(*(_QWORD *)(a1 + 120));
    if (v5)
    {
      sub_1000031AC("IOConnectCallMethod() @%u failed for WRITE with 0x%08x.", 2339, v5);
      return 3758097098;
    }
    else
    {
      sub_1000031AC("BIM region %llu: write successful", a2);
      return 0;
    }
  }
  return v3;
}

BOOL sub_100007120(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4)
{
  xpc_object_t v7;
  void *v8;

  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "channel", a3);
    xpc_dictionary_set_string(v8, "value_type", a2);
    xpc_dictionary_set_uint64(v8, "value", a4);
    analytics_send_event("com.apple.bim", v8);
    xpc_release(v8);
  }
  return v8 != 0;
}

BOOL sub_1000071C0(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v7;
  void *v8;
  unsigned __int16 *v9;

  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = v7;
  if (v7)
  {
    xpc_dictionary_set_uint64(v7, "tile", a4 + 1000 * a2);
    v9 = (unsigned __int16 *)(a3 + 6 * a4);
    xpc_dictionary_set_uint64(v8, "red_min", v9[4]);
    xpc_dictionary_set_uint64(v8, "red_median", v9[5]);
    xpc_dictionary_set_uint64(v8, "red_max", v9[6]);
    xpc_dictionary_set_uint64(v8, "green_min", v9[604]);
    xpc_dictionary_set_uint64(v8, "green_median", v9[605]);
    xpc_dictionary_set_uint64(v8, "green_max", v9[606]);
    xpc_dictionary_set_uint64(v8, "blue_min", v9[1204]);
    xpc_dictionary_set_uint64(v8, "blue_median", v9[1205]);
    xpc_dictionary_set_uint64(v8, "blue_max", v9[1206]);
    analytics_send_event("com.apple.tbim", v8);
    xpc_release(v8);
  }
  return v8 != 0;
}

uint64_t sub_1000072F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if (IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 26, 1, &v3))
    return 3758097084;
  else
    return 0;
}

uint64_t sub_100007338(_BYTE *a1)
{
  unint64_t v2;
  int v3;
  const char *v4;
  uint64_t (*v5)(_QWORD *);
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  mach_timebase_info info;

  info = 0;
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
  v2 = byte_1000140A1;
  v3 = byte_1000140A0[0];
  if (byte_1000140A1 >= byte_1000140A0[0])
  {
    v9 = 0;
  }
  else
  {
    v4 = &byte_1000140A0[48 * byte_1000140A1 + 32];
    while (!a1[27])
    {
      mach_timebase_info(&info);
      v5 = (uint64_t (*)(_QWORD *))*((_QWORD *)v4 - 2);
      v6 = *((_QWORD *)v4 - 1);
      v7 = mach_absolute_time();
      v8 = &a1[v6 >> 1];
      if ((v6 & 1) != 0)
        v5 = *(uint64_t (**)(_QWORD *))(*v8 + v5);
      v9 = v5(v8);
      v10 = (mach_absolute_time() - v7) * info.numer / info.denom / 0xF4240;
      sub_1000031AC("Task %s took %llu millisec\n", v4, v10);
      *((_QWORD *)v4 - 3) = v10;
      byte_1000140A1 = ++v2;
      v3 = byte_1000140A0[0];
      v4 += 48;
      if (v2 >= byte_1000140A0[0])
      {
        LODWORD(v2) = v2;
        goto LABEL_10;
      }
    }
    sub_1000031AC("Interrupted by sleep at %s task!!\n", v4);
    LODWORD(v2) = byte_1000140A1;
    v3 = byte_1000140A0[0];
    v9 = 3758097131;
  }
LABEL_10:
  if ((_DWORD)v2 == v3)
  {
    sub_1000031AC("Tasks completed!!\n");
    byte_1000140A1 = 0;
  }
  (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)a1 + 72))(a1, 0);
  return v9;
}

uint64_t sub_1000074A8(_BYTE *a1)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  if (a1[8])
    return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 88))(a1);
  v3 = sub_100003214((uint64_t)a1);
  v4 = sub_1000032B8((uint64_t)a1);
  if (!v3)
    v3 = v4;
  v5 = sub_100003380((uint64_t)a1);
  if (!v3)
    v3 = v5;
  v6 = sub_100003468((uint64_t)a1);
  if (!v3)
    v3 = v6;
  if (a1[29])
  {
    sub_100004D80((uint64_t)a1);
    sub_100006470((uint64_t)a1);
  }
  v7 = sub_10000355C((uint64_t)a1);
  if (!v3)
    v3 = v7;
  v8 = sub_100003674((uint64_t)a1);
  if (!v3)
    v3 = v8;
  v9 = sub_10000388C((uint64_t)a1);
  if (!v3)
    v3 = v9;
  v10 = sub_100003AF0((uint64_t)a1);
  if (!v3)
    v3 = v10;
  LODWORD(result) = sub_100003EEC((uint64_t)a1);
  if (v3)
    return v3;
  else
    return result;
}

uint64_t sub_100007588(uint64_t a1, uint64_t a2)
{
  timespec v4;
  int v5;
  uint64_t result;
  const char *v7;
  stat v8;

  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blksize = v4;
  *(timespec *)v8.st_qspare = v4;
  v8.st_birthtimespec = v4;
  *(timespec *)&v8.st_size = v4;
  v8.st_mtimespec = v4;
  v8.st_ctimespec = v4;
  *(timespec *)&v8.st_uid = v4;
  v8.st_atimespec = v4;
  *(timespec *)&v8.st_dev = v4;
  if (!*(_BYTE *)(a1 + 24) && stat("migrate_history", &v8))
  {
    *(_BYTE *)(a1 + 136) = 1;
    result = sub_100003214(a1);
    *(_BYTE *)(a1 + 136) = 0;
    if ((_DWORD)result)
      return snprintf((char *)a2, 0x64uLL, "save migrate history [%X]");
    *(_WORD *)(a2 + 16) = 108;
    v7 = "export successful";
    goto LABEL_17;
  }
  sub_100004CEC(a1);
  *(_BYTE *)(a1 + 136) = 1;
  if (*(_BYTE *)(a1 + 24))
    v5 = sub_100005808(a1, 0x4C544820u, 1, 1, 14, 1, "history");
  else
    v5 = sub_10000570C(a1, "migrate_history", 1, 1, 14, 1, "migrate history");
  *(_BYTE *)(a1 + 136) = 0;
  if (v5)
    return snprintf((char *)a2, 0x64uLL, "import history failed [%X]");
  if (!*(_BYTE *)(a1 + 24))
    unlink("migrate_history");
  if (sub_100003214(a1))
    return snprintf((char *)a2, 0x64uLL, "save local history failed [%X]");
  if (sub_1000032B8(a1))
    return snprintf((char *)a2, 0x64uLL, "regenerate BIC failed [%X]");
  result = sub_100003380(a1);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a2 + 16) = 108;
    v7 = "import successful";
LABEL_17:
    *(_OWORD *)a2 = *(_OWORD *)v7;
    return result;
  }
  return snprintf((char *)a2, 0x64uLL, "save BIC failed [%X]");
}

uint64_t sub_100007730(uint64_t a1)
{
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 25) = 0;
  *(_QWORD *)a1 = off_100010818;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)off_100010870;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)off_100010880;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)off_100010890;
  bzero((void *)(a1 + 80), 0xD6uLL);
  return a1;
}

uint64_t sub_100007788(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = a2;
  *(_BYTE *)(a1 + 25) = sub_100002600(a1, CFSTR("ean-storage-present"));
  return 1;
}

BOOL sub_1000077BC(uint64_t a1)
{
  int Block;
  int v4;

  Block = IOMobileFramebufferGetBlock(*(_QWORD *)(a1 + 16), 62, a1 + 80, 214, 0, 0);
  if (Block)
  {
    sub_1000031AC("No LACS support");
  }
  else
  {
    if (sub_100007864(a1))
      sub_1000031AC("Failed to upload LAH");
    v4 = sub_100007A98(a1);
    if (v4)
    {
      if (v4 == -536870911)
      {
        sub_100007CA4(a1);
        sub_100007CFC(a1, 0);
      }
      else
      {
        sub_1000031AC("Failed to upload LAC");
      }
    }
  }
  return Block == 0;
}

uint64_t sub_100007864(uint64_t a1)
{
  int v2;
  int v3;
  __n128 v4;
  uint64_t v5;
  uint64_t v6;
  tm *v7;
  std::error_code *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  char *v13;
  time_t v15;
  FILE *v16;
  void *__ptr;
  unsigned int v18;
  int v19;
  _BYTE __to[80];

  if ((*(_BYTE *)(a1 + 293) & 1) != 0)
    return 0;
  v18 = 0;
  __ptr = 0;
  v2 = sub_100001D50(22400);
  if (!sub_100006570(v2, (uint64_t *)&__ptr, &v18))
    return 3758097085;
  v16 = (FILE *)0xAAAAAAAAAAAAAAAALL;
  sub_100008C54(&v16, *(char **)(a1 + 32));
  if (v16)
  {
    v3 = sub_100007D80(a1, &v16, (char *)__ptr, v18, &v19, "file history");
    if (v3 == -536870911)
    {
      memset(__to, 0, sizeof(__to));
      v15 = time(0);
      v7 = localtime(&v15);
      strftime(__to, 0x50uLL, "history_%R_%F", v7);
      if (v16)
        fclose(v16);
      v16 = 0;
      rename(*(const std::__fs::filesystem::path **)(a1 + 32), (const std::__fs::filesystem::path *)__to, v8);
      sub_1000031AC("corrupted history moved aside %s\n", __to);
    }
    else if (!v3)
    {
      v5 = 0;
      goto LABEL_16;
    }
  }
  v9 = sub_100007FB4(a1, __ptr, v18, "recovery history");
  v6 = v9;
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 == -536870911)
    {
      sub_100003040(0x724C4153u);
      v6 = 3758096385;
    }
    goto LABEL_19;
  }
  v5 = 1;
LABEL_16:
  v10 = *(_QWORD *)(a1 + 16);
  v11 = off_1000108A0[v5];
  v12 = sub_1000065E0(v10, 58, (uint64_t)__ptr, v18, v11, 0, v4);
  v6 = v12;
  if ((_DWORD)v12)
  {
    v13 = sub_1000059E4(v12);
    sub_10000268C("upload %s failed: %s", v11, v13);
  }
  else
  {
    sub_1000031AC("uploaded %s", v11);
    v6 = 0;
  }
LABEL_19:
  if (__ptr)
    free(__ptr);
  if (v16)
    fclose(v16);
  return v6;
}

void sub_100007A70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, FILE *a12)
{
  if (a12)
    fclose(a12);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007A98(uint64_t a1)
{
  char v2;
  int v3;
  __n128 v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  FILE *v10;
  void *__ptr;
  unsigned int v12;
  int v13;

  v2 = *(_BYTE *)(a1 + 80);
  v12 = 0;
  __ptr = 0;
  v3 = sub_100001D50(5600);
  if (!sub_100006570(v3, (uint64_t *)&__ptr, &v12))
    return 3758097085;
  if ((*(_BYTE *)(a1 + 80) & 2) != 0
    && (v10 = (FILE *)0xAAAAAAAAAAAAAAAALL, sub_100008C54(&v10, *(char **)(a1 + 64)), v10))
  {
    v5 = sub_100007D80(a1, &v10, (char *)__ptr, v12, &v13, "test LAC");
    if (v10)
      fclose(v10);
    if (!v5)
    {
      v6 = 2;
      goto LABEL_25;
    }
  }
  else if ((v2 & 1) != 0)
  {
    v6 = 3;
    goto LABEL_24;
  }
  v8 = sub_1000081B8(a1, __ptr, v12, "iLAC");
  if ((_DWORD)v8)
  {
    v7 = v8;
    if ((_DWORD)v8 == -536870911)
      sub_100003040(0x694C4143u);
    v10 = (FILE *)0xAAAAAAAAAAAAAAAALL;
    sub_100008C54(&v10, *(char **)(a1 + 48));
    if (!v10)
      goto LABEL_28;
    v7 = sub_100007D80(a1, &v10, (char *)__ptr, v12, &v13, "file LAC");
    if ((_DWORD)v7 == -536870911)
    {
      if (v10)
        fclose(v10);
      v10 = 0;
      unlink(*(const char **)(a1 + 48));
    }
    if (v10)
      fclose(v10);
    if ((_DWORD)v7)
      goto LABEL_28;
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
LABEL_24:
  if ((*(_BYTE *)(a1 + 80) & 1) == 0)
  {
LABEL_25:
    v7 = sub_1000065E0(*(_QWORD *)(a1 + 16), 59, (uint64_t)__ptr, v12, "LAC", 0, v4);
    if (!(_DWORD)v7)
    {
      sub_1000031AC("uploaded %s", off_1000108B0[v6]);
      *(_BYTE *)(a1 + 80) |= 1u;
    }
    goto LABEL_28;
  }
  v7 = 0;
LABEL_28:
  if (__ptr)
    free(__ptr);
  return v7;
}

void sub_100007C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10)
    fclose(a10);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007CA4(uint64_t a1)
{
  uint64_t v1;
  char *v2;

  v1 = IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 12, 0, 0);
  v2 = sub_1000059E4(v1);
  sub_1000031AC("%s: %s", "update_lac", v2);
  return v1;
}

uint64_t sub_100007CFC(uint64_t a1, int a2)
{
  int v4;

  v4 = sub_100001D50(5600);
  return sub_100008574(a1, a2, 59, v4, *(FILE **)(a1 + 56), *(char **)(a1 + 48), 4, "lac", 0x694C4143u);
}

uint64_t sub_100007D5C(uint64_t a1)
{
  return IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 13, 0, 0);
}

uint64_t sub_100007D70(uint64_t a1, unsigned int a2)
{
  return *(_QWORD *)(a1 + 8 * a2 + 32);
}

uint64_t sub_100007D80(uint64_t a1, FILE **a2, char *__ptr, unsigned int a4, _DWORD *a5, const char *a6)
{
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v21;

  if (!*a2 || (v12 = *(_DWORD *)(a1 + 89), fread(__ptr, 1uLL, 4uLL, *a2) != 4))
  {
    v19 = 3758097084;
    sub_10000268C("failed to read %s version");
    return v19;
  }
  v13 = sub_100001D60(__ptr);
  if (!v13)
  {
    sub_10000268C("%s header version unknown %d");
    return 3758096385;
  }
  if (!*a2 || (v14 = v13, fread(__ptr + 4, 1uLL, (v13 - 4), *a2) != v13 - 4))
  {
    v19 = 3758097084;
    sub_10000268C("failed to read %s header");
    return v19;
  }
  v15 = sub_100001D74((uint64_t)__ptr, 1);
  v16 = v15;
  if (v15 - 1 >= a4)
  {
    v19 = 3758097084;
    sub_10000268C("bad %s size 0x%x buf 0x%x");
    return v19;
  }
  if (!*a2 || fread(&__ptr[v14], 1uLL, (v15 - v14), *a2) != v15 - v14)
  {
    v19 = 3758097084;
    sub_10000268C("failed to read %s content");
    return v19;
  }
  if (v12 && !sub_100001DE4(&__ptr[v14], *((unsigned int *)__ptr + 2), (char *)(a1 + 93), v12))
  {
    sub_10000268C("%s panel mismatch", a6);
    *(_BYTE *)(a1 + 26) = 1;
    return 3758096385;
  }
  v17 = (v16 - 4) >> 2;
  v18 = *(_DWORD *)&__ptr[4 * v17];
  v21 = 0;
  sub_100001E1C((int *)__ptr, v17, &v21);
  if ((*(_BYTE *)(a1 + 80) & 2) == 0 && v21 != v18)
  {
    sub_10000268C("%s CRC not valid 0x%x 0x%x");
    return 3758096385;
  }
  v19 = 0;
  *a5 = v16;
  return v19;
}

FILE *sub_100007F88(FILE **a1)
{
  FILE *result;

  result = *a1;
  if (result)
    result = (FILE *)fclose(result);
  *a1 = 0;
  return result;
}

uint64_t sub_100007FB4(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  _DWORD *v17;
  int *v18;
  int *v19;
  int v20;
  int v22;
  unsigned int v23;
  unsigned int *v24;

  v5 = *(_DWORD *)(a1 + 89);
  v24 = 0;
  v23 = 0;
  if (*(_BYTE *)(a1 + 25) && !sub_100002EE0(0x724C4153u, (void **)&v24, &v23))
  {
    v10 = v24;
    v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 85) && sub_100001D60(v24))
    {
      v11 = sub_100001D74((uint64_t)v10, 1);
      v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_10000268C("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }
      else if (v5 && (v13 = sub_100001D60(v10), !sub_100001DE4((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_10000268C("%s panel mismatch");
      }
      else
      {
        v14 = (v12 >> 2) - 1;
        v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          v16 = (v12 >> 2) - 1;
          v17 = a2;
          v18 = (int *)v10;
          v19 = (int *)v10;
          do
          {
            v20 = *v19++;
            *v17++ = v20;
            sub_100001E1C(v18, 1, &v22);
            v18 = v19;
            --v16;
          }
          while (v16);
        }
        if ((*(_BYTE *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          v9 = 0;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }
        sub_10000268C("%s CRC not valid 0x%x 0x%x");
      }
    }
    else
    {
      sub_10000268C("%s header version unknown %d support %d");
    }
    v9 = 3758096385;
    goto LABEL_18;
  }
  sub_10000268C("could not read %s from EAN\n", a4);
  return 3758097084;
}

FILE **sub_100008188(FILE **a1)
{
  FILE *v2;

  v2 = *a1;
  if (v2)
    fclose(v2);
  *a1 = 0;
  return a1;
}

uint64_t sub_1000081B8(uint64_t a1, _DWORD *a2, unsigned int a3, const char *a4)
{
  int v5;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  _DWORD *v17;
  int *v18;
  int *v19;
  int v20;
  int v22;
  unsigned int v23;
  unsigned int *v24;

  v5 = *(_DWORD *)(a1 + 89);
  v24 = 0;
  v23 = 0;
  if (*(_BYTE *)(a1 + 25) && !sub_100002EE0(0x694C4143u, (void **)&v24, &v23))
  {
    v10 = v24;
    v22 = 0;
    if (*v24 <= *(_DWORD *)(a1 + 81) && sub_100001D60(v24))
    {
      v11 = sub_100001D74((uint64_t)v10, 1);
      v12 = v11;
      if (v11 - 1 >= a3 || 4 * (unint64_t)v23 < v11)
      {
        sub_10000268C("%s has bad size hdr 0x%x ean 0x%x buf 0x%x");
      }
      else if (v5 && (v13 = sub_100001D60(v10), !sub_100001DE4((const char *)v10 + v13, v10[2], (char *)(a1 + 93), v5)))
      {
        sub_10000268C("%s panel mismatch");
      }
      else
      {
        v14 = (v12 >> 2) - 1;
        v15 = v10[v14];
        if (v12 >> 2 != 1)
        {
          v16 = (v12 >> 2) - 1;
          v17 = a2;
          v18 = (int *)v10;
          v19 = (int *)v10;
          do
          {
            v20 = *v19++;
            *v17++ = v20;
            sub_100001E1C(v18, 1, &v22);
            v18 = v19;
            --v16;
          }
          while (v16);
        }
        if ((*(_BYTE *)(a1 + 80) & 2) != 0 || v15 == v22)
        {
          v9 = 0;
          a2[v14] = v15;
LABEL_18:
          free(v10);
          return v9;
        }
        sub_10000268C("%s CRC not valid 0x%x 0x%x");
      }
    }
    else
    {
      sub_10000268C("%s header version unknown %d support %d");
    }
    v9 = 3758096385;
    goto LABEL_18;
  }
  sub_10000268C("could not read %s from EAN\n", a4);
  return 3758097084;
}

uint64_t sub_10000838C(uint64_t a1, unsigned int a2)
{
  return *(_QWORD *)(a1 + 8 * a2 + 48);
}

uint64_t sub_100008398(int a1, const void *a2, unsigned int a3, FILE *a4, FILE *a5, const char *a6, int a7)
{
  uint64_t v10;
  FILE *__stream[3];

  memset(__stream, 170, sizeof(__stream));
  sub_10000903C(__stream, a4, a5, a7);
  if (__stream[0] && fwrite(a2, 1uLL, a3, __stream[0]) && sub_1000062A0((uint64_t)__stream))
  {
    sub_1000031AC("saved %s to file", a6);
    v10 = 0;
  }
  else
  {
    sub_10000636C((uint64_t)__stream);
    sub_10000268C("%s save failure", a6);
    v10 = 3758097084;
  }
  if (__stream[0])
    fclose(__stream[0]);
  return v10;
}

void sub_10000845C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, FILE *a10)
{
  if (a10)
    fclose(a10);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008474(uint64_t a1, int a2, const void *a3, unsigned int a4, unsigned int a5, const char *a6)
{
  size_t v9;
  void *v11;
  void *v12;
  uint64_t v13;

  v9 = (a2 + 4095) & 0xFFFFF000;
  if (v9 <= a4)
  {
    v12 = 0;
  }
  else
  {
    v11 = malloc_type_malloc((a2 + 4095) & 0xFFFFF000, 0x124C55FAuLL);
    if (!v11)
    {
      v13 = 3758097084;
      sub_10000268C("could not allocate memory to save %s to EAN", a6);
      return v13;
    }
    v12 = v11;
    bzero(v11, v9);
    memcpy(v12, a3, a4);
    a3 = v12;
  }
  if (sub_1000030D0(a5, (uint64_t)a3, v9 >> 2))
  {
    v13 = 3758097084;
    sub_10000268C("save %s to EAN failed", a6);
    if (!v12)
      return v13;
    goto LABEL_9;
  }
  sub_1000031AC("saved %s to EAN", a6);
  v13 = 0;
  if (v12)
LABEL_9:
    free(v12);
  return v13;
}

uint64_t sub_100008574(uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  const char *v17;
  __n128 v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;

  v17 = (const char *)&unk_10000ACAF;
  if (a2)
    v17 = " with backup";
  sub_1000031AC("%s %s%s", "save_lac_data", a6, v17);
  v27 = 0;
  v28 = 0;
  if (!sub_100006570(a4, (uint64_t *)&v27, (_DWORD *)&v28 + 1))
    return 3758097085;
  v19 = v27;
  v20 = sub_1000065E0(*(_QWORD *)(a1 + 16), a3, (uint64_t)v27, SHIDWORD(v28), a8, 1, v18);
  if (!(_DWORD)v20)
  {
    v21 = sub_100001D74((uint64_t)v19, 0);
    v22 = sub_100001E1C((int *)v27, v21 >> 2, (int *)&v28);
    v23 = v27;
    *(_DWORD *)((char *)v27 + v21) = v28;
    v24 = v21 + 4;
    v25 = sub_100008398(v22, v23, v21 + 4, a5, (FILE *)a6, a8, a7);
    v20 = v25;
    if (a2)
    {
      if (*(_BYTE *)(a1 + 25))
        v20 = sub_100008474(v25, v24, v27, HIDWORD(v28), a9, a8);
      else
        sub_10000268C("could not access EAN");
    }
  }
  if (v27)
    free(v27);
  return v20;
}

uint64_t sub_1000086E0(uint64_t a1, int a2, uint64_t a3, int a4, FILE *a5, char *a6, int a7, const char *a8, unsigned int a9)
{
  const char *v17;
  __n128 v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;

  v17 = (const char *)&unk_10000ACAF;
  if (a2)
    v17 = " with backup";
  sub_1000031AC("%s %s%s", "save_lah_data", a6, v17);
  v27 = 0;
  v28 = 0;
  if (!sub_100006570(a4, (uint64_t *)&v27, (_DWORD *)&v28 + 1))
    return 3758097085;
  v19 = v27;
  v20 = sub_1000065E0(*(_QWORD *)(a1 + 16), a3, (uint64_t)v27, SHIDWORD(v28), a8, 1, v18);
  if (!(_DWORD)v20)
  {
    v21 = sub_100001D74((uint64_t)v19, 0);
    v22 = sub_100001E1C((int *)v27, v21 >> 2, (int *)&v28);
    v23 = v27;
    *(_DWORD *)((char *)v27 + v21) = v28;
    v24 = v21 + 4;
    v25 = sub_100008398(v22, v23, v21 + 4, a5, (FILE *)a6, a8, a7);
    v20 = v25;
    if (a2)
    {
      if (*(_BYTE *)(a1 + 25))
        v20 = sub_100008474(v25, v24, v27, HIDWORD(v28), a9, a8);
      else
        sub_10000268C("could not access EAN");
    }
  }
  if (v27)
    free(v27);
  return v20;
}

uint64_t sub_10000884C(uint64_t a1, int a2)
{
  int v4;

  v4 = sub_100001D50(22400);
  return sub_1000086E0(a1, a2, 58, v4, *(FILE **)(a1 + 40), *(char **)(a1 + 32), 4, "history", 0x724C4153u);
}

uint64_t sub_1000088AC(uint64_t a1)
{
  return sub_10000884C(a1, 0);
}

uint64_t sub_1000088BC(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v2 = sub_10000884C(a1, 1);
  v3 = sub_100007CA4(a1);
  if (!v2)
    v2 = v3;
  LODWORD(result) = sub_100007CFC(a1, 1);
  if (v2)
    return v2;
  else
    return result;
}

BOOL sub_100008908(FILE **a1, void *__ptr, size_t __nitems)
{
  return *a1 && fread(__ptr, 1uLL, __nitems, *a1) == __nitems;
}

void sub_10000894C(uint64_t a1, uint64_t a2)
{
  int v2;
  char *v3;

  if (*(_DWORD *)(a2 + 4) == 1 && *(_DWORD *)a2 == 1 && !*(_QWORD *)(a2 + 8))
  {
    v2 = IOMobileFramebufferSetParameter(*(_QWORD *)(a1 + 16), 13, 0, 0);
    if (v2)
    {
      v3 = sub_1000059E4(v2);
      sub_10000268C("Couldn't reset history: %s", v3);
    }
    else
    {
      sub_1000031AC("Cleared history in driver");
    }
  }
  else
  {
    sub_1000031AC("Unsupported operation");
  }
}

uint64_t sub_1000089D0(uint64_t result, int a2)
{
  uint64_t i;
  int v3;
  unsigned int v4;

  for (i = 0; i != 256; ++i)
  {
    v3 = 8;
    v4 = i;
    do
    {
      v4 = ((int)(v4 << 31) >> 31) & a2 ^ (v4 >> 1);
      --v3;
    }
    while (v3);
    *(_DWORD *)(result + 4 * i) = v4;
  }
  return result;
}

void sub_100008A04()
{
  uint64_t i;
  int v1;
  unsigned int v2;

  for (i = 0; i != 256; ++i)
  {
    v1 = 8;
    v2 = i;
    do
    {
      v2 = ((int)(v2 << 31) >> 31) & 0xEDB88320 ^ (v2 >> 1);
      --v1;
    }
    while (v1);
    dword_1000142EC[i] = v2;
  }
  byte_1000146EC = 1;
}

uint64_t sub_100008A54(uint64_t result, char *a2, uint64_t a3)
{
  uint64_t i;
  int v4;
  unsigned int v5;
  char v6;

  if ((byte_1000146EC & 1) == 0)
  {
    for (i = 0; i != 256; ++i)
    {
      v4 = 8;
      v5 = i;
      do
      {
        v5 = ((int)(v5 << 31) >> 31) & 0xEDB88320 ^ (v5 >> 1);
        --v4;
      }
      while (v4);
      dword_1000142EC[i] = v5;
    }
    byte_1000146EC = 1;
  }
  for (; a3; --a3)
  {
    v6 = *a2++;
    result = dword_1000142EC[(v6 ^ result)] ^ (result >> 8);
  }
  return result;
}

BOOL sub_100008ACC(int *a1, int *a2, unsigned int a3)
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  int *v7;
  int *v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  int *v14;
  int *v15;

  v3 = a3 >> 2;
  if (a3 >= 4)
  {
    v5 = 0;
    if (v3 <= 1)
      v4 = 1;
    else
      v4 = v3;
    v6 = v4;
    v7 = a2;
    v8 = a1;
    while (1)
    {
      v10 = *v8++;
      v9 = v10;
      v11 = *v7++;
      if (v9 != v11)
        break;
      ++v5;
      if (!--v6)
        return (_DWORD)v4 != v3;
    }
    v12 = v5 >= 4;
    v13 = v5 - 4;
    if (v12)
      LODWORD(v4) = v13;
    else
      LODWORD(v4) = 0;
    v14 = &a1[v4];
    v15 = &a2[v4];
    sub_1000031AC("a[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X", v4, a3 >> 2, *v14, v14[1], v14[2], v14[3], v14[4], v14[5], v14[6], v14[7]);
    sub_1000031AC("b[%d/%d] = %08X %08X %08X %08X %08X %08X %08X %08X", v4, v3, *v15, v15[1], v15[2], v15[3], v15[4], v15[5], v15[6], v15[7]);
  }
  else
  {
    LODWORD(v4) = 0;
  }
  return (_DWORD)v4 != v3;
}

uint64_t sub_100008BB8(io_connect_t *a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  uint64_t v5;

  v2 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    v4 = MatchingService;
    v5 = IOServiceOpen(MatchingService, mach_task_self_, 0, a1);
    IOObjectRelease(v4);
    if ((_DWORD)v5)
      sub_1000031AC("IOServiceOpen on AppleNVMeEAN failed, ans = 0x%x \n", v5);
  }
  else
  {
    sub_1000031AC("Couldn't find AppleNVMeEAN object");
    return 5;
  }
  return v5;
}

FILE **sub_100008C54(FILE **a1, char *__filename)
{
  FILE *v4;

  v4 = fopen(__filename, "r");
  *a1 = v4;
  if (!v4)
    sub_10000268C("Could not open file %s", __filename);
  return a1;
}

BOOL sub_100008CA8(const char *a1)
{
  sem_t *v1;
  sem_t *v2;

  v1 = sem_open(a1, 0);
  v2 = v1;
  if (v1 != (sem_t *)-1)
    sem_close(v1);
  return v2 != (sem_t *)-1;
}

void sub_100008CE4(const char *a1)
{
  sem_t *v2;
  int *v3;

  v2 = sem_open(a1, 512, 256, 0);
  if (v2 == (sem_t *)-1)
  {
    v3 = __error();
    sub_10000268C("could not create semaphore %s (%d)", a1, *v3);
  }
  else
  {
    sem_close(v2);
  }
}

void sub_100008D48(const void *a1, unsigned int a2, const char *a3)
{
  size_t v6;
  size_t v7;
  char __dst[200];

  v6 = a2;
  if (a2 <= 0xC7)
    v7 = 200 - a2;
  else
    v7 = 0;
  bzero(&__dst[a2], v7);
  memcpy(__dst, a1, v6);
  __dst[a2] = 0;
  sub_1000031AC("%s %s len %d\n", a3, __dst, a2);
}

uint64_t sub_100008E04()
{
  return 1;
}

uint64_t sub_100008E0C()
{
  return 0;
}

uint64_t sub_100008E14()
{
  return 0;
}

uint64_t sub_100008E1C()
{
  return 0;
}

uint64_t sub_100008E30(uint64_t result, char a2)
{
  *(_BYTE *)(result + 27) = a2;
  return result;
}

void sub_100008E40(id a1)
{
  qword_1000146F0 = (uint64_t)dispatch_semaphore_create(0);
}

void sub_100008E60(id a1)
{
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1000146F0);
}

ssize_t sub_100008E6C(uint64_t a1, void *a2, unsigned int a3)
{
  return read(*(_DWORD *)(a1 + 8), a2, 4 * a3);
}

void *sub_100008E78(uint64_t a1, void *__dst, unsigned int a3)
{
  unsigned int v4;
  void *result;

  if (*(_DWORD *)(a1 + 16) >= a3)
    v4 = a3;
  else
    v4 = *(_DWORD *)(a1 + 16);
  result = memcpy(__dst, *(const void **)(a1 + 8), 4 * v4);
  *(_DWORD *)(a1 + 16) -= v4;
  *(_QWORD *)(a1 + 8) += 4 * v4;
  return result;
}

uint64_t sub_100008ECC(uint64_t a1, _DWORD *a2, int a3, unsigned int a4)
{
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  int v11;
  uint64_t v12;
  int v13;
  size_t v14;
  size_t v15;
  _DWORD *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  size_t v21;
  uint64_t v22;

  if (a3)
  {
    v7 = *(_QWORD *)(a1 + 16) - 4 * a4;
    *(_QWORD *)(a1 + 16) = v7;
    if (v7 >= 0)
    {
      v8 = 4 * a4;
      memcpy(*(void **)(a1 + 32), a2 + 7, v8);
      v9 = 0;
      v10 = *(_QWORD *)(a1 + 32) + v8;
LABEL_4:
      *(_QWORD *)(a1 + 32) = v10;
      return v9;
    }
    v9 = 3758097085;
    goto LABEL_16;
  }
  v11 = sub_1000053F0();
  v12 = 0;
  if (v11 == 4)
    v13 = 92;
  else
    v13 = 84;
  v14 = (v13 + a2[31]) + 4;
  *(_QWORD *)(a1 + 24) = v14;
  do
  {
    v15 = v14 + a2[v12 + 17];
    *(_QWORD *)(a1 + 24) = v15;
    v14 = v15 + a2[v12 + 20];
    *(_QWORD *)(a1 + 24) = v14;
    ++v12;
  }
  while (v12 != 3);
  v9 = 3758097085;
  v16 = malloc_type_malloc(v14, 0xECFF8A55uLL);
  *(_QWORD *)(a1 + 8) = v16;
  if (v16)
  {
    v17 = sub_100005A58((uint64_t)v16, v16, *(_QWORD *)(a1 + 24), (uint64_t)(a2 + 7), a2 + 41);
    if (!v17)
    {
      sub_10000268C("Failed to populate ibic header");
      return v9;
    }
    v18 = *(_QWORD *)(a1 + 24) - v17;
    *(_QWORD *)(a1 + 16) = v18;
    if (v18 >= 0)
    {
      v19 = (void *)(*(_QWORD *)(a1 + 8) + v17);
      *(_QWORD *)(a1 + 32) = v19;
      v20 = (char *)a2 + a2[31] + 164;
      v21 = 4 * a4 - (a2[31] + 164) + 28;
      v22 = v18 - v21;
      *(_QWORD *)(a1 + 16) = v22;
      if (v22 >= 0)
      {
        memcpy(v19, v20, v21);
        v9 = 0;
        v10 = *(_QWORD *)(a1 + 32) + v21;
        goto LABEL_4;
      }
    }
LABEL_16:
    sub_10000268C("Out of memory");
  }
  return v9;
}

FILE **sub_10000903C(FILE **a1, FILE *a2, FILE *a3, int a4)
{
  int v5;
  FILE *v6;

  a1[1] = a2;
  a1[2] = a3;
  if (a4)
  {
    v5 = open_dprotected_np((const char *)a2, 1537, a4, 0, 420);
    if (v5 < 0)
    {
      *a1 = 0;
LABEL_8:
      sub_10000268C("Could not open temp file %s", (const char *)a1[1]);
      return a1;
    }
    v6 = fdopen(v5, "w");
  }
  else
  {
    v6 = fopen((const char *)a2, "w");
  }
  *a1 = v6;
  if (!v6)
    goto LABEL_8;
  return a1;
}

uint64_t sub_1000090D4(uint64_t a1, uint64_t a2, int a3, size_t __nitems, int a5)
{
  unsigned int v6;
  FILE **v10;
  _DWORD *v11;
  int v13;
  size_t v14;
  _DWORD **v15;

  v6 = __nitems;
  v10 = *(FILE ***)(a1 + 32);
  if (v10 && (!*v10 || !fwrite((const void *)(a2 + 28), 4uLL, __nitems, *v10)))
  {
    sub_1000031AC("%s: write failure", *(const char **)(a1 + 24));
    return 3758097084;
  }
  if (*(_QWORD *)a1)
  {
    if (a3)
    {
      v11 = **(_DWORD ***)a1;
      if (!v11)
        return 0;
    }
    else
    {
      v13 = *(_DWORD *)(a1 + 16);
      if (v13)
        v14 = (4 * (a5 + 1) + v13 - 1) & -v13;
      else
        v14 = 4 * (a5 + 1);
      **(_QWORD **)a1 = malloc_type_malloc(v14, 0xBF269A63uLL);
      v15 = *(_DWORD ***)a1;
      **(_DWORD **)(a1 + 8) = v14 >> 2;
      v11 = *v15;
      if (!*v15)
        return 0;
      *v11 = a5;
    }
    memcpy(&v11[a3 + 1], (const void *)(a2 + 28), 4 * v6);
  }
  return 0;
}

uint64_t sub_1000091E0(unsigned int *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  _QWORD *v13;

  if (!a3 && !**((_QWORD **)a1 + 3))
  {
    a1[2] = a5;
    v10 = a1[1];
    v11 = v10 ? (v10 + 4 * (*a1 + a5) - 1) & -v10 : 4 * (*a1 + a5);
    **((_QWORD **)a1 + 3) = malloc_type_malloc(v11, 0xD9926203uLL);
    if (!*((_QWORD *)a1 + 3))
      sub_1000031AC("%s: failed to allocate buffer.", *((const char **)a1 + 2));
  }
  v12 = 3758097084;
  v13 = (_QWORD *)*((_QWORD *)a1 + 3);
  if (!v13)
    return 3758097085;
  if (a4 + a3 <= a5 && a1[2] == a5)
  {
    memcpy((void *)(*v13 + 4 * a3 + 4 * *a1), (const void *)(a2 + 28), 4 * a4);
    return 0;
  }
  else
  {
    sub_1000031AC("%s: inconsistent data from server.", *((const char **)a1 + 2));
  }
  return v12;
}

void sub_1000092F8(pthread_t *a1)
{
  if (pthread_create(a1, 0, (void *(__cdecl *)(void *))sub_100009330, 0))
    sub_10000268C("Could not launch power listener thread");
}

uint64_t sub_100009330()
{
  io_connect_t v0;
  BOOL v1;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  IONotificationPortRef notify;
  io_object_t notifier;

  notifier = 0;
  notify = 0;
  v0 = IORegisterForSystemPower(0, &notify, (IOServiceInterestCallback)sub_100001E3C, &notifier);
  dword_10001470C = v0;
  if (notify)
    v1 = v0 == 0;
  else
    v1 = 1;
  if (!v1)
  {
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(notify);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopRun();
  }
  sub_10000268C("power listener thread returning. :(");
  return 0;
}

uint64_t AMRestorePartitionFWCopyTagData(const __CFURL *a1, const __CFString *a2, CFTypeRef *a3, off_t *a4, CFTypeRef *a5, off_t *a6)
{
  void *v6;
  int v11;
  int v12;
  ssize_t v13;
  ssize_t v14;
  off_t v15;
  unsigned int v16;
  const __CFString *v17;
  int v18;
  void *v19;
  off_t v20;
  ssize_t v21;
  CFIndex v22;
  int v23;
  uint64_t v24;
  CFDataRef v25;
  off_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  off_t *v31;
  CFTypeRef *v32;
  off_t *v33;
  off_t v34;
  char v35;
  CFDataRef cf;
  __int16 v38;
  size_t __size;
  _OWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v6 = a1;
  __size = 0;
  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  memset(v40, 0, sizeof(v40));
  if (!a1)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "inURL is NULL");
    v19 = 0;
LABEL_53:
    v25 = 0;
    v17 = 0;
    v24 = 99;
    goto LABEL_46;
  }
  v11 = sub_100009940(a1, 0);
  if (!v11)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to open inURL %@", v6);
    v19 = 0;
    v6 = 0;
    goto LABEL_53;
  }
  v12 = v11;
  v6 = malloc(0x8000uLL);
  if (v6)
  {
    v13 = read(v12, v6, 0x8000uLL);
    if (v13)
    {
      v14 = v13;
      v32 = a3;
      v33 = a6;
      v31 = a4;
      v35 = 0;
      v34 = 0;
      v15 = 0;
      v16 = 0;
      cf = 0;
      v17 = 0;
      while (1)
      {
        __size = 0;
        v18 = Img4DecodeParseLengthFromBuffer(v6, v14, &__size);
        if (v18 || !__size)
          break;
        v19 = malloc(__size);
        if (!v19)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "failed to allocate IMG4buffer", v29, v30);
          goto LABEL_25;
        }
        v20 = lseek(v12, v15, 0);
        if (v20 != v15)
        {
          v27 = v20;
          v28 = __error();
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to rewind to start of IMG4 segment lseek=%ll, errno=%d.", v27, *v28);
          goto LABEL_25;
        }
        v21 = read(v12, v19, __size);
        if (!v21)
        {
          __error();
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "0 bytes read, IMG4 image hit end of block device? - fail errno=%d..");
          goto LABEL_25;
        }
        v22 = v21;
        if (v21 != __size)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Bytes read didn't match derLen.");
          goto LABEL_25;
        }
        v23 = Img4DecodeInit(v19, v21, v40);
        if (v23)
        {
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Item %02d, der.length=%8d, Bad Img4 inside valid DER sequence. (derstat=%d)", v16 + 1, v22, v23);
        }
        else
        {
          AMSupportSafeRelease(v17);
          v17 = CFStringCreateWithBytes(kCFAllocatorDefault, *((const UInt8 **)&v41 + 1), v42, 0x8000100u, 0);
          AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Item %02d, offset=%8d, der.length=%8d, img4Tag=[%@]", v16 + 1, v15, v22, v17);
          if (a2 && CFStringCompare(a2, v17, 0) == kCFCompareEqualTo)
          {
            AMSupportLogInternal(6, "AMRestorePartitionFWCopyTagData", "   ^^ Found requested tag.", v16 + 1, v22, v17);
            if (a5)
            {
              if (!cf)
              {
                cf = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v19, v22);
                if (!cf)
                {
                  AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Failed to allocate Img4Data");
                  v25 = 0;
                  goto LABEL_60;
                }
              }
            }
            v35 = 1;
            v34 = v15;
          }
        }
        v15 += __size;
        AMSupportSafeFree(v19);
        v14 = read(v12, v6, 0x8000uLL);
        ++v16;
        if (!v14)
          goto LABEL_27;
      }
      AMSupportLogInternal(6, "AMRestorePartitionFWCopyTagData", "No more segments. (derstat=%d)", v18);
      if (!v16)
        goto LABEL_23;
LABEL_27:
      if (v16 >= 0x21)
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Too Many DER segments!", v29, v30);
        goto LABEL_24;
      }
      if (lseek(v12, v15, 0) != v15)
      {
        __error();
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Unable to seek to terminator segment errno=%d.");
        goto LABEL_24;
      }
      v38 = -1;
      if (read(v12, &v38, 2uLL) != 2)
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Failed to read terminator bytes.", v29, v30);
        goto LABEL_24;
      }
      if (v38 | HIBYTE(v38))
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "Invalid termination bytes: [0x%02x, 0x%02x]");
        goto LABEL_24;
      }
      if ((a2 == 0) | v35 & 1)
        v24 = 0;
      else
        v24 = 8;
      if (v33)
        *v33 = v15;
      if (v31)
        *v31 = v34;
      v25 = cf;
      if (v32 && v17)
        *v32 = CFRetain(v17);
      v19 = 0;
      if (a5 && cf)
      {
        v19 = 0;
        *a5 = CFRetain(cf);
      }
    }
    else
    {
      cf = 0;
      v17 = 0;
LABEL_23:
      AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "No DER segments found.");
LABEL_24:
      v19 = 0;
LABEL_25:
      v24 = 99;
      v25 = cf;
    }
  }
  else
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCopyTagData", "failed to allocate DER chunk buffer");
    v17 = 0;
    v25 = 0;
    v19 = 0;
LABEL_60:
    v24 = 99;
  }
  if (v12 >= 1)
    close(v12);
LABEL_46:
  AMSupportSafeFree(v6);
  AMSupportSafeFree(v19);
  AMSupportSafeRelease(v17);
  AMSupportSafeRelease(v25);
  return v24;
}

uint64_t sub_100009940(const __CFURL *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v7;
  char *v8;
  uint64_t v9;
  UInt8 buffer[1024];

  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "failed to convert url to file system representation");
    AMSupportLogInternal(7, "_AMRestorePartitionOpenFileWithURL", "%@", a1);
    return 0xFFFFFFFFLL;
  }
  v4 = open((const char *)buffer, a2);
  v5 = v4;
  if ((int)v4 <= 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "open() returned %d, %s", v5, v8);
    return v5;
  }
  if (fcntl(v4, 48, 1))
  {
    AMSupportLogInternal(3, "_AMRestorePartitionOpenFileWithURL", "Unable to set F_NOCACHE on firmware storage", v9);
    return 0xFFFFFFFFLL;
  }
  return v5;
}

uint64_t AMRestorePartitionFWCommitData(const __CFURL *a1, CFStringRef theString, CFDataRef theData, int a4, uint64_t a5)
{
  const __CFURL *v5;
  const __CFData *v7;
  const UInt8 *BytePtr;
  CFIndex v10;
  CFDataRef v11;
  CFDataRef v12;
  const __CFData *v13;
  char v14;
  CFIndex v15;
  int v16;
  off_t *v17;
  off_t v18;
  int v19;
  int v20;
  const __CFData *v21;
  CFComparisonResult v22;
  off_t v23;
  CFIndex v24;
  size_t v25;
  UInt8 *v26;
  const UInt8 *v27;
  CFDataRef v28;
  const __CFData *v29;
  CFMutableDictionaryRef v30;
  CFMutableDictionaryRef v31;
  unsigned int v32;
  io_service_t MatchingService;
  unsigned int v34;
  const __CFString *v35;
  const char *CStringPtr;
  kern_return_t v37;
  int *v39;
  int *v40;
  int *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFData *v47;
  const __CFData *v48;
  const __CFData *v49;
  CFStringRef theString1;
  CFDataRef theDataa;
  UInt8 bytes[2];
  off_t v53;
  off_t v54;
  char buffer[4];
  char v56;
  _DWORD length[3];
  CFDataRef v58;

  v5 = a1;
  v53 = 0;
  v54 = 0;
  *(_WORD *)bytes = 0;
  theString1 = 0;
  theDataa = 0;
  if (!a1)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "inURL is NULL");
    v13 = 0;
    v21 = 0;
    goto LABEL_25;
  }
  if (!theString)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "tag is NULL");
LABEL_69:
    v13 = 0;
    goto LABEL_24;
  }
  v7 = theData;
  if (!theData)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "rawData is NULL");
    goto LABEL_69;
  }
  if (!a4)
  {
    v15 = CFDataGetLength(theData);
    v13 = 0;
    goto LABEL_16;
  }
  v58 = 0;
  memset(length, 0, sizeof(length));
  if (CFStringGetLength(theString) != 4)
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "tag %@ is not 4 chars.", theString);
LABEL_83:
    v13 = 0;
    v12 = 0;
LABEL_84:
    v14 = 0;
    goto LABEL_12;
  }
  v56 = 0;
  *(_DWORD *)buffer = 0;
  if (!CFStringGetCString(theString, buffer, 5, 0x8000100u))
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "CFStringGetCString failed.");
    goto LABEL_83;
  }
  if (AMAuthInstallApImg4CreatePayload(buffer, "1", v7, 0, 0, &v58))
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "IM4P encode failed with %d");
    goto LABEL_83;
  }
  if (!v58)
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "im4pData is NULL");
    goto LABEL_83;
  }
  BytePtr = CFDataGetBytePtr(v58);
  v10 = CFDataGetLength(v58);
  if (Img4EncodeStitchManifest(BytePtr, v10, 0, 0, &length[1], length) != 100)
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "failed to encode image4 with %d");
    goto LABEL_83;
  }
  v11 = CFDataCreate(0, *(const UInt8 **)&length[1], length[0]);
  v12 = v11;
  if (!v11)
  {
    AMSupportLogInternal(3, "AMRestorePartitionCreateUnsignedImg4", "failed to create data from buffer");
    v13 = 0;
    goto LABEL_84;
  }
  v13 = (const __CFData *)CFRetain(v11);
  v14 = 1;
LABEL_12:
  AMSupportSafeRelease(v12);
  AMSupportSafeRelease(v58);
  AMSupportSafeFree(*(_QWORD *)&length[1]);
  if ((v14 & 1) == 0)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "IM4P encode failed with %d");
    goto LABEL_24;
  }
  if (!v13)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "img4Data is NULL");
    goto LABEL_24;
  }
  v15 = CFDataGetLength(v13);
  v7 = v13;
LABEL_16:
  v16 = AMRestorePartitionFWCopyTagData(v5, theString, (CFTypeRef *)&theString1, &v54, (CFTypeRef *)&theDataa, &v53);
  if ((v16 | 8) != 8)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to parse input device amr=%d.");
LABEL_24:
    v21 = 0;
    v5 = 0;
LABEL_25:
    v19 = 0;
    goto LABEL_26;
  }
  if (!theString1)
  {
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "No lastTag returned.", v43);
    goto LABEL_24;
  }
  v17 = &v54;
  if (v16 == 8)
    v17 = &v53;
  v18 = *v17;
  if (v16)
  {
    v19 = sub_100009940(v5, 1);
    if (v19 > 0)
    {
      v20 = 0;
      v5 = 0;
      if (lseek(v19, v18, 0) != v18)
        goto LABEL_70;
LABEL_39:
      if ((sub_10000A2B8(v7, v19) & 1) == 0)
      {
        AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to insert new data", v43);
        goto LABEL_89;
      }
      if (!v20)
        goto LABEL_44;
      if (lseek(v19, v18 + v15, 0) == v18 + v15)
      {
        AMSupportLogInternal(6, "AMRestorePartitionFWCommitData", "Tag %@ was found in input, but wasn't the last tag (%@), appending final input data.", theString, theString1);
        if ((sub_10000A2B8(v5, v19) & 1) != 0)
        {
LABEL_44:
          v29 = CFDataCreate(kCFAllocatorDefault, bytes, 2);
          v21 = v29;
          if (v29)
          {
            if (CFDataGetLength(v29) == 2)
            {
              if ((sub_10000A2B8(v21, v19) & 1) != 0)
              {
                if (close(v19))
                {
                  AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "fstatus returned %d");
                }
                else
                {
                  if (!(_DWORD)a5)
                  {
LABEL_62:
                    v19 = -1;
                    goto LABEL_63;
                  }
                  v30 = IOServiceMatching("AppleEmbeddedNVMeController");
                  if (v30)
                  {
                    v31 = v30;
                    v47 = v21;
                    v49 = v13;
                    v32 = 0;
                    do
                    {
                      CFRetain(v31);
                      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v31);
                      if (MatchingService)
                        break;
                      v34 = 10 - v32 >= 3 ? 3 : 10 - v32;
                      v35 = CFCopyDescription(v31);
                      CStringPtr = CFStringGetCStringPtr(v35, 0);
                      AMSupportLogInternal(3, "_wait_for_io_service_matching_name", "waiting for matching IOKit service: %s\n", CStringPtr);
                      sleep(v34);
                      v32 += v34;
                      CFRelease(v35);
                    }
                    while (v32 < 0xA);
                    CFRelease(v31);
                    v13 = v49;
                    v21 = v47;
                  }
                  else
                  {
                    AMSupportLogInternal(3, "_wait_for_io_service_matching_name", "unable to create matching dictionary for service '%s'\n", "AppleEmbeddedNVMeController");
                    MatchingService = 0;
                  }
                  v37 = IORegistryEntrySetCFProperty(MatchingService, CFSTR("fw-write-done"), kCFBooleanTrue);
                  if (!v37)
                  {
                    a5 = 0;
                    goto LABEL_62;
                  }
                  AMSupportLogInternal(3, "_flushNAND", "failed to set fw-write-done property: 0x%x\n", v37);
                  AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to flush to NAND");
                }
                a5 = 99;
                goto LABEL_62;
              }
              AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to append terminatorData");
            }
            else
            {
              AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "terminatorData is wrong length.");
            }
          }
          else
          {
            AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to allocate terminatorData");
          }
LABEL_26:
          a5 = 99;
          goto LABEL_63;
        }
        AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Failed to append finalData", v44, v46);
      }
      else
      {
LABEL_70:
        __error();
        AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Unable to seek to jump to offset %lu, errno=%d.");
      }
LABEL_89:
      v21 = 0;
      goto LABEL_26;
    }
    goto LABEL_91;
  }
  v48 = v13;
  v22 = CFStringCompare(theString1, theString, 0);
  v19 = sub_100009940(v5, 1);
  if (v19 < 1)
  {
    v13 = v48;
LABEL_91:
    v39 = __error();
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "unable to open fileHandle: %@, returned %d", v5, *v39);
LABEL_101:
    v21 = 0;
    v5 = 0;
    goto LABEL_26;
  }
  if (v22 == kCFCompareEqualTo)
  {
    v20 = 0;
    v5 = 0;
    goto LABEL_38;
  }
  if (theDataa)
  {
    v23 = v54;
    v24 = CFDataGetLength(theDataa);
    v25 = v53 - (v24 + v23);
    if (v24 + v23)
    {
      if (v53 == v24 + v23)
      {
        AMSupportLogInternal(3, "_copyDataFromHandle", "bytesToCopy is zero", v43);
      }
      else if (lseek(v19, v24 + v23, 0) == v24 + v23)
      {
        v26 = (UInt8 *)malloc(v25);
        if (v26)
        {
          v27 = v26;
          if (read(v19, v26, v25) == v25)
          {
            v28 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v27, v25, kCFAllocatorMalloc);
            if (v28)
            {
              v5 = v28;
              v20 = 1;
LABEL_38:
              v13 = v48;
              goto LABEL_39;
            }
          }
          else
          {
            v41 = __error();
            v42 = strerror(*v41);
            AMSupportLogInternal(3, "_copyDataFromHandle", "read failed: %s", v42);
          }
          AMSupportSafeFree(v27);
        }
        else
        {
          v40 = __error();
          strerror(*v40);
          AMSupportLogInternal(3, "_copyDataFromHandle", "malloc(%d) failed: %s");
        }
      }
      else
      {
        __error();
        AMSupportLogInternal(3, "_copyDataFromHandle", "lseek to %lu failed with %d.");
      }
    }
    else
    {
      AMSupportLogInternal(3, "_copyDataFromHandle", "startByte must be nonzero", v43);
    }
    v13 = v48;
    AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "finalData is NULL", v43, v45);
    goto LABEL_101;
  }
  AMSupportLogInternal(3, "AMRestorePartitionFWCommitData", "Tag found, but CFData returned is NULL");
  v21 = 0;
  v5 = 0;
  a5 = 99;
  v13 = v48;
LABEL_63:
  AMSupportSafeRelease(v21);
  AMSupportSafeRelease(theDataa);
  AMSupportSafeRelease(v5);
  AMSupportSafeRelease(theString1);
  AMSupportSafeRelease(v13);
  if (v19 >= 1)
    close(v19);
  return a5;
}

uint64_t sub_10000A2B8(const __CFData *a1, int a2)
{
  const UInt8 *BytePtr;
  const UInt8 *v5;
  CFIndex Length;
  CFIndex v7;
  CFIndex v8;
  size_t v9;
  ssize_t v10;
  int *v12;

  if (a1)
  {
    if (a2 <= 0)
    {
      AMSupportLogInternal(3, "_flushDataToHandle", "toFile is %d");
    }
    else
    {
      BytePtr = CFDataGetBytePtr(a1);
      if (BytePtr)
      {
        v5 = BytePtr;
        Length = CFDataGetLength(a1);
        v7 = Length;
        if (Length < 1)
        {
          v8 = 0;
LABEL_10:
          if (v8 == v7)
            return 1;
          AMSupportLogInternal(3, "_flushDataToHandle", "Wrote %lu of %lu bytes!");
        }
        else
        {
          v8 = 0;
          v9 = Length;
          while (1)
          {
            v10 = write(a2, v5, v9);
            if (v10 <= 0)
              break;
            v5 += v10;
            v9 -= v10;
            v8 += v10;
            if (v8 >= v7)
              goto LABEL_10;
          }
          v12 = __error();
          strerror(*v12);
          AMSupportLogInternal(3, "_flushDataToHandle", "failed to write to file: %s, attempted %lu bytes, only wrote %lu.");
        }
      }
      else
      {
        AMSupportLogInternal(3, "_flushDataToHandle", "buffer is NULL");
      }
    }
  }
  else
  {
    AMSupportLogInternal(3, "_flushDataToHandle", "inData is NULL");
  }
  return 0;
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}
