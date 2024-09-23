uint64_t sub_10000355C()
{
  uint64_t result;
  passwd *v1;
  gid_t pw_gid;
  uid_t pw_uid;

  result = access("/AppleInternal", 0);
  dword_10000C000 = result == 0;
  if (!(_DWORD)result)
  {
    v1 = getpwnam("mobile");
    if (v1)
    {
      pw_uid = v1->pw_uid;
      pw_gid = v1->pw_gid;
    }
    else
    {
      pw_gid = 501;
      pw_uid = 501;
    }
    mkdir("/var/mobile/Library/Logs/MobileBackup", 0x1C0u);
    chown("/var/mobile/Library/Logs/MobileBackup", pw_uid, pw_gid);
    qword_10000C008 = (uint64_t)fopen("/var/mobile/Library/Logs/MobileBackup/FinishRestoreFromBackup.log", "a");
    return chown("/var/mobile/Library/Logs/MobileBackup/FinishRestoreFromBackup.log", pw_uid, pw_gid);
  }
  return result;
}

uint64_t sub_100003620()
{
  uint64_t result;

  result = qword_10000C008;
  if (qword_10000C008)
    return fflush((FILE *)qword_10000C008);
  return result;
}

uint64_t sub_100003634(char *a1, ...)
{
  uint64_t result;
  va_list va;

  va_start(va, a1);
  result = qword_10000C008;
  if (qword_10000C008)
    return vfprintf((FILE *)qword_10000C008, a1, va);
  return result;
}

uint64_t sub_10000366C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  FILE *v6;
  int *v7;
  char *v8;
  int *v9;
  va_list va;

  va_start(va, a5);
  if (!(_DWORD)result)
  {
    if (qword_10000C008)
      vfprintf((FILE *)qword_10000C008, a5, va);
    sub_100003634("\n");
    if (qword_10000C008)
      fflush((FILE *)qword_10000C008);
    vfprintf(__stderrp, a5, va);
    fputc(10, __stderrp);
    if (dword_10000C000)
    {
      vsnprintf(byte_10000C1A0, 0xC8uLL, a5, va);
      byte_10000C267 = 0;
      snprintf(byte_10000C010, 0x190uLL, "FinishRestoreFromBackup, %s/%s failed with error %d (%s)");
    }
    else
    {
      snprintf(byte_10000C010, 0x190uLL, "FinishRestoreFromBackup, %s/%s failed with error %d");
    }
    byte_10000C19F = 0;
    fprintf(__stderrp, "%s\n\n", byte_10000C010);
    fflush(__stderrp);
    sub_1000037F4();
    sleep(1u);
    if (reboot_np(2048, byte_10000C010))
    {
      v6 = __stderrp;
      v7 = __error();
      v8 = strerror(*v7);
      v9 = __error();
      fprintf(v6, "reboot_np failed: %s (%d)\n\n", v8, *v9);
      fflush(__stderrp);
    }
    result = _os_crash("reboot_np failed");
    __break(1u);
  }
  return result;
}

uint64_t sub_1000037F4()
{
  io_registry_entry_t v1;
  io_registry_entry_t v2;
  kern_return_t v3;
  const char *v4;
  const char *v5;
  mach_port_t mainPort;

  mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort))
    return sub_100003634("Could not get main port\n");
  v1 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v1)
    return sub_100003634("Could not get options entry from the device tree\n");
  v2 = v1;
  v3 = IORegistryEntrySetCFProperty(v1, CFSTR("oblit-inprogress"), CFSTR("0"));
  if (v3)
    v4 = "Failed";
  else
    v4 = "Succeeded";
  sub_100003634("%s setting the property %s to value %s", v4, "oblit-inprogress", "0");
  if (!v3)
  {
    if (IORegistryEntrySetCFProperty(v2, CFSTR("IONVRAM-FORCESYNCNOW-PROPERTY"), CFSTR("0")))
      v5 = "Failed";
    else
      v5 = "Succeeded";
    sub_100003634("%s setting the property %s to value %s", v5, "IONVRAM-FORCESYNCNOW-PROPERTY", "0");
  }
  return IOObjectRelease(v2);
}

char *sub_100003910(const char *a1, const char *a2)
{
  size_t v4;
  size_t v5;
  char *v6;
  int *v7;
  char *v8;

  sub_10000366C(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"copy_string_by_appending_path", (uint64_t)"copy_string_by_appending_path", "base cannot be NULL");
  sub_10000366C(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"copy_string_by_appending_path", (uint64_t)"copy_string_by_appending_path", "extra cannot be NULL");
  v4 = strlen(a1);
  v5 = strlen(a2);
  v6 = (char *)malloc_type_malloc(v4 + v5 + 2, 0x49D4F125uLL);
  v7 = __error();
  sub_10000366C(v6 != 0, *v7, (uint64_t)"copy_string_by_appending_path", (uint64_t)"malloc", "malloc failed");
  if (!v6)
    sub_100006254();
  v8 = strcpy(v6, a1);
  *(_WORD *)&v6[strlen(v8)] = 47;
  return strcat(v6, a2);
}

_QWORD *sub_100003A08()
{
  void *v0;
  int *v1;
  _QWORD *v2;
  int *v3;

  v0 = malloc_type_calloc(0x80uLL, 8uLL, 0x10040436913F5uLL);
  v1 = __error();
  sub_10000366C(v0 != 0, *v1, (uint64_t)"name_list_new", (uint64_t)"calloc", "calloc failed");
  v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x108004019856BD9uLL);
  v3 = __error();
  sub_10000366C(v2 != 0, *v3, (uint64_t)"name_list_new", (uint64_t)"calloc", "calloc failed");
  if (!v2)
    sub_10000627C();
  v2[3] = v0;
  *v2 = 128;
  return v2;
}

