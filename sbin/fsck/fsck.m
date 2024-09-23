int *sub_100001FDC(_DWORD *a1)
{
  int *v2;
  io_registry_entry_t v3;
  io_object_t v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  int BootDevice;
  int v8;
  FILE *v9;
  const char *v10;
  char *v11;
  CFStringRef theString;
  CFRange v14;

  theString = 0;
  if (!(_BYTE)dword_100008008)
  {
    v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems/fstab");
    if (v3)
    {
      v4 = v3;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, CFSTR("os_env_type"), kCFAllocatorDefault, 0);
      if (CFProperty)
      {
        v6 = CFProperty;
        v14.length = CFDataGetLength(CFProperty);
        v14.location = 0;
        CFDataGetBytes(v6, v14, (UInt8 *)&dword_100008000);
        CFRelease(v6);
      }
      IOObjectRelease(v4);
      *a1 = dword_100008000;
      BootDevice = APFSContainerGetBootDevice(&theString);
      if (!BootDevice)
      {
LABEL_14:
        v2 = &dword_100008008;
        strcpy((char *)&dword_100008008, "/dev/");
        CFStringGetCString(theString, (char *)&word_10000800C + 1, 27, 0x8000100u);
        CFRelease(theString);
        return v2;
      }
      v8 = 5;
      while (1)
      {
        v9 = __stderrp;
        v10 = dword_100008000 == 1 ? (const char *)&unk_100003A6B : "warning: ";
        v11 = strerror(BootDevice & 0x3FFF);
        fprintf(v9, "%sfailed to get boot device - %s\n", v10, v11);
        if (dword_100008000 == 1)
          break;
        sleep(1u);
        if ((v8 + 1) < 2)
          break;
        fprintf(__stderrp, "Retrying (%d retries left)...\n", v8);
        BootDevice = APFSContainerGetBootDevice(&theString);
        --v8;
        if (!BootDevice)
          goto LABEL_14;
      }
    }
    else
    {
      fwrite("failed to get filesystem info\n", 0x1EuLL, 1uLL, __stderrp);
    }
    return 0;
  }
  *a1 = dword_100008000;
  return &dword_100008008;
}

void start(int a1, char *const *a2)
{
  uint64_t v4;
  int v5;
  int v7;
  int v8;
  __int16 v9;

  sync();
  while (1)
  {
    while (1)
    {
      while (1)
      {
        v4 = getopt(a1, a2, "dfpR:qnNyYl:L");
        if ((int)v4 <= 88)
          break;
        switch((int)v4)
        {
          case 'd':
            ++dword_10000803C;
            continue;
          case 'e':
          case 'g':
          case 'h':
          case 'i':
          case 'j':
          case 'k':
          case 'm':
          case 'o':
            goto LABEL_36;
          case 'f':
            ++dword_100008040;
            continue;
          case 'l':
            dword_100008044 = sub_100002410(108, optarg);
            continue;
          case 'n':
            goto LABEL_10;
          case 'p':
            ++dword_100008028;
            continue;
          case 'q':
            dword_100008048 = 1;
            continue;
          default:
            if ((_DWORD)v4 != 89 && (_DWORD)v4 != 121)
              goto LABEL_36;
            dword_100008058 = 1;
            dword_100008054 = 0;
            break;
        }
      }
      if ((int)v4 <= 77)
        break;
      if ((_DWORD)v4 == 78)
      {
LABEL_10:
        dword_100008054 = 1;
        dword_100008058 = 0;
      }
      else
      {
        if ((_DWORD)v4 != 82)
          goto LABEL_36;
        dword_100008050 = sub_100002410(v4, optarg);
        if ((dword_100008050 - 3) <= 0xFFFFFFFD)
          goto LABEL_35;
      }
    }
    if ((_DWORD)v4 != 76)
    {
      if ((_DWORD)v4 != -1)
LABEL_36:
        errx(8, "%c option?", v4);
      v5 = optind;
      if (signal(2, (void (__cdecl *)(int))1) != (void (__cdecl *)(int))1)
        signal(2, (void (__cdecl *)(int))sub_10000249C);
      if (dword_100008028)
        signal(3, (void (__cdecl *)(int))sub_1000024AC);
      if (v5 == a1)
      {
        if (os_parse_boot_arg_string("auto-boot", &v8, 16))
        {
          if (v8 != 1936482662 || v9 != 101)
            fprintf(__stderrp, "warning: auto-boot is set to %s\n", (const char *)&v8);
        }
        v7 = sub_1000024DC();
        if (dword_10000802C)
          v7 = 2;
        exit(v7);
      }
LABEL_35:
      sub_10000247C();
      exit(22);
    }
    dword_10000804C = 1;
  }
}