uint64_t sub_100003AE8(uint64_t *a1, const char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int *v10;
  char *v11;
  int *v12;
  uint64_t result;

  sub_10000366C(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", (uint64_t)"name_list_add", "list cannot be NULL");
  sub_10000366C(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", (uint64_t)"name_list_add", "name cannot be NULL");
  sub_10000366C(a3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_add", (uint64_t)"name_list_add", "nameSize cannot be zero");
  if (!a1)
    sub_1000062CC();
  v6 = *a1;
  v7 = a1[1];
  if (v7 + 1 >= *a1)
  {
    v8 = v6 + 128;
    v9 = malloc_type_realloc((void *)a1[3], 8 * (v6 + 128), 0x76080808uLL);
    v10 = __error();
    sub_10000366C(v9 != 0, *v10, (uint64_t)"name_list_add", (uint64_t)"realloc", "realloc failed");
    if (!v9)
      sub_1000062A4();
    a1[3] = (uint64_t)v9;
    *a1 = v8;
  }
  v11 = strndup(a2, a3 + 1);
  v12 = __error();
  result = sub_10000366C(v11 != 0, *v12, (uint64_t)"name_list_add", (uint64_t)"strndup", "strndup failed");
  *(_QWORD *)(a1[3] + 8 * v7) = v11;
  a1[1] = v7 + 1;
  return result;
}

uint64_t sub_100003C4C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_10000366C(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_next_item", (uint64_t)"name_list_next_item", "list cannot be NULL");
  if (!a1)
    sub_1000062F4();
  v2 = a1[2];
  if (v2 >= a1[1])
    return 0;
  v3 = *(_QWORD *)(a1[3] + 8 * v2);
  sub_10000366C(v3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_next_item", (uint64_t)"name_list_next_item", "couldn't find entry");
  ++a1[2];
  return v3;
}

void sub_100003CE4(_QWORD *a1)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v5;

  sub_10000366C(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_free", (uint64_t)"name_list_free", "list cannot be NULL");
  if (!a1)
    sub_10000631C();
  v2 = a1[1];
  v3 = (void **)a1[3];
  free(a1);
  if (v2)
  {
    v4 = v3;
    do
    {
      v5 = *v4++;
      free(v5);
      --v2;
    }
    while (v2);
  }
  free(v3);
}

uint64_t sub_100003D60(const char *a1, uint64_t *a2, uint64_t *a3)
{
  DIR *v6;
  uint64_t v7;
  int *v8;
  char *v9;
  int *v10;
  dirent *v11;
  dirent *v12;
  uint64_t *v13;

  sub_10000366C(a1 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", (uint64_t)"name_list_read_dir", "path cannot be NULL");
  sub_10000366C(a2 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", (uint64_t)"name_list_read_dir", "dir_names cannot be NULL");
  sub_10000366C(a3 != 0, 0xFFFFFFFFLL, (uint64_t)"name_list_read_dir", (uint64_t)"name_list_read_dir", "file_names cannot be NULL");
  v6 = opendir(a1);
  v7 = *__error();
  v8 = __error();
  v9 = strerror(*v8);
  v10 = __error();
  sub_10000366C(v6 != 0, v7, (uint64_t)"name_list_read_dir", (uint64_t)"opendir", "opendir(\"%s\") failed: %s (%d)", a1, v9, *v10);
  v11 = readdir(v6);
  if (v11)
  {
    v12 = v11;
    do
    {
      if (strcmp(v12->d_name, ".") && strcmp(v12->d_name, ".."))
      {
        if ((v12->d_type & 4) != 0)
          v13 = a2;
        else
          v13 = a3;
        sub_100003AE8(v13, v12->d_name, v12->d_namlen);
      }
      v12 = readdir(v6);
    }
    while (v12);
  }
  return closedir(v6);
}

uint64_t sub_100003ED8(const char *a1)
{
  _BOOL8 v2;
  uint64_t v3;
  int *v4;
  char *v5;
  const char *v6;
  char *v7;
  uint64_t result;
  uint64_t st_flags;
  unsigned int v10;
  BOOL v11;
  int *v12;
  int v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  const char *v17;
  char *v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  int *v22;
  uint64_t v23;
  int *v24;
  int *v25;
  int *v26;
  uint64_t v27;
  stat v28;

  memset(&v28, 0, sizeof(v28));
  if (lstat(a1, &v28))
  {
    v2 = *__error() == 2;
    v3 = *__error();
    v4 = __error();
    v5 = strerror(*v4);
    v27 = *__error();
    v6 = "lstat";
    v7 = "lstat(\"%s\") failed: %s (%d)";
    return sub_10000366C(v2, v3, (uint64_t)"remove_item_at_path", (uint64_t)v6, v7, a1, v5, v27);
  }
  st_flags = v28.st_flags;
  sub_100003634("remove item \"%s\" (0x%lx)\n", a1, v28.st_flags);
  if ((st_flags & 0x20002) == 0)
  {
    v10 = st_flags;
    if ((st_flags & 0x40004) == 0)
      goto LABEL_13;
    goto LABEL_10;
  }
  v10 = st_flags & 0xFFFDFFFD;
  sub_100003634("removing the immutable flag for \"%s\" (0x%lx)\n", a1, st_flags & 0xFFFDFFFDFFFDFFFDLL);
  v11 = (st_flags & 0x40004) == 0;
  LODWORD(st_flags) = st_flags & 0xFFFDFFFD;
  if (!v11)
  {
LABEL_10:
    v10 = st_flags & 0xFFFBFFFB;
    sub_100003634("removing the append flag for \"%s\" (0x%lx)\n", a1, st_flags & 0xFFFBFFFB);
  }
  if (lchflags(a1, v10 & 0x3FFFFFFF))
  {
    v12 = __error();
    sub_100003634("lchflags failed at \"%s\" (0x%lx): %d", a1, v10, *v12);
  }
LABEL_13:
  v13 = v28.st_mode & 0xF000;
  if ((v10 & 0x40000000) != 0)
  {
    if (v13 == 0x4000)
    {
      v2 = rmdir(a1) == 0;
      v3 = *__error();
      v24 = __error();
      v5 = strerror(*v24);
      v27 = *__error();
      v6 = "rmdir";
      v7 = "rmdir(\"%s\") failed (SF_DATALESS): %s (%d)";
    }
    else
    {
      v2 = unlink(a1) == 0;
      v3 = *__error();
      v26 = __error();
      v5 = strerror(*v26);
      v27 = *__error();
      v6 = "unlink";
      v7 = "unlink(\"%s\") failed (SF_DATALESS): %s (%d)";
    }
    return sub_10000366C(v2, v3, (uint64_t)"remove_item_at_path", (uint64_t)v6, v7, a1, v5, v27);
  }
  if (v13 != 0x4000)
  {
    v2 = unlink(a1) == 0;
    v3 = *__error();
    v25 = __error();
    v5 = strerror(*v25);
    v27 = *__error();
    v6 = "unlink";
    v7 = "unlink(\"%s\") failed: %s (%d)";
    return sub_10000366C(v2, v3, (uint64_t)"remove_item_at_path", (uint64_t)v6, v7, a1, v5, v27);
  }
  v14 = sub_100003A08();
  v15 = sub_100003A08();
  sub_100003D60(a1, v14, v15);
  v16 = sub_100003C4C(v14);
  if (v16)
  {
    v17 = (const char *)v16;
    do
    {
      v18 = sub_100003910(a1, v17);
      ((void (*)(void))sub_100003ED8)();
      free(v18);
      v17 = (const char *)sub_100003C4C(v14);
    }
    while (v17);
  }
  v19 = sub_100003C4C(v15);
  if (v19)
  {
    v20 = (const char *)v19;
    do
    {
      v21 = sub_100003910(a1, v20);
      if (unlink(v21))
        sub_100003ED8(v21);
      free(v21);
      v20 = (const char *)sub_100003C4C(v15);
    }
    while (v20);
  }
  sub_100003CE4(v14);
  sub_100003CE4(v15);
  result = rmdir(a1);
  if ((_DWORD)result)
  {
    v22 = __error();
    v23 = *v22;
    sub_100003634("rmdir failed at %s: %d\n", a1, *v22);
    fprintf(__stderrp, "rmdir failed at %s: %d\n", a1, v23);
    if ((_DWORD)v23 != 1
      || (result = strcmp(a1, "/private/var/mobile/Library/Application Support/CloudDocs"), (_DWORD)result))
    {
      strerror(v23);
      return sub_10000366C(0, v23, (uint64_t)"remove_item_at_path", (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)");
    }
  }
  return result;
}

BOOL sub_100004258(const char *a1, const char *a2)
{
  _BOOL8 v5;
  uint64_t v6;
  int *v7;
  char *v8;
  int *v9;
  char __s1[8];
  uint64_t v11;

  *(_QWORD *)__s1 = 0;
  v11 = 0;
  if (sub_100004340(a1, __s1))
    return strncmp(__s1, a2, 0x10uLL) == 0;
  v5 = *__error() == 93;
  v6 = *__error();
  v7 = __error();
  v8 = strerror(*v7);
  v9 = __error();
  sub_10000366C(v5, v6, (uint64_t)"item_has_annotation", (uint64_t)"getxattr", "getxattr(\"%s\") failed: %s (%d)", a1, v8, *v9);
  return 0;
}

uint64_t sub_100004340(const char *a1, void *value)
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  int *v6;
  char *v7;
  int *v8;

  v3 = 1;
  if (getxattr(a1, "MBRestoreAnnotation", value, 0x10uLL, 0, 1) < 0)
  {
    v4 = *__error() == 93;
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    v8 = __error();
    sub_10000366C(v4, v5, (uint64_t)"item_annotation", (uint64_t)"getxattr", "getxattr(\"%s\") failed: %s (%d)", a1, v7, *v8);
    return 0;
  }
  return v3;
}

uint64_t sub_1000043F4(const char *a1)
{
  _BOOL8 v2;
  uint64_t v3;
  int *v4;
  char *v5;
  int *v6;

  v2 = removexattr(a1, "MBRestoreAnnotation", 1) == 0;
  v3 = *__error();
  v4 = __error();
  v5 = strerror(*v4);
  v6 = __error();
  return sub_10000366C(v2, v3, (uint64_t)"remove_annotation_from_item", (uint64_t)"removexattr", "removexattr(\"%s\") failed: %s (%d)", a1, v5, *v6);
}

void sub_100004484(const char *a1, const char *a2, uint64_t a3)
{
  _BOOL8 v6;
  uint64_t v7;
  int *v8;
  char *v9;
  int *v10;
  uint64_t *v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  char *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  char *v21;
  _BOOL8 v22;
  uint64_t v23;
  int *v24;
  char *v25;
  int *v26;
  size_t v27;
  uint64_t v28;
  const char *v29;
  std::__fs::filesystem::path *v30;
  std::__fs::filesystem::path *v31;
  std::error_code *v35;
  int v36;
  uint64_t v37;
  int *v38;
  _BOOL8 v39;
  uint64_t v40;
  int *v41;
  int *v42;
  stat v43;
  stat value;

  memset(&v43, 0, sizeof(v43));
  if (lstat(a1, &v43))
  {
    v6 = *__error() == 2;
    v7 = *__error();
    v8 = __error();
    v9 = strerror(*v8);
    v10 = __error();
    sub_10000366C(v6, v7, (uint64_t)"merge_restore_path_to_root", (uint64_t)"lstat", "lstat(\"%s\") failed: %s (%d)", a1, v9, *v10);
  }
  else if ((v43.st_flags & 0x80) != 0)
  {
    if (chflags(a2, v43.st_flags) < 0)
      sub_100003634("Couldn't chflags datavault bits onto directory %s\n");
    else
      sub_100003634("Setting BSD flag bits 0x%x on root dir %s\n");
  }
  sub_100003634("merge \"%s\" into \"%s\"\n", a1, a2);
  if (sub_100004258(a1, "RestoreRoot"))
  {
    sub_100003634("cleaning \"%s\"\n", a1);
    sub_1000043F4(a1);
    a3 = 1;
  }
  else if (!(_DWORD)a3)
  {
    goto LABEL_16;
  }
  v11 = sub_100003A08();
  sub_100003D60(a2, v11, v11);
  v12 = sub_100003C4C(v11);
  if (v12)
  {
    v13 = (const char *)v12;
    do
    {
      v14 = sub_100003910(a1, v13);
      v15 = sub_100003910(a2, v13);
      memset(&value, 0, sizeof(value));
      if (lstat(v14, &value))
      {
        sub_100003634("not restored \"%s\"\n", v15);
        sub_100003ED8(v15);
      }
      free(v14);
      free(v15);
      v13 = (const char *)sub_100003C4C(v11);
    }
    while (v13);
  }
  sub_100003CE4(v11);
LABEL_16:
  v16 = sub_100003A08();
  v17 = sub_100003A08();
  sub_100003D60(a1, v16, v17);
  v18 = sub_100003C4C(v16);
  if (v18)
  {
    v19 = (const char *)v18;
    do
    {
      v20 = sub_100003910(a1, v19);
      v21 = sub_100003910(a2, v19);
      memset(&value, 0, sizeof(value));
      if (lstat(v21, &value) || (value.st_mode & 0xF000) != 0x4000 || (value.st_flags & 0x40000000) != 0)
      {
        v27 = strlen(v19);
        sub_100003AE8(v17, v19, v27);
      }
      else
      {
        sub_100004484(v20, v21, a3);
        v22 = rmdir(v20) == 0;
        v23 = *__error();
        v24 = __error();
        v25 = strerror(*v24);
        v26 = __error();
        sub_10000366C(v22, v23, (uint64_t)"merge_restore_path_to_root", (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)", v20, v25, *v26);
      }
      free(v20);
      free(v21);
      v19 = (const char *)sub_100003C4C(v16);
    }
    while (v19);
  }
  v28 = sub_100003C4C(v17);
  if (v28)
  {
    v29 = (const char *)v28;
    while (1)
    {
      v30 = (std::__fs::filesystem::path *)sub_100003910(a1, v29);
      v31 = (std::__fs::filesystem::path *)sub_100003910(a2, v29);
      *(_QWORD *)&value.st_dev = 0;
      value.st_ino = 0;
      sub_100004340((const char *)v30, &value);
      if (*(_QWORD *)&value.st_dev == 0x6F74736552746F4ELL && LODWORD(value.st_ino) == 6579570)
        break;
      if (*(_QWORD *)&value.st_dev == 0x656B636142746F4ELL && LODWORD(value.st_ino) == 7361892)
      {
        sub_100003634("not backed up \"%s\"\n", (const char *)v31);
        goto LABEL_44;
      }
      if (*(_QWORD *)&value.st_dev == 0x64656D7265746E49
        && *(_QWORD *)((char *)&value.st_mode + 1) == 0x6574616964656DLL)
      {
        sub_100003634("intermediate \"%s\"\n");
LABEL_48:
        sub_100003ED8((const char *)v30);
        goto LABEL_45;
      }
      sub_100003634("restored \"%s\"\n", (const char *)v31);
      sub_100003ED8((const char *)v31);
      sub_100004A6C((const char *)v30);
      sub_100003634("move \"%s\" to \"%s\"\n", (const char *)v30, (const char *)v31);
      rename(v30, v31, v35);
      if (v36)
      {
        if (*__error() == 30 && !strncmp((const char *)v31, "/private/private", 0x10uLL))
        {
          v42 = __error();
          strerror(*v42);
          __error();
          sub_100003634("rename(\"%s\", \"%s\") failed: %s (%d), skipping\n");
          goto LABEL_48;
        }
        v37 = *__error();
        v38 = __error();
        strerror(*v38);
        __error();
        sub_10000366C(0, v37, (uint64_t)"move_item_to_path", (uint64_t)"rename", "rename(\"%s\", \"%s\") failed: %s (%d)", v30);
      }
LABEL_45:
      free(v30);
      free(v31);
      v29 = (const char *)sub_100003C4C(v17);
      if (!v29)
        goto LABEL_50;
    }
    sub_100003634("not restored \"%s\"\n", (const char *)v31);
    sub_100003ED8((const char *)v31);
LABEL_44:
    v39 = unlink((const char *)v30) == 0;
    v40 = *__error();
    v41 = __error();
    strerror(*v41);
    __error();
    sub_10000366C(v39, v40, (uint64_t)"merge_restore_path_to_root", (uint64_t)"unlink", "unlink(\"%s\") failed: %s (%d)");
    goto LABEL_45;
  }
LABEL_50:
  sub_100003CE4(v16);
  sub_100003CE4(v17);
}

void sub_100004A6C(const char *a1)
{
  BOOL v2;
  BOOL v3;
  uint64_t *v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  _BOOL8 v10;
  uint64_t v11;
  int *v12;
  char *v13;
  int *v14;
  stat v15;
  __int128 value;

  value = 0uLL;
  sub_100004340(a1, &value);
  v2 = (_QWORD)value == 0x6F74736552746F4ELL && DWORD2(value) == 6579570;
  if (v2 || ((_QWORD)value == 0x656B636142746F4ELL ? (v3 = DWORD2(value) == 7361892) : (v3 = 0), v3))
  {
    sub_100003634("removing empty annotation file \"%s\"\n", a1);
    v10 = unlink(a1) == 0;
    v11 = *__error();
    v12 = __error();
    v13 = strerror(*v12);
    v14 = __error();
    sub_10000366C(v10, v11, (uint64_t)"recursively_remove_annotations_from_item", (uint64_t)"unlink", "unlink(\"%s\") failed: %s (%d)", a1, v13, *v14);
  }
  else if ((_QWORD)value == 0x64656D7265746E49 && *(_QWORD *)((char *)&value + 5) == 0x6574616964656DLL)
  {
    sub_100003634("removing intermediate annotation directory \"%s\"\n", a1);
    sub_100003ED8(a1);
  }
  else
  {
    if ((_QWORD)value == 0x5265726F74736552 && DWORD2(value) == 7630703)
    {
      sub_100003634("removing restore root annotation \"%s\"\n", a1);
      sub_1000043F4(a1);
    }
    memset(&v15, 0, sizeof(v15));
    if (!lstat(a1, &v15) && (v15.st_mode & 0xF000) == 0x4000)
    {
      v6 = sub_100003A08();
      sub_100003D60(a1, v6, v6);
      v7 = sub_100003C4C(v6);
      if (v7)
      {
        v8 = (const char *)v7;
        do
        {
          v9 = sub_100003910(a1, v8);
          sub_100004A6C();
          free(v9);
          v8 = (const char *)sub_100003C4C(v6);
        }
        while (v8);
      }
      sub_100003CE4(v6);
    }
  }
}

uint64_t start()
{
  uint64_t v0;
  char i;
  const char *v2;
  char v3;
  time_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  kern_return_t v8;
  BOOL v9;
  NSObject *global_queue;
  NSObject *v11;
  dispatch_time_t v12;
  FILE *v13;
  int *v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char v18;
  const char *v19;
  char v20;
  time_t v21;
  _BOOL8 v22;
  uint64_t v23;
  int *v24;
  char *v25;
  int *v26;
  time_t v27;
  int v28;
  std::error_code *v29;
  int *v30;
  time_t v31;
  time_t v33;
  int v34;
  stat v35;

  v0 = 0;
  for (i = 1; ; i = 0)
  {
    v2 = (&off_1000082D0)[2 * v0];
    v3 = i;
    memset(&v35, 0, sizeof(v35));
    if (!lstat(v2, &v35))
      break;
    v0 = 1;
    if ((v3 & 1) == 0)
      return 0;
  }
  v4 = time(0);
  sub_10000355C();
  sub_100003634("Started at %lu\n", v4);
  if (qword_10000C268)
    sub_10000636C();
  if (dword_10000C270)
    sub_100006344();
  v33 = v4;
  v5 = IOServiceMatching("IOWatchdog");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (MatchingService)
  {
    v7 = MatchingService;
    v8 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_10000C270);
    IOObjectRelease(v7);
    if (v8)
      v9 = 1;
    else
      v9 = dword_10000C270 == 0;
    if (v9)
    {
      sub_100003634("IOServiceOpen(kIOWatchdogUserClientOpen) failed: %d\n");
    }
    else
    {
      global_queue = dispatch_get_global_queue(25, 0);
      v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, global_queue);
      qword_10000C268 = (uint64_t)v11;
      v12 = dispatch_time(0, 20000000000);
      dispatch_source_set_timer(v11, v12, 0x4A817C800uLL, 0);
      dispatch_source_set_event_handler((dispatch_source_t)qword_10000C268, &stru_100008310);
      dispatch_activate((dispatch_object_t)qword_10000C268);
      time(0);
      sub_100003634("Started the watchdog checkin timer at %lu (%llus/%llus)\n");
    }
  }
  else
  {
    sub_100003634("IOServiceGetMatchingService(kIOWatchdogMatchingDict) failed\n");
  }
  v34 = 1;
  if (sysctlbyname("kern.vfsnspace", 0, 0, &v34, 4uLL))
  {
    v13 = __stderrp;
    v14 = __error();
    v15 = strerror(*v14);
    v16 = __error();
    fprintf(v13, "sysctlbyname(\"kern.vfsnspace\") failed: %s (%d)\n", v15, *v16);
  }
  v17 = 0;
  v18 = 1;
  do
  {
    v19 = (&off_1000082D0)[2 * v17];
    v20 = v18;
    memset(&v35, 0, sizeof(v35));
    if (!lstat(v19, &v35))
    {
      v21 = time(0);
      sub_100003634("Starting to merge from %s to %s at %lu\n", v19, "/private", v21);
      sub_100004484(v19, "/private", 0);
      v22 = rmdir(v19) == 0;
      v23 = *__error();
      v24 = __error();
      v25 = strerror(*v24);
      v26 = __error();
      sub_10000366C(v22, v23, (uint64_t)"main", (uint64_t)"rmdir", "rmdir(\"%s\") failed: %s (%d)", v19, v25, *v26);
      v27 = time(0);
      sub_100003634("Finished merging from %s to %s at %lu (%lds)\n", v19, "/private", v27, v27 - v21);
    }
    v18 = 0;
    v17 = 1;
  }
  while ((v20 & 1) != 0);
  sub_100003620();
  v28 = sub_100005D94("/private/var", 2);
  if (v28)
    sub_100003634("aks_setupallowlist_fs failed: %d\n", v28);
  if (remove((const std::__fs::filesystem::path *)"/private/var/root/.aks_migrate", v29))
  {
    v30 = __error();
    strerror(*v30);
    __error();
    sub_100003634("Failed to remove %s: %s (%d)\n");
  }
  else
  {
    sub_100003634("Removed AKS migration file at %s\n");
  }
  v31 = time(0);
  sub_100003634("Finished at %lu (%lds)\n", v31, v31 - v33);
  return 0;
}

void sub_1000050B4(id a1)
{
  kern_return_t v1;

  if ((unint64_t)qword_10000C278 >= 0x5A)
    sub_100005134(20 * qword_10000C278);
  v1 = IOConnectCallScalarMethod(dword_10000C270, 1u, 0, 0, 0, 0);
  if (v1)
    sub_100003634("IOConnectCallScalarMethod(kIOWatchdogDaemonCheckin) failed: %d\n", v1);
  else
    ++qword_10000C278;
}

void sub_100005134(uint64_t a1)
{
  FILE *v1;
  int *v2;
  char *v3;
  int *v4;
  char __str[100];

  snprintf(__str, 0x64uLL, "FinishRestoreFromBackup timed out after %llus", a1);
  fprintf(__stderrp, "%s\n", __str);
  if (reboot_np(3072, __str))
  {
    v1 = __stderrp;
    v2 = __error();
    v3 = strerror(*v2);
    v4 = __error();
    fprintf(v1, "reboot_np failed: %s (%d)\n", v3, *v4);
  }
  _os_crash("reboot_np failed");
  __break(1u);
}

char *sub_1000051CC(char *result, uint64_t a2, uint64_t a3)
{
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_info;
  char *v9[2];

  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      v5 = (FTS *)result;
      v6 = fts_read((FTS *)result);
      if (v6)
      {
        v7 = v6;
        do
        {
          fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0)
                  fts_set(v5, v7, 4);
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

uint64_t sub_1000052C8()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL4 v3;
  unsigned int v4;
  size_t __len;
  char __big[1024];

  v0 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/filesystems");
  if (v0)
  {
    v1 = v0;
    CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), kCFAllocatorDefault, 0);
    v3 = CFProperty != 0;
    if (CFProperty)
      CFRelease(CFProperty);
    IOObjectRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  __len = 1023;
  bzero(__big, 0x400uLL);
  if ((byte_10000C280 & 1) == 0)
  {
    if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
      byte_10000C281 = 1;
    byte_10000C280 = 1;
  }
  v4 = byte_10000C281;
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s ioreg: %d, boot_arg: %d%s\n", "aks", (const char *)&unk_10000752D, (const char *)&unk_10000752D, (const char *)&unk_10000752D, "aks_fs_supports_enhanced_apfs", ":", 437, (const char *)&unk_10000752D, 0, (const char *)&unk_10000752D, v3, byte_10000C281, (const char *)&unk_10000752D);
  return v3 | v4;
}

uint64_t sub_100005448(const char *a1)
{
  statfs v3;

  bzero(&v3, 0x878uLL);
  if (!statfs(a1, &v3) && (v3.f_flags & 0x80) != 0)
    return 1;
  fprintf(__stderrp, "mount point (%s) does not support Data Protection", a1);
  return 0;
}

uint64_t sub_1000054E4(const char *a1, const char *a2, char a3)
{
  uint64_t result;
  int v7;
  char __str[1024];

  result = sub_100005448(a1);
  if ((_DWORD)result)
  {
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "%s/%s", a1, a2);
    if ((a3 & 1) != 0)
      fprintf(__stdoutp, "checking path: %s\n", __str);
    v7 = access(__str, 4) | a3 & 2;
    result = v7 != 0;
    if ((a3 & 1) != 0 && !v7)
    {
      fprintf(__stdoutp, "%s has already been bootstrapped\n", a1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000055E0(const char *a1, char a2, uint64_t a3, uint64_t a4, uid_t a5, gid_t a6)
{
  uint64_t v10;
  unsigned __int16 *v11;
  FILE *v12;
  int *v13;
  unsigned int v14;
  FILE *v15;
  int *v16;
  char *v17;
  const char *v18;
  uid_t pw_uid;
  const char *v20;
  gid_t v21;
  FILE *v22;
  int *v23;
  char *v24;
  FILE *v25;
  int *v26;
  int *v27;
  FILE *v28;
  int *v29;
  stat v33;
  passwd v34;
  passwd *v35;
  char __str[1024];
  char v37[4096];

  bzero(__str, 0x400uLL);
  v10 = 0;
  if (a4)
  {
    v11 = (unsigned __int16 *)(a3 + 20);
    do
    {
      if ((*(_BYTE *)(v11 - 2) & 8) == 0)
      {
        memset(&v33, 0, sizeof(v33));
        snprintf(__str, 0x400uLL, "%s%s", a1, *(const char **)(v11 - 10));
        if (!stat(__str, &v33))
          goto LABEL_19;
        if (mkpath_np(__str, *v11))
        {
          v12 = __stderrp;
          v13 = __error();
          strerror(*v13);
          fprintf(v12, "failed to create: %s (%s)\n");
        }
        else
        {
          v14 = *v11;
          if (v14 >= 0x200 && chmod(__str, v14))
          {
            v15 = __stderrp;
            v16 = __error();
            v17 = strerror(*v16);
            fprintf(v15, "failed to change permissions on: %s (%s)\n", __str, v17);
          }
          v18 = *(const char **)(v11 + 2);
          pw_uid = a5;
          if (v18)
          {
            bzero(v37, 0x1000uLL);
            v35 = 0;
            memset(&v34, 0, sizeof(v34));
            if (getpwnam_r(v18, &v34, v37, 0x1000uLL, &v35))
            {
              pw_uid = a5;
              if (*__error())
              {
                v25 = __stderrp;
                v26 = __error();
                strerror(*v26);
                fprintf(v25, "failed to get uid for user '%s'(%s)\n");
                goto LABEL_25;
              }
            }
            else
            {
              pw_uid = v35->pw_uid;
            }
          }
          v20 = *(const char **)(v11 + 6);
          v21 = a6;
          if (!v20)
            goto LABEL_16;
          bzero(v37, 0x1000uLL);
          memset(&v34, 0, 32);
          v35 = 0;
          if (!getgrnam_r(v20, (group *)&v34, v37, 0x1000uLL, (group **)&v35))
          {
            v21 = v35->pw_uid;
LABEL_16:
            if (chown(__str, pw_uid, v21))
            {
              v22 = __stderrp;
              v23 = __error();
              v24 = strerror(*v23);
              fprintf(v22, "failed to change ownership on: %s (%s)\n", __str, v24);
            }
            stat(__str, &v33);
LABEL_19:
            if ((v33.st_mode & 0xF000) == 0x4000)
            {
              if ((*(_BYTE *)(v11 - 2) & 1) != 0)
              {
                if (sub_100005FF0(__str, -1, *((_DWORD *)v11 + 5), a2))
                  v10 = 0xFFFFFFFFLL;
                else
                  v10 = v10;
              }
            }
            else
            {
              fprintf(__stderrp, "failed %s is not a directory\n");
            }
            goto LABEL_25;
          }
          v27 = __error();
          v21 = a6;
          if (!*v27)
            goto LABEL_16;
          v28 = __stderrp;
          v29 = __error();
          strerror(*v29);
          fprintf(v28, "failed to get gid for group '%s' (%s)\n");
        }
      }
LABEL_25:
      v11 += 24;
      --a4;
    }
    while (a4);
  }
  return v10;
}

uint64_t sub_100005900(const char *a1, const char *a2)
{
  int v4;
  FILE *v6;
  int *v7;
  char *v8;
  char __str[1024];

  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/%s", a1, a2);
  v4 = open(__str, 513, 420);
  if (v4 != -1)
    return close(v4);
  v6 = __stderrp;
  v7 = __error();
  v8 = strerror(*v7);
  return fprintf(v6, "Could not create marker file: %s (%s)\n", __str, v8);
}

uint64_t sub_1000059D4(const char *a1, char a2)
{
  uint64_t result;
  char __str[1024];
  char v6[1024];

  if (!a1)
    return 22;
  bzero(v6, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(a1, v6))
    return 0xFFFFFFFFLL;
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/mobile", v6);
  result = sub_1000054E4(v6, "root/.bootstrapped", a2);
  if (!(_DWORD)result)
    return result;
  if (sub_1000055E0(v6, a2, (uint64_t)&off_100008330, 35, 0, 0)
    || (sub_1000052C8() & 1) == 0
    && sub_1000055E0(__str, a2, (uint64_t)&off_1000089C0, 72, 0x1F5u, 0x1F5u))
  {
    return 0xFFFFFFFFLL;
  }
  sub_100005900(v6, "root/.bootstrapped");
  return 0;
}

uint64_t sub_100005B14(const char *a1, char a2, const char *a3, int *a4)
{
  int v8;
  int v9;
  FILE *v10;
  char __str[1024];

  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/%s", a1, a3);
  v8 = open_dprotected_np(__str, 514, 4, 0, 420);
  if (v8 == -1)
    return 0;
  v9 = v8;
  if ((a2 & 2) == 0)
  {
    if (!sub_10000612C(v8, 0x34u))
    {
      if (qword_10000C288)
        v10 = (FILE *)qword_10000C288;
      else
        v10 = __stdoutp;
      fprintf(v10, "%s has different allowlist needed=%c\n", a1, 52);
      goto LABEL_8;
    }
    close(v9);
    return 0;
  }
LABEL_8:
  *a4 = v9;
  return 1;
}

void sub_100005C28(const char *a1, int a2, uint64_t a3, uint64_t a4)
{
  _DWORD *i;
  FILE *v9;
  _QWORD v10[4];
  int v11;
  char __str[1025];

  bzero(__str, 0x401uLL);
  if (a4)
  {
    for (i = (_DWORD *)(a3 + 16); ; i += 12)
    {
      snprintf(__str, 0x401uLL, "%s%s", a1, *((const char **)i - 2));
      if ((*i & 2) != 0)
        break;
      if (qword_10000C288)
        v9 = (FILE *)qword_10000C288;
      else
        v9 = __stdoutp;
      if ((*i & 4) == 0)
        goto LABEL_12;
      fprintf(v9, "Traversing hierarchy: %s\n", __str);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 0x40000000;
      v10[2] = sub_100006228;
      v10[3] = &unk_100009740;
      v11 = a2 | 3;
      sub_1000051CC(__str, (uint64_t)v10, 0);
LABEL_13:
      if (!--a4)
        return;
    }
    if (qword_10000C288)
      v9 = (FILE *)qword_10000C288;
    else
      v9 = __stdoutp;
LABEL_12:
    fprintf(v9, "SKIPPED: %s\n", __str);
    goto LABEL_13;
  }
}

uint64_t sub_100005D94(const char *a1, int a2)
{
  FILE *v4;
  FILE *v5;
  FILE *v6;
  std::error_code *v7;
  int v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  char __str[1024];
  char v15[1024];
  std::__fs::filesystem::path __from;
  std::__fs::filesystem::path __to;

  v13 = -1;
  bzero(&__to, 0x400uLL);
  bzero(&__from, 0x400uLL);
  bzero(v15, 0x400uLL);
  bzero(__str, 0x400uLL);
  snprintf(__str, 0x400uLL, "%s/mobile", a1);
  snprintf(v15, 0x400uLL, "%s/tmp", a1);
  if (sub_100005FF0(v15, -1, 4, 0))
    fprintf(__stderrp, "Unable to set %s to class D!", v15);
  v4 = fopen("/var/logs/AKSSetup.log", "w+");
  v5 = v4;
  v6 = __stdoutp;
  if (v4)
    v6 = v4;
  qword_10000C288 = (uint64_t)v6;
  sub_1000059D4(a1, a2 | 3);
  snprintf((char *)&__from, 0x400uLL, "%s/root/.aks_whitelist", a1);
  snprintf((char *)&__to, 0x400uLL, "%s/root/.aks_allowlist", a1);
  rename(&__from, &__to, v7);
  if (sub_100005B14(a1, a2, "root/.aks_allowlist", &v13))
  {
    sub_100005C28(a1, a2, (uint64_t)&off_100008330, 35);
    if ((sub_1000052C8() & 1) == 0)
      sub_100005C28(__str, a2, (uint64_t)&off_1000089C0, 72);
    v8 = v13;
    v9 = qword_10000C288 ? (FILE *)qword_10000C288 : __stdoutp;
    fprintf(v9, "%s has been allow listed with version:%c\n", a1, 52);
    v10 = sub_1000061B0(v8, 52);
    if ((_DWORD)v10)
    {
      v11 = v10;
      if (!v5)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  v11 = 0;
  if (v5)
LABEL_13:
    fclose(v5);
LABEL_14:
  qword_10000C288 = (uint64_t)__stdoutp;
  return v11;
}

uint64_t sub_100005FF0(const char *a1, int a2, int a3, char a4)
{
  int *v8;
  uint64_t v9;
  FILE *v10;
  char *v11;
  int v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v15 = xmmword_1000067B0;
  v14 = 0;
  if (getattrlist(a1, &v15, &v14, 8uLL, 0))
    return *__error();
  if (HIDWORD(v14) == a3 || a2 != -1 && HIDWORD(v14) != a2)
    return 0;
  if (a2 == -1)
  {
    if ((a4 & 1) != 0)
      fprintf(__stdoutp, "%s set %i\n");
  }
  else if ((a4 & 1) != 0)
  {
    fprintf(__stdoutp, "%s update %i -> %i\n");
  }
  v13 = a3;
  if (!setattrlist(a1, &v15, &v13, 4uLL, 0))
    return 0;
  v8 = __error();
  v9 = *v8;
  v10 = __stderrp;
  v11 = strerror(*v8);
  fprintf(v10, "failed (%s) to update class for %s\n", v11, a1);
  return v9;
}

BOOL sub_10000612C(int a1, unsigned __int8 a2)
{
  int v3;
  FILE *v5;
  int *v6;
  char *v7;
  unsigned __int8 v8;

  v8 = a2;
  v3 = read(a1, &v8, 1uLL);
  if (v3 == 1)
    return (char)v8 == a2;
  if (v3 == -1)
  {
    v5 = __stderrp;
    v6 = __error();
    v7 = strerror(*v6);
    fprintf(v5, "failed to read version file (%s)\n", v7);
  }
  return 0;
}

uint64_t sub_1000061B0(int a1, char a2)
{
  int *v2;
  uint64_t v3;
  FILE *v4;
  char *v5;
  char __buf;

  __buf = a2;
  if (pwrite(a1, &__buf, 1uLL, 0) != -1)
    return 0;
  v2 = __error();
  v3 = *v2;
  v4 = __stderrp;
  v5 = strerror(*v2);
  fprintf(v4, "failed to read version file (%s)\n", v5);
  return v3;
}

uint64_t sub_100006228(uint64_t a1, uint64_t a2)
{
  sub_100005FF0(*(const char **)(a2 + 48), -1, 4, *(_DWORD *)(a1 + 32));
  return 1;
}

void sub_100006254()
{
  __assert_rtn("copy_string_by_appending_path", "restore_util.c", 180, "buffer");
}

void sub_10000627C()
{
  __assert_rtn("name_list_new", "restore_util.c", 199, "list");
}

void sub_1000062A4()
{
  __assert_rtn("name_list_add", "restore_util.c", 220, "names");
}

void sub_1000062CC()
{
  __assert_rtn("name_list_add", "restore_util.c", 210, "list");
}

void sub_1000062F4()
{
  __assert_rtn("name_list_next_item", "restore_util.c", 235, "list");
}

void sub_10000631C()
{
  __assert_rtn("name_list_free", "restore_util.c", 249, "list");
}

void sub_100006344()
{
  __assert_rtn("start_watchdog_checkin_timer", "restore_main.c", 95, "watchdog_kext_connection == IO_OBJECT_NULL");
}

void sub_10000636C()
{
  __assert_rtn("start_watchdog_checkin_timer", "restore_main.c", 94, "watchdog_checkin_timer == NULL");
}