uint64_t sub_100002410(uint64_t a1, char *__str)
{
  uint64_t result;
  char *__endptr;

  __endptr = 0;
  result = strtol(__str, &__endptr, 10);
  if (__endptr == __str || *__endptr)
    errx(8, "-%c flag requires a %s", a1, "number");
  return result;
}

size_t sub_10000247C()
{
  return fwrite("fsck usage: fsck [-fdnypqL] [-l number]\n", 0x28uLL, 1uLL, __stderrp);
}

void sub_10000249C()
{
  exit(12);
}

void (__cdecl *sub_1000024AC())(int)
{
  puts("returning to single-user after filesystem check");
  dword_10000802C = 1;
  return signal(3, 0);
}

uint64_t sub_1000024DC()
{
  BOOL v0;
  uint64_t v1;
  const char *v2;
  uint64_t i;
  const char *v4;
  int *v5;
  char *v6;
  char *v7;
  char *v8;
  FILE *v9;
  const char *v10;
  size_t v11;
  _QWORD v13[4];
  _QWORD v14[4];
  int v15;

  if (dword_100008048)
    v0 = dword_100008050 == 0;
  else
    v0 = 0;
  if (v0)
  {
    v15 = 0;
    v5 = sub_100001FDC(&v15);
    if ((v15 & 0xFFFFFFFD) != 1)
    {
      fwrite("fsck: not booting main or diagnostic OS. Skipping fsck on OS container\n", 0x47uLL, 1uLL, __stdoutp);
      return 0;
    }
    if (v5)
    {
      v6 = strdup((const char *)v5);
      if (v6)
      {
        v7 = v6;
        v8 = sub_100002CD8(v6);
        if (v8)
        {
          v14[0] = 0;
          v14[1] = 0;
          v14[2] = v13;
          v14[3] = 0;
          v13[0] = 0;
          v13[1] = v8;
          v13[2] = 0;
          v13[3] = "apfs";
          v1 = sub_100002FC8((uint64_t)v14, 0);
        }
        else
        {
          v1 = 0;
        }
        free(v7);
        return v1;
      }
      v9 = __stderrp;
      v10 = "fsck: failed to copy boot container\n";
      v11 = 36;
    }
    else
    {
      v9 = __stderrp;
      v10 = "fsck: failed to get boot container\n";
      v11 = 35;
    }
    fwrite(v10, v11, 1uLL, v9);
    return 8;
  }
  v1 = sub_1000026D0();
  if (!(_DWORD)v1 && dword_100008028)
  {
    v1 = sub_1000028F8();
    if ((_DWORD)v1)
    {
      if (qword_100008068)
      {
        v2 = *(_QWORD *)qword_100008068 ? "S" : (const char *)&unk_100003A6B;
        fprintf(__stderrp, "THE FOLLOWING FILE SYSTEM%s HAD AN %s\n\t", v2, "UNEXPECTED INCONSISTENCY:");
        for (i = qword_100008068; i; i = *(_QWORD *)i)
        {
          if (*(_QWORD *)i)
            v4 = ", ";
          else
            v4 = "\n";
          fprintf(__stderrp, "%s (%s)%s", *(const char **)(i + 8), *(const char **)(i + 16), v4);
        }
      }
    }
    else
    {
      endfsent();
    }
  }
  return v1;
}

uint64_t sub_1000026D0()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  fstab *v4;
  fstab *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  BOOL v10;
  FILE *v11;
  int *v12;
  unsigned int v14;
  _QWORD v15[3];
  char *fs_vfstype;
  _QWORD v17[4];

  v0 = 0;
  if (dword_100008050 == 2)
    v1 = 2;
  else
    v1 = 1;
  if (dword_100008050 == 1)
    v2 = 1;
  else
    v2 = v1;
  if (dword_100008050 == 1)
    v3 = 1;
  else
    v3 = 2;
  while (setfsent())
  {
    v4 = getfsent();
    if (v4)
    {
      v5 = v4;
      v14 = v0 | 8;
      while (1)
      {
LABEL_13:
        if (!sub_100002BE0((uint64_t)v5))
          goto LABEL_28;
        if (!dword_100008028)
          goto LABEL_18;
        if (v2 != 2)
          break;
        if (v5->fs_passno < 2)
          goto LABEL_28;
        v9 = sub_100002CD8(v5->fs_spec);
        if (v9)
        {
          sub_100003320(v9, v5->fs_file, v5->fs_vfstype);
          goto LABEL_28;
        }
        fprintf(__stderrp, "BAD DISK NAME %s\n", v5->fs_spec);
        v5 = getfsent();
        v0 = v14;
        if (!v5)
        {
          v0 = v14;
          goto LABEL_32;
        }
      }
      if (v2 != 1 || v5->fs_passno != 1)
        goto LABEL_28;
LABEL_18:
      if (!dword_100008050 || v5->fs_passno == dword_100008050)
      {
        v6 = sub_100002CD8(v5->fs_spec);
        if (!v6)
        {
          fprintf(__stderrp, "BAD DISK NAME %s\n");
          return 8;
        }
        v7 = v6;
        if (!strcmp(v6, "ramdisk"))
        {
          fprintf(__stdoutp, "Encountered ramdisk definition for location %s - will be created during mount.\n", v5->fs_file);
        }
        else
        {
          v15[2] = 0;
          fs_vfstype = 0;
          v17[0] = 0;
          v17[1] = 0;
          v17[2] = v15;
          v17[3] = 0;
          v15[0] = 0;
          v15[1] = v7;
          fs_vfstype = v5->fs_vfstype;
          v8 = sub_100002FC8((uint64_t)v17, 0);
          if ((_DWORD)v8)
            return v8;
        }
      }
LABEL_28:
      v5 = getfsent();
      if (!v5)
        goto LABEL_32;
      goto LABEL_13;
    }
LABEL_32:
    if (dword_100008028)
      v10 = v2 == v3;
    else
      v10 = 1;
    ++v2;
    if (v10)
      return v0;
  }
  v11 = __stderrp;
  v12 = __error();
  strerror(*v12);
  fprintf(v11, "Can't get filesystem checklist: %s\n");
  return 8;
}

uint64_t sub_1000028F8()
{
  int v0;
  BOOL v1;
  uint64_t v2;
  int v3;
  uint64_t result;
  BOOL v5;
  pid_t v6;
  pid_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  int v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  int v20;

  v20 = 0;
  v0 = dword_100008044;
  if (dword_100008044)
    v1 = dword_100008044 <= dword_100008038;
  else
    v1 = 0;
  if (!v1)
  {
    dword_100008044 = dword_100008038;
    v0 = dword_100008038;
  }
  v2 = qword_100008060;
  if (v0 < 1)
  {
LABEL_14:
    v6 = wait(&v20);
    if (v6 == -1)
      return 0;
    v7 = v6;
    v8 = 0;
    while (1)
    {
      while (1)
      {
        v9 = qword_100008060;
        if (qword_100008060)
          break;
LABEL_19:
        printf("Unknown pid %d\n", v7);
        v7 = wait(&v20);
        if (v7 == -1)
          return v8;
      }
      while (*(_DWORD *)(v9 + 24) != v7)
      {
        v9 = *(_QWORD *)(v9 + 8);
        if (!v9)
          goto LABEL_19;
      }
      if ((v20 & 0x7F) != 0 && (v20 & 0x7F) != 0x7F)
      {
        printf("%s (%s): EXITED WITH SIGNAL %d\n", *(const char **)(*(_QWORD *)(v9 + 16) + 8), *(const char **)(*(_QWORD *)(v9 + 16) + 16), v20 & 0x7F);
        v10 = 8;
      }
      else
      {
        v10 = BYTE1(v20);
        if ((v20 & 0x7F) != 0 || BYTE1(v20) == 0)
        {
          v12 = *(_QWORD **)(v9 + 16);
          *(_QWORD *)(v9 + 16) = *v12;
          sub_100003478(v12);
          v13 = *(_QWORD *)(v9 + 16);
          goto LABEL_32;
        }
      }
      v14 = qword_100008068;
      v8 = v10 | v8;
      v15 = *(uint64_t **)(v9 + 16);
      qword_100008068 = (uint64_t)v15;
      v13 = *v15;
      *(_QWORD *)(v9 + 16) = *v15;
      if (v14)
        *v15 = v14;
LABEL_32:
      *(_DWORD *)(v9 + 24) = 0;
      v16 = dword_100008034--;
      if (v13)
      {
        if (!v2)
        {
          result = sub_100003414(v9);
          v17 = (_DWORD)result != 0;
          if ((_DWORD)result && dword_100008034 >= 1)
          {
            do
            {
              sleep(0xAu);
              result = sub_100003414(v9);
              v17 = (_DWORD)result != 0;
            }
            while ((_DWORD)result && dword_100008034 > 0);
          }
          if (v17)
            return result;
          v2 = 0;
          goto LABEL_55;
        }
      }
      else
      {
        --dword_100008038;
        if (!v2)
          goto LABEL_55;
      }
      if (v16 <= dword_100008044 && v16 <= dword_100008038)
      {
        do
        {
          if (*(_QWORD *)(v2 + 8))
            v2 = *(_QWORD *)(v2 + 8);
          else
            v2 = qword_100008060;
        }
        while (!*(_QWORD *)(v2 + 16) || *(_DWORD *)(v2 + 24));
        result = sub_100003414(v2);
        v18 = (_DWORD)result != 0;
        if ((_DWORD)result)
          v19 = dword_100008034 < 1;
        else
          v19 = 1;
        if (!v19)
        {
          do
          {
            sleep(0xAu);
            result = sub_100003414(v2);
            v18 = (_DWORD)result != 0;
          }
          while ((_DWORD)result && dword_100008034 > 0);
        }
        if (v18)
          return result;
      }
LABEL_55:
      v7 = wait(&v20);
      result = v8;
      if (v7 == -1)
        return result;
    }
  }
  v3 = 0;
  while (1)
  {
    result = sub_100003414(v2);
    v5 = (_DWORD)result != 0;
    if ((_DWORD)result && dword_100008034 >= 1)
    {
      do
      {
        sleep(0xAu);
        result = sub_100003414(v2);
        v5 = (_DWORD)result != 0;
      }
      while ((_DWORD)result && dword_100008034 > 0);
    }
    if (v5)
      return result;
    ++v3;
    v2 = *(_QWORD *)(v2 + 8);
    if (v3 >= dword_100008044)
      goto LABEL_14;
  }
}

uint64_t sub_100002BE0(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const char *v4;
  uint64_t result;

  v2 = *(const char **)(a1 + 16);
  if (strcmp(v2, "apfs") && strcmp(v2, "hfs") && strcmp(v2, "msdos") && strcmp(v2, "exfat") && strcmp(v2, "udf"))
    return 0;
  v3 = *(const char **)(a1 + 32);
  if (strcmp(v3, "rw"))
  {
    if (strcmp(v3, "ro"))
      return 0;
  }
  if (!*(_DWORD *)(a1 + 44))
    return 0;
  v4 = *(const char **)a1;
  result = strncmp(v4, "LABEL=", 6uLL);
  if ((_DWORD)result)
    return strncmp(v4, "UUID=", 5uLL) != 0;
  return result;
}

char *sub_100002CD8(char *a1)
{
  char i;
  int v3;
  int v4;
  int v5;
  time_t v6;
  time_t v7;
  const char *v9;
  int *v10;
  int *v11;
  timespec timeout;
  kevent eventlist;
  kevent changelist;
  stat v15;
  stat v16;
  stat v17;

  memset(&v17, 0, sizeof(v17));
  memset(&v16, 0, sizeof(v16));
  memset(&v15, 0, sizeof(v15));
  memset(&changelist, 0, sizeof(changelist));
  memset(&eventlist, 0, sizeof(eventlist));
  timeout.tv_sec = 0;
  timeout.tv_nsec = 0;
  dword_100008030 = 0;
  if (stat("/", &v17) < 0)
  {
    sub_100003778();
  }
  else if (!strcmp(a1, "ramdisk"))
  {
    fwrite("Encountered ramdisk definition. Do not stat\n", 0x2CuLL, 1uLL, __stdoutp);
  }
  else
  {
    for (i = 0; ; i = 1)
    {
      if (stat(a1, &v16) < 0)
      {
        v4 = kqueue();
        if (v4 < 0)
        {
          v10 = __error();
          printf("kqueue: could not create kqueue: %d\n", *v10);
          printf("Can't stat %s\n");
        }
        else
        {
          v5 = v4;
          changelist.ident = open("/dev/", 0);
          *(_QWORD *)&changelist.filter = 0x20025FFFCLL;
          changelist.data = 0;
          changelist.udata = 0;
          if (kevent(v5, &changelist, 1, 0, 0, 0))
          {
            v11 = __error();
            printf("kevent() failed to register: %d\n", *v11);
            printf("Can't stat %s\n", a1);
            close(v5);
          }
          else
          {
            v6 = time(0) + 30;
            timeout.tv_nsec = 0;
            while (1)
            {
              v7 = time(0);
              if (v6 <= v7)
                break;
              timeout.tv_sec = v6 - v7;
              kevent(v5, 0, 0, &eventlist, 1, &timeout);
              if ((eventlist.flags & 0x4000) != 0)
              {
                puts("kevent: registered errors.");
                break;
              }
              if (!stat(a1, &v16))
              {
                close(v5);
                goto LABEL_5;
              }
            }
            close(v5);
            printf("fsck timed out. Can't stat %s\n");
          }
        }
        return 0;
      }
LABEL_5:
      v3 = v16.st_mode & 0xF000;
      if (v3 == 24576)
        break;
      if (i & 1 | (v3 != 0x2000))
        return 0;
      sub_10000357C(a1);
    }
    if (v17.st_dev == v16.st_rdev)
      ++dword_100008030;
    v9 = (const char *)sub_1000034E8(a1);
    if (stat(v9, &v15) < 0)
    {
      perror(v9);
      printf("Can't stat %s\n");
    }
    else if ((v15.st_mode & 0xF000) == 0x2000)
    {
      return (char *)v9;
    }
    else
    {
      printf("%s is not a character device\n");
    }
  }
  return a1;
}

uint64_t sub_100002FC8(uint64_t a1, int a2)
{
  uint64_t v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  int v12;
  uint64_t result;
  pid_t v14;
  int v15;
  stat v16;
  char __path[1025];
  char v18[255];
  char __str[16];
  char *__argv;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 16);
  v22 = 0;
  v21 = 0;
  v23 = 0;
  memset(&v16, 0, sizeof(v16));
  v3 = *(const char **)(v2 + 8);
  v4 = *(const char **)(v2 + 24);
  if (a2 && dword_100008028)
    signal(3, (void (__cdecl *)(int))sub_1000034BC);
  if (!strcmp(v3, "ramdisk"))
  {
    fwrite("No need to check filesys for ramdisk, does not exist yet.\n", 0x3AuLL, 1uLL, __stdoutp);
    return 0;
  }
  if (!v4)
    goto LABEL_31;
  v15 = 0;
  *(_QWORD *)__str = 0;
  __str[8] = 0;
  v5 = (const char *)&unk_100003A6B;
  if (dword_100008028)
    v6 = "p";
  else
    v6 = (const char *)&unk_100003A6B;
  if (dword_10000803C)
    v7 = "d";
  else
    v7 = (const char *)&unk_100003A6B;
  if (dword_100008040)
    v8 = "f";
  else
    v8 = (const char *)&unk_100003A6B;
  if (dword_100008054)
    v9 = "n";
  else
    v9 = (const char *)&unk_100003A6B;
  if (dword_100008058)
    v10 = "y";
  else
    v10 = (const char *)&unk_100003A6B;
  if (dword_100008048)
    v11 = "q";
  else
    v11 = (const char *)&unk_100003A6B;
  if (dword_10000804C)
    v5 = "l";
  snprintf(__str, 9uLL, "-%s%s%s%s%s%s%s", v6, v7, v8, v9, v10, v11, v5);
  snprintf(v18, 0xFFuLL, "fsck_%s", v4);
  __argv = v18;
  if (strlen(__str) < 2)
  {
    v12 = 1;
  }
  else
  {
    v21 = __str;
    v12 = 2;
  }
  (&__argv)[v12] = (char *)v3;
  (&__argv)[v12 + 1] = 0;
  snprintf(__path, 0x401uLL, "%s/fsck_%s", "/sbin", v4);
  if (stat(__path, &v16))
  {
LABEL_31:
    fwrite("Filesystem cannot be checked \n", 0x1EuLL, 1uLL, __stderrp);
    return 8;
  }
  v14 = fork();
  if (v14 == -1)
  {
    fprintf(__stderrp, "fork failed for %s \n", v3);
    if (dword_100008028)
    {
      fprintf(__stderrp, "\n%s: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.\n", v3);
      exit(8);
    }
    return 8;
  }
  if (!v14)
  {
    if (dword_100008028)
      signal(3, (void (__cdecl *)(int))sub_1000034BC);
    execv(__path, &__argv);
    fprintf(__stderrp, "error attempting to exec %s\n", __path);
    _exit(8);
  }
  waitpid(v14, &v15, 0);
  if ((v15 & 0x7F) != 0)
    result = 0;
  else
    result = BYTE1(v15);
  if ((v15 & 0x7F) != 0 && (v15 & 0x7F) != 0x7F)
  {
    printf("%s (%s) EXITED WITH SIGNAL %d\n", v3, v4, v15 & 0x7F);
    return 8;
  }
  return result;
}

char *sub_100003320(char *a1, const char *a2, const char *a3)
{
  const char **v6;
  const char *v7;
  char *result;
  const char *v9;
  const char *v10;
  char *v11;
  char *v12;

  v6 = sub_100003620(a1) + 2;
  while (1)
  {
    v7 = *v6;
    if (!*v6)
      break;
    v6 = (const char **)*v6;
    if (!strcmp(*((const char **)v7 + 1), a1))
      return (char *)printf("%s in fstab more than once!\n", a1);
  }
  v9 = (const char *)malloc_type_malloc(0x20uLL, 0x30040E3C0B0CCuLL);
  *v6 = v9;
  if (!v9)
    goto LABEL_9;
  v10 = v9;
  v11 = strdup(a1);
  *((_QWORD *)v10 + 1) = v11;
  if (!v11
    || (v12 = strdup(a2), (*((_QWORD *)v10 + 2) = v12) == 0)
    || (*(_QWORD *)v10 = 0, result = strdup(a3), (*((_QWORD *)v10 + 3) = result) == 0))
  {
LABEL_9:
    fwrite("out of memory", 0xDuLL, 1uLL, __stderrp);
    exit(8);
  }
  return result;
}

uint64_t sub_100003414(uint64_t a1)
{
  pid_t v2;
  uint64_t result;
  int v4;

  v2 = fork();
  *(_DWORD *)(a1 + 24) = v2;
  if (v2 < 0)
  {
    perror("fork");
    return 8;
  }
  else
  {
    if (!v2)
    {
      v4 = sub_100002FC8(a1, 1);
      exit(v4);
    }
    result = 0;
    ++dword_100008034;
  }
  return result;
}

void sub_100003478(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[1];
  if (v2)
    free(v2);
  v3 = (void *)a1[2];
  if (v3)
    free(v3);
  v4 = (void *)a1[3];
  if (v4)
    free(v4);
  free(a1);
}

void (__cdecl *sub_1000034BC())(int)
{
  sleep(1u);
  signal(3, (void (__cdecl *)(int))1);
  return signal(3, 0);
}

void *sub_1000034E8(char *a1)
{
  char *v2;
  char *v3;
  void *v4;

  v2 = strrchr(a1, 47);
  if (!v2)
    return 0;
  v3 = v2;
  *v2 = 0;
  v4 = &unk_100008070;
  __strlcpy_chk(&unk_100008070, a1, 32, 32);
  *v3 = 47;
  __strlcat_chk(&unk_100008070, "/r", 32, 32);
  __strlcat_chk(&unk_100008070, v3 + 1, 32, 32);
  return v4;
}

char *sub_10000357C(char *a1)
{
  char *v2;
  char *v3;
  void *v4;
  const char *v5;
  size_t v6;
  stat v8;

  v2 = strrchr(a1, 47);
  if (v2)
  {
    v3 = v2;
    memset(&v8, 0, sizeof(v8));
    if ((stat(a1, &v8) & 0x80000000) == 0 && (v8.st_mode & 0xF000) == 0x2000)
    {
      v4 = v3 + 1;
      if (v3[1] == 114)
      {
        v5 = v3 + 2;
        v6 = strlen(v5);
        memmove(v4, v5, v6 + 1);
      }
    }
  }
  return a1;
}

const char **sub_100003620(char *a1)
{
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t *v11;
  const char **v12;
  const char **v13;
  const char *v14;
  const char **v15;
  char *v16;

  v2 = strrchr(a1, 47);
  if (v2)
    v3 = v2 + 1;
  else
    v3 = a1;
  v4 = &v3[~(unint64_t)a1];
  do
  {
    v5 = (size_t)v4;
    v6 = *v3++;
    v7 = v6 - 58;
    ++v4;
    if (v6)
      v8 = v7 >= 0xFFFFFFF6;
    else
      v8 = 1;
  }
  while (!v8);
  v9 = -1;
  do
  {
    v10 = v3[v9] - 48;
    ++v5;
    ++v9;
  }
  while (v10 < 0xA);
  if (!v5)
    v5 = strlen(a1);
  v11 = &qword_100008060;
  v12 = (const char **)qword_100008060;
  if (qword_100008060)
  {
    while (1)
    {
      v13 = v12;
      v14 = *v12;
      if (!strncmp(*v12, a1, v5) && !v14[v5])
        break;
      v12 = (const char **)v13[1];
      if (!v12)
      {
        v11 = (uint64_t *)(v13 + 1);
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v15 = (const char **)malloc_type_malloc(0x20uLL, 0x10300407DFA817CuLL);
    *v11 = (uint64_t)v15;
    if (!v15 || (v13 = v15, v16 = (char *)malloc_type_malloc(v5 + 1, 0x23CC5CECuLL), (*v13 = v16) == 0))
    {
      fwrite("out of memory", 0xDuLL, 1uLL, __stderrp);
      exit(8);
    }
    strncpy(v16, a1, v5);
    (*v13)[v5] = 0;
    v13[1] = 0;
    v13[2] = 0;
    *((_DWORD *)v13 + 6) = 0;
    ++dword_100008038;
  }
  return v13;
}

uint64_t sub_100003778()
{
  perror("/");
  return puts("Can't stat root");
}
